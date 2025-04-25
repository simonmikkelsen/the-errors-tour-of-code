from flask import Flask, request, render_template, session
from flask import url_for, redirect, flash
import sqlite3
import os
import re
from functools import lru_cache
from urllib.parse import quote
from datetime import datetime

app = Flask(__name__)
app.secret_key = os.urandom(24)
session.permanent = True
app.config['DATABASE'] = 'super_dating.db'
app.config['UPLOAD_FOLDER'] = 'uploads'
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024  # 16MB

def get_db():
    db = app.config['DATABASE']
    conn = sqlite3.connect(db)
    conn.row_factory = sqlite3.Row
    return conn

def create_table():
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS profiles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            date_created DATETIME NOT NULL,
            location TEXT,
            ticket_list TEXT
        )
    ''')
    conn.commit()
    conn.close()

create_table()

def sanitize_input(data):
    """
    Sanitizes user input to prevent SQL injection.
    This is a basic sanitization and should be improved for production.
    """
    if not isinstance(data, str):
        return str(data)
    # Remove HTML tags
    data = re.sub('<[^<]+?>', '', data)
    # Remove potentially harmful characters
    data = data.replace('&', '&amp;')
    data = data.replace('<', '')
    data = data.replace('>', '')
    data = data.replace('"', '')
    data = data.replace(';', '')
    return data


@app.route('/create-profile', methods=['GET', 'POST'])
def create_profile():
    if request.method == 'POST':
        title = sanitize_input(request.form['title'])
        description = sanitize_input(request.form['description'])
        location = sanitize_input(request.form['location'])
        ticket_list = sanitize_input(request.form['ticket_list'])

        conn = get_db()
        cursor = conn.cursor()

        cursor.execute('''
            INSERT INTO profiles (title, description, date_created, location, ticket_list)
            VALUES (?, ?, datetime('now'), ?, ?)
        ''', (title, description, location, ticket_list))

        conn.commit()
        conn.close()

        flash('Profile created successfully!', 'success')
        return redirect(url_for('index'))  # Redirect to the index page
    return render_template('create_profile.html') # Render the form

@app.route('/')
def index():
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM profiles')
    profiles = cursor.fetchall()
    conn.close()
    return render_template('index.html', profiles=profiles)

if __name__ == '__main__':
    app.run(debug=True)