from flask import Flask, render_template, request, redirect, url_for, session
from flask_session import Session
from io import BytesIO
import base64
from functools import lru_cache
import uuid
import hashlib
import sqlite3
import os
from datetime import datetime

app = Flask(__name__)
app.config['SESSION_PERMANENTID'] = False
app.config['SESSION_FILE_STORE_PATH'] = './tmp'
app.config['SESSION_TYPE'] = 'filesystem'
app.config['SECRET_KEY'] = 'secret_key_for_super_dating'  # Replace with a strong key in production

# Initialize Flask Session
Session(app)

# --- Database Setup ---
def create_db():
    db_file = 'super_dating.db'
    conn = sqlite3.connect(db_file)
    cursor = conn.cursor()

    # Create users table
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id TEXT PRIMARY KEY,
            username TEXT UNIQUE NOT NULL,
            password TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            profile_picture TEXT
        )
    ''')

    # Create profiles table
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS profiles (
            id TEXT PRIMARY KEY,
            user_id TEXT NOT NULL,
            bio TEXT,
            interests TEXT,
            FOREIGN KEY (user_id) REFERENCES users(id)
        )
    ''')

    # Create messages table
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS messages (
            id TEXT PRIMARY KEY,
            sender_id TEXT NOT NULL,
            receiver_id TEXT NOT NULL,
            content TEXT NOT NULL,
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
        )
    ''')

    conn.commit()
    conn.close()

create_db()

# --- Utility Functions ---
def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

# --- Backend Routes ---
@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        email = request.form.get('email')

        hashed_password = hash_password(password)

        user_id = str(uuid.uuid4())

        # Check if user exists
        conn = sqlite3.connect('super_dating.db')
        cursor = conn.cursor()
        cursor.execute('SELECT id, username FROM users WHERE username = ?', (username,))
        user = cursor.fetchone()
        conn.close()

        if user:
            return render_template('register_fail.html', username=username)

        cursor.execute('INSERT INTO users (id, username, password, email) VALUES (?, ?, ?, ?)',
                       (user_id, username, hashed_password, email))
        conn.commit()

        return render_template('register_success.html', username=username)

    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        conn = sqlite3.connect('super_dating.db')
        cursor = conn.cursor()
        cursor.execute('SELECT id, username, password FROM users WHERE username = ?', (username,))
        user = cursor.fetchone()
        conn.close()

        if user:
            hashed_password = hash_password(password)
            if hashed_password == user['password']:
                session['user_id'] = user['id']
                return render_template('login_success.html')
            else:
                return render_template('login_fail.html')
        else:
            return render_template('login_fail.html')

    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('user_id', None)
    return redirect(url_for('login'))

@app.route('/profile')
def profile():
    if 'user_id' in session:
        return render_template('profile.html', user_id=session['user_id'])
    return redirect(url_for('login'))

@app.route('/messages')
def messages():
    if 'user_id' in session:
        # Retrieve all messages for the logged-in user
        messages = []
        conn = sqlite3.connect('super_dating.db')
        cursor = conn.cursor()
        cursor.execute("SELECT m.id, m.sender_id, m.receiver_id, m.content, m.timestamp FROM messages m WHERE (m.sender_id = ? OR m.receiver_id = ?)", (session['user_id'], session['user_id']))
        messages = cursor.fetchall()
        conn.close()

        for message in messages:
            message_data = {
                'id': message[0],
                'sender_id': message[1],
                'receiver_id': message[2],
                'content': message[3],
                'timestamp': message[4]
            }
            messages.append(message_data)

        return render_template('messages.html', messages=messages)
    return redirect(url_for('login'))

@app.route('/send_message', methods=['POST'])
def send_message():
    if 'user_id' in session:
        receiver_id = request.form.get('receiver_id')
        content = request.form.get('content')

        if receiver_id and content:
            conn = sqlite3.connect('super_dating.db')
            cursor = conn.cursor()
            cursor.execute("INSERT INTO messages (sender_id, receiver_id, content) VALUES (?, ?, ?)", (session['user_id'], receiver_id, content))
            conn.commit()
            conn.close()
            return redirect(url_for('messages'))
        else:
            return "Invalid receiver_id or content"
    else:
        return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)