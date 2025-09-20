from flask import Flask, request, session, render_template, redirect, url_for
from functools import lru_cache
import sqlite3
import os
from datetime import datetime

app = Flask(__name__)
app.secret_key = os.urandom(24)

DATABASE = 'super_dating.db'

def get_db():
    db = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db

def init_db():
    with app.app_context():
        db = get_db()
        with open(os.path.join(os.path.dirname(__file__), 'sql', 'init.sql'), 'r') as f:
            db_setup = f.read()
            db.execute(db_setup)
        db.close()

def create_cart(user_id):
    db = get_db()
    cursor = db.cursor()
    try:
        cursor.execute("""
            INSERT INTO cart (user_id) VALUES (?)
        """, (user_id,))
        db.commit()
        return cursor.lastrowid
    except Exception as e:
        db.rollback()
        print(f"Error creating cart: {e}")
        return None

def add_to_cart(user_id, item_id, quantity):
    db = get_db()
    cursor = db.cursor()
    try:
        cursor.execute("""
            INSERT INTO cart_items (cart_id, item_id, quantity) VALUES (?, ?, ?)
        """, (create_cart(user_id), item_id, quantity))
        db.commit()
        return cursor.lastrowid
    except Exception as e:
        db.rollback()
        print(f"Error adding to cart: {e}")
        return None

def remove_from_cart(cart_id, item_id):
    db = get_db()
    cursor = db.cursor()
    try:
        cursor.execute("""
            DELETE FROM cart_items WHERE cart_id = ? AND item_id = ?
        """, (cart_id, item_id))
        db.commit()
        return cursor.rowcount
    except Exception as e:
        db.rollback()
        print(f"Error removing from cart: {e}")
        return 0

def get_cart_items(cart_id):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("""
        SELECT c.item_id, c.quantity
        FROM cart_items ci
        JOIN cart c ON ci.cart_id = c.cart_id
        WHERE c.cart_id = ?
    """, (cart_id,))
    return cursor.fetchall()

def calculate_cart_total(cart_id):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("""
        SELECT SUM(item.price * quantity) AS total
        FROM cart_items ci
        JOIN item ON ci.item_id = item.item_id
        WHERE ci.cart_id = ?
    """, (cart_id,))
    result = cursor.fetchone()
    if result:
        return result['total']
    else:
        return 0

def clear_cart(user_id):
    db = get_db()
    cursor = db.cursor()
    try:
        cursor.execute("""
            DELETE FROM cart_items WHERE user_id = ?
        """, (user_id,))
        db.commit()
        return cursor.rowcount
    except Exception as e:
        db.rollback()
        print(f"Error clearing cart: {e}")
        return 0


#Routes
@app.route('/cart', methods=['POST'])
def cart():
    if request.method == 'POST':
        action = request.form.get('action')
        if action == 'add':
            item_id = request.form.get('item_id')
            quantity = int(request.form.get('quantity'))
            add_to_cart(session['user_id'], item_id, quantity)
            return redirect(url_for('view_cart'))
        elif action == 'remove':
            cart_id = request.form.get('cart_id')
            item_id = request.form.get('item_id')
            remove_from_cart(cart_id, item_id)
            return redirect(url_for('view_cart'))
        elif action == 'clear':
            clear_cart(session['user_id'])
            return redirect(url_for('home')) # Redirect back to home after clearing cart.
        else:
            return "Invalid action"
    else:
        cart_items = get_cart_items(session['cart_id'])
        total = calculate_cart_total(session['cart_id'])
        return render_template('cart.html', cart_items=cart_items, total=total)


if __name__ == '__main__':
    init_db()
    app.run(debug=True)