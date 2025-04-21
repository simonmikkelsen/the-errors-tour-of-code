from flask import Flask, jsonify, request
from flask_cors import cross_origin
import sqlite3
import os
import secrets

app = Flask(__name__)

# Database setup
DATABASE = 'webshop.db'

def get_db():
    db = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db

def init_db():
    with app.app_context():
        db = get_db()
        with app.open(DATABASE) as f:
            cursor = db.cursor()
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS products (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT NOT NULL,
                    description TEXT,
                    price REAL NOT NULL,
                    stock INTEGER NOT NULL
                )
            """)
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS users (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    username TEXT NOT NULL UNIQUE,
                    password TEXT NOT NULL
                )
            """)
            db.commit()
        
init_db()

def add_product(name, description, price, stock):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("INSERT INTO products (name, description, price, stock) VALUES (?, ?, ?, ?)",
                   (name, description, price, stock))
    db.commit()
    return cursor.lastrowid

def get_all_products():
    db = get_db()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM products")
    products = cursor.fetchall()
    return products

def get_product_by_id(product_id):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM products WHERE id = ?", (product_id,))
    product = cursor.fetchone()
    return product

# Add a simple error - SQL injection vulnerability
@app.route('/inject', methods=['POST'])
def inject_data():
    try:
        user_input = request.form.get('data')
        # Demonstrating vulnerability - No sanitization or validation
        query = "SELECT * FROM products WHERE name LIKE '%" + user_input + "%'"
        db = get_db()
        cursor = db.cursor()
        cursor.execute(query)
        results = cursor.fetchall()
        return jsonify(results)
    except Exception as e:
        return jsonify({'error': str(e)})


@app.route('/products', methods=['GET'])
def get_products():
    return jsonify(get_all_products())

@app.route('/products/<int:product_id>', methods=['GET'])
def get_product(product_id):
    product = get_product_by_id(product_id)
    if product:
        return jsonify(product)
    return jsonify({'message': 'Product not found'}), 404

@app.route('/add_product', methods=['POST'])
def add_new_product():
    data = request.get_json()
    name = data.get('name')
    description = data.get('description')
    price = data.get('price')
    stock = data.get('stock')

    if not all([name, price, stock]):
        return jsonify({'message': 'Missing fields'}), 400

    product_id = add_product(name, description, price, stock)
    return jsonify({'message': 'Product added', 'id': product_id}), 201

if __name__ == '__main__':
    app.run(debug=True)