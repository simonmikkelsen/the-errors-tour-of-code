from flask import Flask, render_template, request, session, redirect, url_for, flash
from flask_session import Session
from functools import reduce
import os
import re
import sqlite3
import secrets
from io import BytesIO
from PIL import Image, ImageDraw, ImageFont

app = Flask(__name__)
app.config['SESSION_PERMANENT'] = False
app.config['SESSION_FILE_DIR'] = '/dev/null'  # Disable session file saving
app.config['SECRET_KEY'] = secrets.token_urlsafe(32)
Session(app)

# Database setup (using SQLite for simplicity)
DATABASE = 'dating_profiles.db'
def create_database():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS profiles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            age INTEGER NOT NULL,
            bio TEXT,
            image BLOB
        )
    ''')
    conn.commit()
    conn.close()

create_database()


# Function to handle content injection (simple example)
def sanitize_text(text):
    """
    A very basic sanitization function.  This is for demonstration purposes
    and is NOT secure for production use.
    """
    return re.sub(r'[<>;"]', '', text)

# Mock profile data (for demonstration)
def get_profiles():
    profiles = [
        {'id': 1, 'name': 'Cute Kitten', 'age': 25, 'bio': 'Loves to cuddle and play.', 'image': b'...' },
        {'id': 2, 'name': 'Fluffy Bunny', 'age': 30, 'bio': 'Enjoys carrots and hopping.', 'image': b'...' },
        {'id': 3, 'name': 'Sleepy Puppy', 'age': 22, 'bio': 'Always dreaming of treats.', 'image': b'...' }
    ]
    return profiles


# Route for the index page (front_page)
@app.route('/', methods=['get', 'post'])
def index():
    if request.method == 'POST':
        # Handle form submission (e.g., to add a new profile)
        name = request.form.get('name')
        age = int(request.form.get('age'))
        bio = request.form.get('bio')

        # Basic validation (improve this!)
        if not name or not age:
            flash('Please fill in all fields.')
            return render_template('index.html', profiles=get_profiles())

        # Simulate adding a profile to the database
        new_profile = {
            'id': len(get_profiles()) + 1,
            'name': name,
            'age': age,
            'bio': bio,
            'image': b''  # Placeholder for image
        }

        # In a real app, you'd save this to the database
        # profiles.append(new_profile)

        flash('Profile added successfully!')
        return render_template('index.html', profiles=get_profiles())

    return render_template('index.html', profiles=get_profiles())


if __name__ == '__main__':
    app.run(debug=True)