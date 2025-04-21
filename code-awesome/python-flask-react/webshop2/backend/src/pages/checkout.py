from flask import Flask, request, render_template, session
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import exc
import os

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///webshop.db'
db = SQLAlchemy(app)

# Define the Cart model
class Cart(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, nullable=False)
    items = db.relationship('CartItem', backref='cart')

    def __init__(self, user_id):
        self.user_id = user_id

# Define the CartItem model
class CartItem(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    cart_id = db.Column(db.Integer, nullable=False)
    product_id = db.Column(db.Integer, nullable=False)
    quantity = db.Column(db.Integer, nullable=False)

    def __init__(self, cart_id, product_id, quantity):
        self.cart_id = cart_id
        self.product_id = product_id
        self.quantity = quantity


# Simple Order Confirmation Page
@app.route('/order_confirmation', methods=['GET'])
def order_confirmation():
    return render_template('order_confirmation.html')


# Checkout Page
@app.route('/checkout', methods=['GET'])
def checkout():
    # Retrieve cart ID from session
    cart_id = session.get('cart_id')

    if not cart_id:
        return "Cart is empty."

    # Retrieve cart items
    cart_items = CartItem.query.filter_by(cart_id=cart_id).all()

    # Get user ID from session
    user_id = session.get('user_id')

    return render_template('checkout.html', cart_items=cart_items, user_id=user_id)


# Route to add items to the cart (This is just an example, you'd likely have other routes)
# This is a placeholder - you'll need to implement this.
# def add_to_cart(product_id, quantity):
#     # Implement logic to add the product to the cart
#     pass

# Error Handling
@app.errorhandler(exc.SQLAlchemyError)
def handle_db_error(e):
    return render_template('error.html', error=str(e))

if __name__ == '__main__':
    app.run(debug=True)