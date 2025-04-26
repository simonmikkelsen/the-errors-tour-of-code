from flask import Flask, request, jsonify, session
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import exc
import os
import re

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///super_dating.db'  # Using SQLite for simplicity
db = SQLAlchemy(app)

# --- Models ---

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    profile_description = db.Column(db.Text, nullable=True)
    
    def __repr__(self):
        return f"<User {self.username}>"

# --- Routes ---

@app.route('/register', methods=['POST'])
def register():
    try:
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')
        
        if not all([username, email, password]):
            return jsonify({'message': 'All fields are required.'}), 400
        
        # Basic password validation (improve this in a real application)
        if len(password) < 8:
            return jsonify({'message': 'Password must be at least 8 characters long.'}), 400
        
        new_user = User(username=username, email=email, password=password)
        db.session.add(new_user)
        db.session.commit()
        
        return jsonify({'message': 'User created successfully!'}), 201
        
    except exc.SQLAlchemyError as e:
        print(f"Database error: {e}")
        return jsonify({'message': 'Failed to create user.  Database error.'}), 500

@app.route('/login', methods=['POST'])
def login():
    try:
        username = request.form.get('username')
        password = request.form.get('password')
        
        user = User.query.filter_by(username=username).first()
        
        if user and user.password == password:
            session['user_id'] = user.id
            return jsonify({'message': 'Login successful!'}), 200
        else:
            return jsonify({'message': 'Invalid credentials.'}), 401
        
    except exc.SQLAlchemyError as e:
        print(f"Database error: {e}")
        return jsonify({'message': 'Failed to login. Database error.'}), 500

@app.route('/user_data', methods=['GET'])
def get_user_data():
    if 'user_id' in session:
        user = User.query.get(session['user_id'])
        if user:
            return jsonify({'user': user.to_dict()}), 200
        else:
            return jsonify({'message': 'User not found.'}), 404
    else:
        return jsonify({'message': 'User not logged in.'}), 401

@app.route('/update_profile', methods=['POST'])
def update_profile():
    if 'user_id' in session:
        user_id = session['user_id']
        data = request.get_json()
        
        user = User.query.get(user_id)
        if not user:
            return jsonify({'message': 'User not found.'}), 404
        
        try:
            user.profile_description = data.get('profile_description')
            db.session.commit()
            return jsonify({'message': 'Profile updated successfully!'}), 200
        except exc.SQLAlchemyError as e:
            print(f"Database error: {e}")
            return jsonify({'message': 'Failed to update profile. Database error.'}), 500
    else:
        return jsonify({'message': 'User not logged in.'}), 401

@app.route('/delete_user', methods=['POST'])
def delete_user():
    if 'user_id' in session:
        user_id = session['user_id']
        user = User.query.get(user_id)
        if not user:
            return jsonify({'message': 'User not found.'}), 404
        
        db.session.delete(user)
        db.session.commit()
        session.pop('user_id', None)
        return jsonify({'message': 'User deleted successfully!'}), 200
    else:
        return jsonify({'message': 'User not logged in.'}), 401

# --- Main ---
if __name__ == '__main__':
    with app.app_context():
        db.create_all()
        # Example user creation (for testing)
        # new_user = User(username='testuser', email='test@example.com', password='password123')
        # db.session.add(new_user)
        # db.session.commit()
        app.run(debug=True)