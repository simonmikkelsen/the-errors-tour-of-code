from flask import Flask, render_template, request, redirect, url_for, session, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import create_user, jwt_token_in_request, get_user
import os
import secrets
import hashlib

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL', 'postgresql://user:password@localhost/webshop')
app.config['JWT_SECRET_KEY'] = secrets.token_urlsafe(16)
app.config['JWT_REFRESH_TOKEN_EXPIRES'] = 3600  # 1 hour
app.config['JWT_VERIFY_EMAIL'] = False
app.config['JWT_BLACKLIST_TOKENSET'] = {'refresh'}

db = SQLAlchemy(app)

# Define the Product model
class Product(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text)
    price = db.Column(db.Float, nullable=False)
    # Example of SQL injection vulnerability - this is intentional
    sql_injection_field = db.Column(db.Text)

    def __repr__(self):
        return f'<Product {self.name}>'


# Create a user model (basic authentication)
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(255), unique=True, nullable=False)
    password = db.Column(db.Text, nullable=False)
    refresh_token = db.Column(db.Text, unique=True)


    def __repr__(self):
        return f'<User {self.username}>'


# Example route for product page
@app.route('/product/<int:product_id>')
def product_page(product_id):
    product = Product.query.get(product_id)
    if product:
        return render_template('product.html', product=product)
    else:
        return "Product not found", 404


# Example route for login
@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')

    user = User.query.filter_by(username=username).first()
    if user and user.password == hashlib.sha256(password.encode()).hexdigest():
        session['user_id'] = user.id
        # Create a refresh token
        refresh_token = session['user_id'] + str(secrets.token_urlsafe(16))
        user.refresh_token = refresh_token
        db.session.commit()
        return jsonify({'message': 'Login successful', 'refresh_token': refresh_token})
    else:
        return jsonify({'message': 'Invalid credentials'}), 401


# Example route for logout
@app.route('/logout')
def logout():
    session.pop('user_id', None)
    return jsonify({'message': 'Logout successful'})

# Example route for refresh token
@app.route('/refresh_token', methods=['POST'])
def refresh_token():
    refresh_token = request.json['refresh_token']
    user = User.query.filter_by(refresh_token=refresh_token).first()
    if user:
        # Create a new access token
        access_token = user.id + str(secrets.token_urlsafe(16))
        user.refresh_token = access_token
        db.session.commit()
        return jsonify({'access_token': access_token})
    else:
        return jsonify({'message': 'Invalid refresh token'}), 401