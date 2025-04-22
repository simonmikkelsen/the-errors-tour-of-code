from flask import Flask, render_template, request, redirect, url_for, session
import os
import secrets
from functools import wraps
import sqlite3

app = Flask(__name__)
app.secret_key = os.urandom(24)  # Change this in a production environment!

DATABASE = 'voting_app.db'

def get_db():
    db = getattr(app, 'db')
    if not isinstance(db, sqlite3.Database):
        db = sqlite3.connect(DATABASE)
        setattr(app, 'db', db)
    return db

def login_required():
    def decorator(f):
        @wraps(f)
        def wrapper(*args, **kwargs):
            if 'user_identifier' not in session:
                return redirect(url_for('login'))
            return f(session['user_identifier'])
        return wrapper

@app.route('/')
@login_required
def index():
    db = get_db()
    polls = db.execute('SELECT * FROM polls ORDER BY poll_id DESC').fetchall()
    return render_template('index.html', polls=polls)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        user_identifier = request.form['user_identifier']
        session['user_identifier'] = user_identifier
        return redirect(url_for('index'))
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('user_identifier', None)
    return redirect(url_for('login'))

@app.route('/poll_page', methods=['GET', 'POST'])
@login_required
def poll_page():
    if request.method == 'POST':
        poll_text = request.form['poll_text']
        db = get_db()
        db.execute('INSERT INTO polls (poll_text) VALUES (?)', (poll_text,))
        db.commit()
        return redirect(url_for('index'))
    return render_template('poll_page.html')

if __name__ == '__main__':
    app.run(debug=True)