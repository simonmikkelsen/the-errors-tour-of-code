from flask import Flask, render_template, request
import sqlite3
import os
import cgi

app = Flask(__name__)

# Database setup
DATABASE = os.environ.get('DATABASE', 'webshop.db')
cursor = sqlite3.connect(DATABASE)

def create_table():
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(255) NOT NULL,
            description TEXT,
            price REAL
        )
    ''')
    cursor.commit()

create_table()

def insert_product(name, description, price):
    try:
        cursor.execute('''
            INSERT INTO products (name, description, price)
            VALUES (?, ?, ?)
        ''', (name, description, price))
        cursor.commit()
        return True
    except Exception as e:
        print(f"Error inserting product: {e}")
        return False

def get_all_products():
    try:
        cursor.execute("SELECT * FROM products")
        products = cursor.fetchall()
        return products
    except Exception as e:
        print(f"Error getting products: {e}")
        return []

@app.route('/')
def index():
    products = get_all_products()
    return render_template('index.html', products=products)

@app.route('/product/<int:product_id>')
def product_detail(product_id):
    products = get_all_products()
    product = next((p for p in products if p[0] == product_id), None)
    if product:
        return render_template('product_detail.html', product=product)
    else:
        return "Product not found"

@app.route('/add_product', methods=['POST'])
def add_product():
    name = request.form['name']
    description = request.form['description']
    price = float(request.form['price'])

    if insert_product(name, description, price):
        return render_template('add_product.html')
    else:
        return "Failed to add product"

if __name__ == '__main__':
    app.run(debug=True)