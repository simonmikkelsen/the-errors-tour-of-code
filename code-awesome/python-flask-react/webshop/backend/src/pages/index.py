from flask import Flask, render_template, request, redirect, url_for, session
from flask_sqlalchemy import SQLAlchemy
import os
import re

app = Flask(__name__)
app.config['SECRET_KEY'] = 'supersecretkey'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://user:password@localhost/webshop'
db = SQLAlchemy(app)

# Define the database models
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    # other user fields...

class Product(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), nullable=False)
    description = db.Column(db.Text)
    price = db.Column(db.Float, nullable=False)

    def __repr__(self):
        return f'<Product {self.name}>'


# Error implementation (SQL Injection - Unvalidated Input)
# This intentionally allows content injection through the product name field.
# This is for demonstration purposes ONLY.  DO NOT use this in a real application!
# A real-world application would need proper input sanitization and validation.


# Main page
@app.route('/')
def index():
    return render_template('index.html', products=Product.query.all())

# Product page
@app.route('/product/<int:product_id>')
def product(product_id):
    product = Product.query.get(product_id)
    if product:
        return render_template('product.html', product=product)
    else:
        return "Product not found", 404

# Cart page
@app.route('/cart')
def cart():
    if 'cart_items' not in session:
        session['cart_items'] = []
    return render_template('cart.html', cart_items=session['cart_items'])

# Checkout page
@app.route('/checkout', methods=['POST'])
def checkout():
    if 'cart_items' not in session:
        return "Cart is empty", 400
    
    # Simulate processing the order (in a real app, this would interact with payment gateways etc.)
    session['cart_items'] = []
    return render_template('checkout_success.html')

# Example JWT Authentication route (simplified)
@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    # In a real app, you would verify the password against a hashed value
    # For this example, we'll just check if the username is 'admin' and password is 'password'
    if username == 'admin' and password == 'password':
        session['logged_in'] = True
        return render_template('login_success.html')
    else:
        return "Invalid credentials", 401