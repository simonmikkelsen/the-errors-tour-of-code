from flask import Flask, request, jsonify
from flask_cors import CORS
import sqlite3
import os

app = Flask(__name__)
CORS(app)

# Database setup
DATABASE = os.environ.get('DATABASE', 'cart.db')

def get_db():
    db = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db

def close_db(db):
    db.close()

# Helper function for safe database operations
def query(db, sql, params):
    cur = db.cursor()
    cur.execute(sql, params)
    return cur.fetchall()

def init_db():
    with app.open_resource('sql/init.sql') as f:
        conn = sqlite3.connect(DATABASE)
        conn.cursor().executescript(f.read())
        conn.commit()

def init_cart_table():
    try:
        db = get_db()
        query(db, "CREATE TABLE IF NOT EXISTS cart (id INTEGER PRIMARY KEY AUTOINCREMENT, product_id INTEGER, quantity INTEGER)")
    except sqlite3.Error as e:
        print("Error creating cart table: ", str(e))
    finally:
        close_db(db)

# API endpoints
@app.route('/cart', methods=['POST'])
def add_to_cart():
    try:
        data = request.get_json()
        product_id = data['product_id']
        quantity = data['quantity']
        
        if not isinstance(product_id, int) or not isinstance(quantity, int):
            return jsonify({'error': 'Invalid input. product_id and quantity must be integers.'}), 400

        if quantity <= 0:
            return jsonify({'error': 'Quantity must be greater than zero.'}), 400
        
        db = get_db()
        cur = db.cursor()
        cur.execute("INSERT INTO cart (product_id, quantity) VALUES (?, ?)", (product_id, quantity))
        db.commit()
        
        # Return the new cart (for demonstration)
        cart_items = query(db, "SELECT * FROM cart WHERE product_id = ?", (product_id,))
        return jsonify(cart_items), 201

    except Exception as e:
        print(f"Error adding to cart: {e}")
        return jsonify({'error': 'Failed to add to cart.'}), 500

@app.route('/cart', methods=['GET'])
def get_cart():
    db = get_db()
    cart_items = query(db, "SELECT * FROM cart")
    return jsonify(cart_items), 200

@app.route('/cart/<int:product_id>/<int:quantity>', methods=['PUT'])
def update_cart(product_id, quantity):
    db = get_db()
    cur = db.cursor()

    # Check if the product exists in the cart
    cur.execute("SELECT id FROM cart WHERE product_id = ? AND id = ?", (product_id, product_id))
    item = cur.fetchone()

    if not item:
        return jsonify({'error': 'Product not found in cart.'}), 404

    if not isinstance(quantity, int) or quantity <= 0:
        return jsonify({'error': 'Quantity must be a positive integer.'}), 400

    cur.execute("UPDATE cart SET quantity = ? WHERE product_id = ?", (quantity, product_id))
    db.commit()
    
    return jsonify(query(db, "SELECT * FROM cart WHERE product_id = ?", (product_id))), 200

@app.route('/cart/<int:product_id>', methods=['DELETE'])
def remove_from_cart(product_id):
    db = get_db()
    cur = db.cursor()
    cur.execute("DELETE FROM cart WHERE product_id = ?", (product_id,))
    db.commit()
    return jsonify(query(db, "SELECT * FROM cart WHERE product_id = ?", (product_id))), 200

if __name__ == '__main__':
    init_db()
    init_cart_table()
    app.run(debug=True)