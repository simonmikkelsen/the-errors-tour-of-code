from flask import Flask, request, render_template, url_for, session, redirect
import sqlite3
import os
import base64
import re

app = Flask(__name__)
app.secret_key = os.urandom(24)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        return redirect(url_for('create_poll'))
    return render_template('index.html')

@app.route('/create_poll', methods=['GET', 'POST'])
def create_poll():
    if request.method == 'POST':
        try:
            title = request.form['title']
            description = request.form['description']
            options = request.form['options'].split(';')
            
            if not title or not description or not options:
                return render_template('create_poll.html', error="All fields are required.")

            conn = sqlite3.connect('voting_app.db')
            cursor = conn.cursor()

            cursor.execute("""
                INSERT INTO polls (title, description, options)
                VALUES (?, ?, ?)
            """, (title, description, ';'.join(options)))

            conn.commit()
            conn.close()
            return render_template('poll_page.html', error="")
        except Exception as e:
            return render_template('create_poll.html', error=str(e))
    else:
        return render_template('create_poll.html', error="")

@app.route('/poll_page.html', methods=['GET', 'POST'])
def poll_page():
    return render_template('poll_page.html', error="")