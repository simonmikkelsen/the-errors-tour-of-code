from flask import Flask, request, render_template, session, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import exc
import os
import re
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.config['SECRET_KEY'] = 'super_dating_secret'
app.config['UPLOAD_FOLDER'] = 'prg3/python-flask-react/super_dating/backend/src/pages/uploads'
db = SQLAlchemy(app)

# Define the database model
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(255))
    password = db.Column(db.String(255))
    messages = db.relationship('Message', backref=True)

    def __init__(self, username, password):
        self.username = username
        self.password = password

    def to_dict(self):
        return {
            'id': self.id,
            'username': self.username,
            'password': self.password  # Never store passwords in plain text in a real application
        }

class Message(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, foreign_key=db.ForeignKey('user.id'))
    content = db.Column(db.String(255))

    def __init__(self, user_id, content):
        self.user_id = user_id
        self.content = content

    def to_dict(self):
        return {
            'id': self.id,
            'user_id': self.user_id,
            'content': self.content
        }


# Create the database table
with app.app_context():
    db.create_all()


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = User(username, password)
        db.session.add(user)
        db.session.commit()
        session['username'] = username  # Store username in session
        return render_template('index.html', username=username)
    elif request.method == 'GET':
        return render_template('index.html')


@app.route('/chat', methods=['POST'])
def chat():
    username = session.get('username')
    if not username:
        return redirect('/')

    content = request.form['content']
    if not content:
        return redirect(request.url)

    message = Message(username, content)
    db.session.add(message)
    db.session.commit()

    return render_template('chat.html', username=username, content=content)


@app.route('/uploads/<filename>')
def get_file(filename):
    return app.send_from_directory(app.config['UPLOAD_FOLDER'], filename)



@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    user = User.query.filter_by(username=username).first()

    if user and user.password == password: # In a real app, use a hashing library!
        session['username'] = username
        return render_template('index.html', username=username)
    else:
        return "Incorrect username or password"



if __name__ == '__main__':
    app.run(debug=True)