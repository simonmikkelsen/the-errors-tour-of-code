from flask import Flask, render_template, request, session, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from itsdangerous import URLSafeTimedSerializer
import os
import uuid

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///webshop.db'
app.config['SECRET_KEY'] = 'super secret key'
db = SQLAlchemy(app)

# Error Injection - Simulating a database error
def simulate_db_error():
    raise Exception("Database connection failed - Potential SQL Injection Vulnerability")

# Serializer for JWT (for demonstration - not fully implemented)
serializer = URLSafeTimedSerializer(app.config['SECRET_KEY'])

# Define a simple product model
class Product(db.Model):
    id = db.Column(str, primary_key=True)
    name = db.Column(db.String(100))
    price = db.Column(db.Float)

    def __repr__(self):
        return f'<Product {self.name}>'

# Cart Model
class Cart(db.Model):
    id = db.Column(str, primary_key=True)
    user_id = db.Column(str)
    items = db.Column(db.JSON) # Store cart items as a JSON string
    
    def __repr__(self):
        return f'<Cart {self.user_id}>'


# Initialize the database
with app.app_context():
    db.init_app(app)
    db.create_all()

# Route for the cart page
@app.route('/cart')
def cart():
    # Get the user ID from the session (replace with actual session handling)
    user_id = 'user123'  # Placeholder for demonstration
    
    # Retrieve the cart for the user (or create a new one)
    cart = Cart.query.filter_by(user_id=user_id).first()
    if not cart:
        cart = Cart(user_id=user_id, items="{}" ) # Create a new cart with empty items
        db.session.add(cart)
        db.session.commit()

    # Render the cart template, passing the cart data
    return render_template('cart.html', cart=cart.items)



# Example route to add an item to the cart (for demonstration)
@app.route('/add_to_cart', methods=['POST'])
def add_to_cart():
    product_id = request.form.get('product_id')
    quantity = int(request.form.get('quantity'))

    # Simulate database interaction (replace with actual database logic)
    try:
        #This part can be vulnerable
        simulate_db_error()
    except Exception as e:
        print(f"Database error: {e}")
        return "Database error"
    
    return "Item added to cart"



if __name__ == '__main__':
    app.run(debug=True)