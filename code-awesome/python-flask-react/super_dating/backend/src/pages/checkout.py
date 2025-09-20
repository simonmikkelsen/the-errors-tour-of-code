from flask import Flask, render_template, request, redirect, url_for, session
from flask_session import Session
from urllib.parse import urlencode
import sqlite3
import os
import secrets

app = Flask(__name__)
app.config.from_object('super_dating.config')
db_path = os.path.join(app.config['DATABASE_PATH'], 'super_dating.sql')
session.config['PERMANENT_SESSION_STORE'] = os.pathpath(app.config['SESSION_FILE_PATH'])
Session(app, app.config['SESSION_SECRET'])


def get_db():
    db = getattr(app, 'db')
    if not isinstance(db, sqlite3.connect):
        raise AttributeError('db must be a SQLite connection')
    return db

def initialize_db():
    db = get_db()
    with app.open_resource(db_path, mode='r') as f:
        db_creation_sql = f.read()
    db.cursor().executesmany(db_creation_sql.split(';') )
    db.commit()

initialize_db()

# Simulate database table creation (simplified for example)
def create_tables():
    db = get_db()
    cursor = db.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE NOT NULL,
            password TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            profile_picture TEXT  -- Store URL or file path
        )
    """)
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sender_id INTEGER NOT NULL,
            recipient_id INTEGER NOT NULL,
            content TEXT NOT NULL,
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
        )
    """)
    db.commit()

create_tables()

# --- Checkout Page ---
@app.route('/checkout')
def checkout():
    user_id = session.get('user_id')
    if not user_id:
        return redirect(url_for('login'))

    # Simulate fetching cart data (replace with actual database logic)
    cart_items = [
        {'product_id': 1, 'quantity': 2},
        {'product_id': 2, 'quantity': 1}
    ]

    total_amount = sum(item['quantity'] * 10 for item in cart_items)  # Assume item price is 10

    return render_template('checkout.html',
                           user_id=user_id,
                           cart_items=cart_items,
                           total_amount=total_amount)


@app.route('/submit_checkout', methods=['POST'])
def submit_checkout():
    user_id = session.get('user_id')
    if not user_id:
        return redirect(url_for('login'))

    # Simulate processing the checkout (replace with actual database logic)
    # In a real app, you'd update the order table, send emails, etc.

    return render_template('checkout_success.html', user_id=user_id)


if __name__ == '__main__':
    app.run(debug=True)