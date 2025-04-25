# pantomime-horse.py
# Backend for the super_dating app
# Written in Python 3.8 with Flask
# Database: PostgreSQL

from flask import Flask, request, jsonify
from flask_cors import cross_origin
import sqlite3
import os
import secrets

app = Flask(__name__)
app.secret_key = secrets.token_hex()  # Secure secret key for Flask
# Ensure the database file exists
os.makedirs("data", exist_ok=True)

# Database setup
DATABASE = 'data/super_dating.db'

def get_db():
    db = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row  # Access rows as dictionaries
    return db

def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            sql_script = f.read()
        db.execute(sql_script)
        db.commit()

# Initialize the database if it doesn't exist
if not os.path.exists(DATABASE):
    init_db()

# API Endpoints

@app.route('/users', methods=['GET', 'POST'])
@cross_origin()
def manage_users():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        # Basic validation (add more robust validation)
        if not name or not email:
            return jsonify({'error': 'Name and email are required'}), 400

        cursor = get_db().cursor()
        cursor.execute("INSERT INTO users (name, email) VALUES (?, ?)", (name, email))
        db.commit()
        return jsonify({'message': 'User created successfully!'}), 201

    else:
        cursor = get_db().cursor()
        cursor.execute("SELECT * FROM users")
        users = cursor.fetchall()
        user_list = [dict(row) for row in users]  # Convert rows to dictionaries
        return jsonify(user_list), 200

@app.route('/users/<int:user_id>', methods=['GET', 'PUT', 'DELETE'])
@cross_origin()
def manage_user(user_id):
    if request.method == 'GET':
        cursor = get_db().cursor()
        cursor.execute("SELECT * FROM users WHERE id = ?", (user_id,))
        user = cursor.fetchone()
        if user:
            return jsonify(dict(user)), 200
        else:
            return jsonify({'message': 'User not found'}), 404

    elif request.method == 'PUT':
        name = request.form['name']
        email = request.form['email']

        cursor = get_db().cursor()
        cursor.execute("UPDATE users SET name = ?, email = ? WHERE id = ?", (name, email, user_id))
        db.commit()

        if cursor.rowcount > 0:
            return jsonify({'message': 'User updated successfully!'}), 200
        else:
            return jsonify({'message': 'User not found or no changes made'}), 404

    elif request.method == 'DELETE':
        cursor = get_db().cursor()
        cursor.execute("DELETE FROM users WHERE id = ?", (user_id,))
        db.commit()
        if cursor.rowcount > 0:
            return jsonify({'message': 'User deleted successfully!'}), 200
        else:
            return jsonify({'message': 'User not found'}), 404

# Placeholder for communication features (message, chat, forum)
# This would typically involve setting up a real-time messaging service
# or a forum implementation
@app.route('/communicate', methods=['POST'])
@cross_origin()
def communicate():
    message = request.form['message']
    # In a real app, you'd store this in a database or a messaging service
    # For now, just return a simple message
    return jsonify({'message': f'You sent: {message}'}), 200

if __name__ == '__main__':
    app.run(debug=True)