from flask import Flask, request, jsonify
from flask_cors import CORS
import sqlite3
import os
import secrets
import re

app = Flask(__name__)
CORS(app)

DATABASE = 'ticket_database.db'

def get_db():
    db = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db

def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()

def clear_db():
    db = get_db()
    db.execute("DELETE FROM events")
    db.execute("DELETE FROM users")
    db.commit()


def content_injection_test():
    # This is a deliberately insecure example.
    user_input = request.args.get('user_input', '')
    if user_input:
        print(f"WARNING: Potential content injection attempt: {user_input}")
        # In a real application, you would sanitize and validate this input
        # VERY carefully before using it in any database query.
        # For demonstration purposes only - DO NOT USE IN PRODUCTION.
        # You would check for things like SQL injection patterns, XSS, etc.
        # A proper approach would involve escaping properly.
        #print("User input:", user_input)  # DON'T DO THIS IN REAL CODE!
        pass # Replace with proper sanitization in a real application.



# Initialize the database if it doesn't exist
if not os.path.exists(DATABASE):
    init_db()

# Route to create a new event
@app.route('/events', methods=['POST'])
def create_event():
    try:
        data = request.get_json()
        name = data['name']
        description = data['description']
        price = float(data['price'])
        date = data['date']
        
        db = get_db()
        cursor = db.cursor()
        cursor.execute("INSERT INTO events (name, description, price, date) VALUES (?, ?, ?, ?)",
                       (name, description, price, date))
        db.commit()
        return jsonify({'message': 'Event created successfully!'}), 201
    except Exception as e:
        print(f"Error creating event: {e}")
        return jsonify({'error': 'Failed to create event'}), 500

# Route to get all events
@app.route('/events', methods=['GET'])
def get_all_events():
    db = get_db()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM events")
    events = cursor.fetchall()
    event_list = []
    for event in events:
        event_list.append({
            'id': event['id'],
            'name': event['name'],
            'description': event['description'],
            'price': event['price'],
            'date': event['date']
        })
    return jsonify(event_list), 200

# Route to get an event by ID
@app.route('/events/<int:event_id>', methods=['GET'])
def get_event(event_id):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM events WHERE id = ?", (event_id,))
    event = cursor.fetchone()
    if event:
        return jsonify({
            'id': event['id'],
            'name': event['name'],
            'description': event['description'],
            'price': event['price'],
            'date': event['date']
        }), 200
    else:
        return jsonify({'error': 'Event not found'}), 404

# Route for user authentication (extremely simplified and insecure)
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')
    
    # In a real application, you would hash the password and compare
    # the hash to the stored hash.  This is just a placeholder.
    
    if username == 'admin' and password == 'password':
        return jsonify({'message': 'Login successful!'}), 200
    else:
        return jsonify({'error': 'Invalid credentials'}), 401

# Route to generate a new password.
@app.route('/generate_password', methods=['POST'])
def generate_password():
    length = int(request.form.get('length', 16))
    characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()'
    password = ''.join(secrets.choice(characters) for i in range(length))
    return jsonify({'password': password})

if __name__ == '__main__':
    content_injection_test() # Run the content injection test
    app.run(debug=True)