from flask import Flask, request, jsonify, session
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
import os
import re
from urllib.parse import unquote

app = Flask(__name__)
app.config['SECRET_KEY'] = 'super_dating_secret_key'  # Change this in production!
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL', 'postgresql://user:password@localhost:5432/super_dating')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

CORS(app)

# Models
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(255), unique=True)
    email = db.Column(db.String(255))
    password = db.Column(db.String(255))
    notes = db.relationship('Note', backref='user', lazy=True)

    def __repr__(self):
        return f'<User {self.username}>'


class Note(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    content = db.Column(db.Text)

    def __repr__(self):
        return f'<Note {self.content}>'

# Sample Data (for demonstration)
@app.before_first_request
def setup_db():
    db.create_all()

    # Create some users
    user1 = User(username="Alice", email="alice@example.com", password="hashed_password1")
    user2 = User(username="Bob", email="bob@example.com", password="hashed_password2")
    db.session.add(user1)
    db.session.add(user2)
    db.session.commit()

    # Create some notes for those users
    note1 = Note(user_id=user1.id, content="This is Alice's first note.")
    note2 = Note(user_id=user2.id, content="Bob's secret message.")
    db.session.add(note1)
    db.session.add(note2)
    db.session.commit()


# Routes

@app.route('/users', methods=['POST'])
def create_user():
    data = request.get_json()
    new_user = User(username=data['username'], email=data['email'], password=data['password'])
    db.session.add(new_user)
    db.session.commit()
    return jsonify({'message': 'User created successfully!'}), 201

@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    user = User.query.get(user_id)
    if user:
        return jsonify(user.__dict__), 200
    return jsonify({'message': 'User not found'}), 404

@app.route('/users/<int:user_id>/notes', methods=['POST'])
def create_note(user_id):
    data = request.get_json()
    new_note = Note(user_id=user_id, content=data['content'])
    db.session.add(new_note)
    db.session.commit()
    return jsonify({'message': 'Note created successfully!'}), 201

@app.route('/users/<int:user_id>/notes', methods=['GET'])
def get_notes(user_id):
    notes = Note.query.filter_by(user_id=user_id).all()
    return jsonify([note.__dict__ for note in notes]), 200

@app.route('/notes/<string:content>', methods=['GET'])
def get_notes_by_content(content):
    notes = Note.query.filter(Note.content.match(re.escape(content)))
    return jsonify([note.__dict__ for note in notes]), 200

@app.errorhandler(500)
def internal_server_error(e):
    return jsonify({'error': 'Internal Server Error'}), 500

if __name__ == '__main__':
    app.run(debug=True)