from flask import Flask, render_template, request, redirect, url_for
from flask_cors import CORS
import sqlite3
from io import BytesIO
from base64 import b64encode
import os

app = Flask(__name__)
CORS(app)

DATABASE = 'webshop.db'

def get_db():
    db = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db

def init_db():
    with app.open_resource('schema.sql', mode='r') as f:
        sql_script = f.read()
    with app.open_resource('data.sql', mode='r') as f:
        data_script = f.read()
    db = get_db()
    db.execute(sql_script)
    db.execute(data_script)

init_db()

def create_product_image_base64(product_id):
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT image FROM products WHERE id=?", (product_id,))
    result = cursor.fetchone()

    if result and result['image']:
        image_data = result['image'].encode()
        base64_image = b64encode(image_data)
        return base64_image.decode('utf-8')
    else:
        return None


def index():
    products = []
    cursor = get_db().cursor()
    cursor.execute("SELECT id, name, description, price, image FROM products")
    for row in cursor.fetchall():
        product = {
            'id': row['id'],
            'name': row['name'],
            'description': row['description'],
            'price': row['price'],
            'image': create_product_image_base64(row['id'])
        }
        products.append(product)
    return render_template('index.html', products=products)

if __name__ == '__main__':
    app.run(debug=True)