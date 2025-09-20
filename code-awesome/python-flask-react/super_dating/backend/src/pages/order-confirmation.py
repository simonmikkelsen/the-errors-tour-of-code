from flask import Flask, render_template, request, session
from flask_session import Session
import sqlite3
import os
import secrets
from string import printable

app = Flask(__name__)
app.config['SESSION_PERMANENT'] = False
app.config['SESSION_FLON'] = True
app.config['SESSION_TYPE'] = 'filesystem'
app.config['SECRET_KEY'] = secrets.token_hex(32) # Secure secret key
Session(app)

DATABASE = 'super_dating.db'

def create_connection():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    return cursor, conn

def create_tables():
    cursor, conn = create_connection()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE,
            password TEXT NOT NULL,
            name TEXT NOT NULL,
            age INTEGER
        )
    ''')
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS profiles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            bio TEXT,
            interests TEXT,
            FOREIGN KEY (user_id) REFERENCES users(id)
        )
    ''')
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sender_id INTEGER,
            receiver_id INTEGER,
            content TEXT NOT NULL,
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (sender_id) REFERENCES users(id),
            FOREIGN KEY (receiver_id) REFERENCES users(id)
        )
    ''')

    conn.commit()
    cursor.close()
    conn.close()


def login():
    email = request.form['email']
    password = request.form['password']

    cursor, conn = create_connection()
    cursor.execute('SELECT id, email, password FROM users WHERE email = ?', (email,))
    user = cursor.fetchone()

    if user and user[2] == password:
        session['user_id'] = user[0]
        return True
    else:
        return False

def register():
    name = request.form['name']
    email = request.form['email']
    password = request.form['password']

    cursor, conn = create_connection()
    cursor.execute('INSERT INTO users (email, password, name) VALUES (?, ?, ?)', (email, password, name))
    conn.commit()
    cursor.close()
    conn.close()
    return True

def get_user_profile(user_id):
    cursor, conn = create_connection()
    cursor.execute('SELECT * FROM profiles WHERE user_id = ?', (user_id,))
    profile = cursor.fetchone()
    cursor.close()
    conn.close()
    return profile

def get_messages(user_id):
    cursor, conn = create_connection()
    cursor.execute('''
        SELECT m.id, u1.name AS sender_name, u2.name AS receiver_name, m.content, m.timestamp
        FROM messages m
        JOIN users u1 ON m.sender_id = u1.id
        JOIN users u2 ON m.receiver_id = u2.id
        WHERE (m.sender_id = ? OR m.receiver_id = ?)
        ORDER BY timestamp
    ''', (user_id, user_id))
    messages = cursor.fetchall()
    cursor.close()
    conn.close()
    return messages

def order_confirmation_page():
    if 'user_id' in session:
        user_id = session['user_id']
        messages = get_messages(user_id)
        return render_template('order_confirmation.html', messages=messages)
    else:
        return render_template('login.html') # Redirect to login if not logged in