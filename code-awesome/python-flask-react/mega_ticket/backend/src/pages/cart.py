from flask import Blueprint, request, jsonify
from prg3.python_flask_react.mega_ticket.backend.src.models.cart_model import Cart
from prg3.python_flask_react.mega_ticket.backend.src.utils import json_to_dict
import json
import os

cart_bp = Blueprint(__name__, __name__)

# Function to load cart data from database (simulated)
def load_cart_data(session_key):
    # In a real application, this would connect to a database
    # and fetch the cart data. For simulation, we'll use a dictionary.
    cart_data = {
        "session_key": session_key,
        "items": []
    }
    return cart_data

# Function to save cart data to database (simulated)
def save_cart_data(session_key, cart_items):
    # In a real application, this would update the database
    # This is just a placeholder.
    print(f"Saving cart data for session {session_key}: {cart_items}")

def get_cart_items(session_key):
    cart_data = load_cart_data(session_key)
    return cart_data['items']

def add_item_to_cart(session_key, item_name, quantity):
    cart_items = get_cart_items(session_key)
    
    # Simulate checking if item already exists (basic)
    for item in cart_items:
        if item['name'] == item_name:
            item['quantity'] += quantity
            return
    
    cart_items.append({
        "name": item_name,
        "quantity": quantity
    })
    return

def remove_item_from_cart(session_key, item_name):
    cart_items = get_cart_items(session_key)
    
    # Simple removal (could be more robust)
    for i, item in enumerate(cart_items):
        if item['name'] == item_name:
            del cart_items[i]
            return
    
    return

@cart_bp.route("/cart", methods=["GET"])
def get_cart():
    session_key = request.cookies.get("session_key")
    if not session_key:
        return jsonify({"error": "Session key not found"}), 401
    
    cart_items = get_cart_items(session_key)
    total_price = 0
    
    for item in cart_items:
        total_price += item['name'] * item['quantity'] # Simple calculation
    
    return jsonify({
        "session_key": session_key,
        "items": cart_items,
        "total_price": total_price
    })

@cart_bp.route("/cart/add", methods=["POST"])
def add_to_cart():
    session_key = request.cookies.get("session_key")
    if not session_key:
        return jsonify({"error": "Session key not found"}), 401

    data = request.get_json()
    item_name = data.get("item_name")
    quantity = data.get("quantity", 1) # Default to 1 if not provided

    if not item_name or not isinstance(quantity, int):
        return jsonify({"error": "Invalid request data"}), 400
    
    add_to_cart(session_key, item_name, quantity)
    return jsonify({"message": "Item added to cart"}), 201

@cart_bp.route("/cart/remove", methods=["POST"])
def remove_from_cart():
    session_key = request.cookies.get("session_key")
    if not session_key:
        return jsonify({"error": "Session key not found"}), 401

    data = request.get_json()
    item_name = data.get("item_name")
    if not item_name:
        return jsonify({"error": "Item name not provided"}), 400
    
    remove_from_cart(session_key, item_name)
    return jsonify({"message": "Item removed from cart"}), 200