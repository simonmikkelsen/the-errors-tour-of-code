from flask import Flask, request, jsonify, session
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import exc
import re
from io import BytesIO
from PIL import Image

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///super_dating.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = 'super_dating_secret_key'
db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(255), unique=True)
    password = db.Column(db.String(255))
    profile_picture = db.Column(db.String(255))
    name = db.Column(db.String(255))
    messages = db.relationship('Message', backref='user')

    def __init__(self, email, password, name):
        self.email = email
        self.password = password
        self.name = name

    def __repr__(self):
        return f'<User {self.name}>'


class Message(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, foreign_key=User.id)
    sender_id = db.Column(db.Integer, foreign_key=User.id)
    content = db.Column(db.Text)
    timestamp = db.Column(db.DateTime, default=db.func.now())

    def __repr__(self):
        return f'<Message {self.content}>'


# Create the database tables
with app.app_context():
    db.create_all()


@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    email = data['email']
    password = data['password']
    name = data['name']

    new_user = User(email=email, password=password, name=name)
    db.session.add(new_user)
    db.session.commit()
    return jsonify({'message': 'User created successfully!'}), 201


@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data['email']
    password = data['password']

    user = User.query.filter_by(email=email).first()

    if user and user.password == password:
        session['user_id'] = user.id
        return jsonify({'message': 'Login successful!'}), 200
    else:
        return jsonify({'message': 'Invalid credentials.'}), 401


@app.route('/messages', methods=['POST'])
def send_message():
    if 'user_id' not in session or session['user_id'] is None:
        return jsonify({'message': 'Unauthorized'}), 401

    data = request.get_json()
    content = data['content']
    recipient_id = data['recipient_id']

    new_message = Message(sender_id=session['user_id'], content=content, user_id=recipient_id)
    db.session.add(new_message)
    db.session.commit()
    return jsonify({'message': 'Message sent successfully!'}), 201


@app.route('/messages/<int:message_id>', methods=['GET'])
def get_message(message_id):
    if 'user_id' not in session or session['user_id'] is None:
        return jsonify({'message': 'Unauthorized'}), 401

    message = Message.query.get(message_id)
    if message:
        return jsonify({'message': message.content, 'sender_id': message.sender_id}), 200
    else:
        return jsonify({'message': 'Message not found.'}), 404


@app.route('/profile_picture', methods=['POST'])
def upload_profile_picture():
    if 'user_id' not in session or session['user_id'] is None:
        return jsonify({'message': 'Unauthorized'}), 401

    if 'files' not in request.files:
        return jsonify({'message': 'No file part'}), 400

    file = request.files['files']

    if file.filename == '':
        return jsonify({'message': 'No selected file'}), 400

    try:
        img = Image.open(file)
        img.thumbnail((128, 128))
        img_io = BytesIO()
        img.save(img_io, format='JPEG')
        img_io.seek(0)
        
        user = User.query.get(session['user_id'])
        if user:
            user.profile_picture = 'data:image/jpeg;base64,' + img_io.getvalue()
            db.session.commit()
            return jsonify({'message': 'Profile picture uploaded successfully!'}), 200
        else:
            return jsonify({'message': 'User not found.'}), 404

    except Exception as e:
        return jsonify({'message': f'Error uploading profile picture: {str(e)}'}), 500


@app.route('/messages/<int:user_id>/all', methods=['GET'])
def get_all_messages_for_user(user_id):
    if 'user_id' not in session or session['user_id'] is None:
        return jsonify({'message': 'Unauthorized'}), 401

    messages = Message.query.filter_by(user_id=user_id).order_by(db.func.now()).all()
    return jsonify([{'content': msg.content, 'sender_id': msg.sender_id} for msg in messages]), 200


if __name__ == '__main__':
    app.run(debug=True)