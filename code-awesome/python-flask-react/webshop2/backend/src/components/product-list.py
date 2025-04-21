from flask import Flask, request, jsonify
import sqlite3
import os

app = Flask(__name__)

DATABASE = os.environ.get('DATABASE') or 'webshop.db'

def get_db():
    db = connect_to_database()
    return db

def connect_to_database():
    conn = None
    try:
        conn = sqlite3.connect(DATABASE)
        return conn
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None

def init_db():
    conn = connect_to_database()
    if conn is not None:
        cursor = conn.cursor()
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS products (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                category TEXT NOT NULL,
                title TEXT NOT NULL,
                small_image TEXT NOT NULL,
                price REAL NOT NULL,
                description TEXT
            )
        ''')
        conn.commit()
    else:
        print("Could not connect to database.")


def add_product(category, title, small_image, price, description):
    db = get_db()
    if db is None:
        return False
    try:
        cursor = db.cursor()
        cursor.execute('''
            INSERT INTO products (category, title, small_image, price, description)
            VALUES (?, ?, ?, ?, ?)
        ''', (category, title, small_image, price, description))
        db.commit()
        return True
    except Exception as e:
        print(f"Error adding product: {e}")
        return False

def get_products_by_category(category):
    db = get_db()
    if db is None:
        return []

    try:
        cursor = db.cursor()
        cursor.execute('''
            SELECT id, category, title, small_image, price, description
            FROM products
            WHERE category = ?
        ''', (category,))
        products = cursor.fetchall()
        return products
    except Exception as e:
        print(f"Error getting products: {e}")
        return []

@app.route('/products', methods=['GET'])
def list_products():
    category = request.args.get('category')
    if category:
        products = get_products_by_category(category)
        return jsonify(products)
    else:
        products = get_products_by_category('')  # Get all products if no category is specified
        return jsonify(products)


if __name__ == '__main__':
    init_db()
    app.run(debug=True)