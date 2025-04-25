from flask import Flask, request, render_template, session
from flask import url_for, redirect
from functools import wraps
import sqlite3
import os
import base64
import hashlib

app = Flask(__name__)
app.secret_key = os.urandom(24)

# Database Initialization
def init_db():
    conn = sqlite3.connect('prg3.db')
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS forums (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT UNIQUE,
            description TEXT
        )
    ''')
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS posts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            forum_id INTEGER,
            title TEXT,
            content TEXT,
            author TEXT,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    conn.commit()
    conn.close()

init_db()

# Helper function to check user authentication
def requires_auth(route):
    def decorator_func():
        if 'username' in session:
            return True
        else:
            return False
    return requires_auth(route)


# Routes
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/forums')
@requires_auth
def forums():
    cursor = sqlite3.connect('prg3.db').cursor()
    cursor.execute("SELECT * FROM forums")
    forums_data = cursor.fetchall()
    return render_template('forums.html', forums=forums_data)

@app.route('/forums/<int:forum_id>')
@requires_auth
def forum_detail(forum_id):
    cursor = sqlite3.connect('prg3.db').cursor()
    cursor.execute("SELECT * FROM posts WHERE forum_id = ?", (forum_id,))
    posts_data = cursor.fetchall()
    return render_template('forum_detail.html', forum_id=forum_id, posts=posts_data)


@app.route('/create_forum', methods=['GET', 'POST'])
@requires_auth
def create_forum():
    if request.method == 'POST':
        cursor = sqlite3.connect('prg3.db').cursor()
        cursor.execute("INSERT INTO forums (name, description) VALUES (?, ?)",
                       (request.form['name'], request.form['description']))
        conn = sqlite3.connect('prg3.db')
        cursor = conn.cursor()
        cursor.execute("SELECT last_id")
        forum_id = cursor.fetchone()[0]
        conn.close()
        return redirect(f'/forums/{forum_id}')
    return render_template('create_forum.html')


@app.route('/create_post', methods=['GET', 'POST'])
@requires_auth
def create_post():
    if request.method == 'POST':
        cursor = sqlite3.connect('prg3.db').cursor()
        cursor.execute("INSERT INTO posts (forum_id, title, content, author) VALUES (?, ?, ?, ?)",
                       (request.form['forum_id'], request.form['title'], request.form['content'], request.form['author']))
        conn = sqlite3.connect('prg3.db')
        cursor = conn.cursor()
        cursor.execute("SELECT last_id")
        post_id = cursor.fetchone()[0]
        conn.close()
        return redirect(f'/forums/{request.form[\'forum_id']}')
    return render_template('create_post.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        cursor = sqlite3.connect('prg3.db').cursor()
        cursor.execute("SELECT * FROM users WHERE username = ?", (username,))
        user_data = cursor.fetchone()

        if user_data:
            hashed_password = user_data[4]
            if hashed_password == password:
                session['username'] = username
                return redirect(url_for('index'))
            else:
                return render_template('login.html', error="Incorrect password")
        else:
            return render_template('login.html', error="User not found")

    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cursor = sqlite3.connect('prg3.db').cursor()
        cursor.execute("INSERT INTO users (username, password) VALUES (?, ?)", (username, hashlib.sha256(password.encode()).hexdigest()))
        conn = sqlite3.connect('prg3.db')
        cursor = conn.cursor()
        cursor.execute("SELECT last_id")
        user_id = cursor.fetchone()[0]
        conn.close()
        return redirect(url_for('login'))
    return render_template('register.html')

@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)