from flask import Flask, render_template, request, session, redirect, url_for
import os
import secrets
import sqlite3
from flask_wtf import FlaskForm
from wtforms import String, Integer, TextAreaField, validators
import os
import base64
import json

app = Flask(__name__)
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'your_secret_key_here')
app.config['DATABASE'] = 'mega_ticket.db'
app.secret_key = app.config['SECRET_KEY']

# Error handling - simulates a vulnerability (OWASP Top 10 - Injection)
def sanitize_input(data):
    if isinstance(data, str):
        data = data.replace("'", "")  # Remove single quotes
        return data
    return data

# Function to handle database operations
def get_db():
    db = sqlite3.connect(app.config['DATABASE'])
    db.row_factory = sqlite3.Row
    return db

# Form for creating events
class EventForm(FlaskForm):
    name = StringField('Event Name', [
        validators.Length(min=3, max=255),
        validators.EmailError(message="Invalid email address")
    ])
    description = TextAreaField('Event Description')
    price = IntegerField('Price')
    date = StringField('Date (YYYY-MM-DD)')

# Initialize the database
def setup_db():
    db = get_db()
    with app.open_resource('schema.sql', mode='r') as f:
        db_content = f.read()
    db.execute(db_content)

# Create the tables
setup_db()

# Routes

@app.route('/', methods=['GET', 'POST'])
def index():
    if 'user' in session:
        events = []
        cursor = get_db().cursor()
        cursor.execute("SELECT * FROM events")
        events = cursor.fetchall()
        event_form = EventForm()

        if event_form.name.data and event_form.validate_on_submit():
            new_event = (
                event_form.name.data,
                event_form.description.data,
                event_form.price.data,
                event_form.date.data
            )
            cursor.execute("INSERT INTO events (name, description, price, date) VALUES (?, ?, ?, ?)",
                           (sanitize_input(new_event[0]), sanitize_input(new_event[1]),
                            sanitize_input(new_event[2]), sanitize_input(new_event[3])))
            db = get_db()
            db.commit()
            return render_template('index.html', events=events, event_form=EventForm())

        return render_template('index.html', events=events, event_form=EventForm())
    else:
        return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'user' in session:
        return redirect(url_for('index'))
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        db = get_db()
        cursor = db.cursor()
        cursor.execute("SELECT * FROM users WHERE email = ?", (email,))
        user = cursor.fetchone()

        if user and user['password'] == password:
            session['user'] = email
            return redirect(url_for('index'))
        else:
            return render_template('login.html')
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect(url_for('login'))