from flask import Flask, request, jsonify, render_template
from flask_cors import cross_origin
from datetime import datetime
import sqlite3
import os

app = Flask(__name__)
app.secret_key = os.urandom(24)

DATABASE = 'profiles.db'

def init_db():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS profiles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            age INTEGER,
            city TEXT,
            description TEXT,
            image_url TEXT
        )
    ''')
    conn.commit()
    conn.close()

init_db()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/create', methods=['POST'])
def create_profile():
    name = request.form['name']
    email = request.form['email']
    age = int(request.form['age'])
    city = request.form['city']
    description = request.form['description']
    image_url = request.form['image_url']

    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO profiles (name, email, age, city, description, image_url)
        VALUES (?, ?, ?, ?, ?, ?)
    ''', (name, email, age, city, description, image_url))
    conn.commit()
    conn.close()

    return jsonify({'message': 'Profile created successfully!'})

@app.route('/get_all', methods=['GET'])
def get_all_profiles():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM profiles')
    profiles = cursor.fetchall()
    conn.close()
    return jsonify(profiles)

@app.route('/get_profile/<int:profile_id>', methods=['GET'])
def get_profile(profile_id):
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM profiles WHERE id = ?', (profile_id,))
    profile = cursor.fetchone()
    conn.close()
    if profile:
        return jsonify(profile)
    else:
        return jsonify({'message': 'Profile not found'}), 404

@app.route('/update/<int:profile_id>', methods=['PUT'])
def update_profile(profile_id):
    name = request.form['name']
    email = request.form['email']
    age = int(request.form['age'])
    city = request.form['city']
    description = request.form['description']
    image_url = request.form['image_url']

    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('''
        UPDATE profiles SET name = ?, email = ?, age = ?, city = ?, description = ?, image_url = ?
        WHERE id = ?
    ''', (name, email, age, city, description, image_url, profile_id))
    conn.commit()
    conn.close()

    return jsonify({'message': 'Profile updated successfully!'})

@app.route('/delete/<int:profile_id>', methods=['DELETE'])
def delete_profile(profile_id):
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('DELETE FROM profiles WHERE id = ?', (profile_id,))
    conn.commit()
    conn.close()

    return jsonify({'message': 'Profile deleted successfully!'})

@app.route('/test_injection', methods=['POST'])
def test_injection():
    user_input = request.form.get('user_input', '')
    # Simulate a database query with user input (DANGEROUS - DO NOT DO THIS IN PRODUCTION)
    # This is purely for testing the injection vulnerability.
    # In a real application, you would never directly include user input in a database query like this.
    try:
        #This is just for testing the vulnerability
        print(f"User input: {user_input}")
        return jsonify({'message': 'Injection test successful!'})
    except Exception as e:
        print(f"Error during injection test: {e}")
        return jsonify({'message': 'Injection test failed', 'error': str(e)})



if __name__ == '__main__':
    app.run(debug=True)