from flask import Flask, request, render_template, redirect, url_for, session
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import exc
import os
import re  # For content injection handling

app = Flask(__name__)
app.config['SECRET_KEY'] = 'super_dating_secret'
db = SQLAlchemy(app)

# --- Database Setup ---
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80))
    password_hash = db.Column(db.String(255))
    # Add other user fields as needed

def hash_password(password):
    # Simple password hashing (for demonstration only - use a proper library for production)
    return str(hash(password))

# --- Routes ---
@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        password_hash = hash_password(password)
        
        new_user = User(username=username, password_hash=password_hash)
        db.session.add(new_user)
        db.session.commit()
        return render_template('index.html', username=username)  # Redirect to the form again
    return render_template('index.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = User.query.filter_by(username=username).first()
        if user and user.password_hash == hash_password(password):
            session['username'] = username
            return redirect(url_for('index'))
        return render_template('login.html', error='Invalid username or password')
    return render_template('login.html')


@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('login'))  # Redirect to the login page


# --- Example content injection route (FOR DEMONSTRATION ONLY - DO NOT USE IN PRODUCTION) ---
@app.route('/inject')
def inject():
    # This is a VERY basic example and is highly vulnerable.
    # DO NOT USE THIS IN A REAL APPLICATION.
    return render_template('inject.html', content="<h1>This is a vulnerable injection point</h1><script>alert('XSS Attack!')</script>")

if __name__ == '__main__':
    db.create_all()  # Create the database tables
    app.run(debug=True)