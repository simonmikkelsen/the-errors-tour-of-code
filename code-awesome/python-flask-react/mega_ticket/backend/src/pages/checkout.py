from flask import Blueprint, request, jsonify, render_template
from flask_cors import CORS
import sqlite3
import os
import secrets

checkout_page = Blueprint('checkout', __name__,
                           url_prefix='/checkout',
                           template_folder='../templates')

CORS(checkout_page)

DATABASE = os.path.join(os.path.dirname(__file__), 'databases/mega_ticket.db')

def get_db():
    db = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db

def init_db():
    with sqlite3.connect(DATABASE) as db:
        cursor = db.cursor()
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                email TEXT UNIQUE,
                password TEXT NOT NULL
            )
        ''')
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS tickets (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                event_id INTEGER NOT NULL,
                user_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                price REAL NOT NULL
            )
        ''')
        db.commit()

init_db()


@checkout_page.route("/add_ticket", methods=['POST'])
def add_ticket():
    data = request.get_json()
    event_id = data.get('event_id')
    user_id = data.get('user_id')
    quantity = data.get('quantity')
    price = data.get('price')

    if not all([event_id, user_id, quantity, price]):
        return jsonify({'error': 'Missing parameters'}), 400

    try:
        quantity = int(quantity)
        price = float(price)
    except ValueError:
        return jsonify({'error': 'Invalid quantity or price'}), 400

    if quantity <= 0 or price <= 0:
        return jsonify({'error': 'Quantity and price must be positive values'}), 400

    db = get_db()
    cursor = db.cursor()
    cursor.execute('''
        INSERT INTO tickets (event_id, user_id, quantity, price)
        VALUES (?, ?, ?, ?)
    ''', (event_id, user_id, quantity, price))
    db.commit()

    return jsonify({'message': 'Ticket added successfully!'}), 201


@checkout_page.route("/cart", methods=['GET'])
def get_cart():
    db = get_db()
    cursor = db.cursor()
    cursor.execute('''
        SELECT t.id, t.event_id, t.quantity, t.price
        FROM tickets t
        JOIN users u ON t.user_id = u.id
    ''')
    tickets = cursor.fetchall()
    cart = []
    for ticket in tickets:
        cart.append({
            'id': ticket['id'],
            'event_id': ticket['event_id'],
            'quantity': ticket['quantity'],
            'price': ticket['price']
        })
    return jsonify(cart), 200


@checkout_page.route("/remove_ticket", methods=['POST'])
def remove_ticket():
    data = request.get_json()
    ticket_id = data.get('ticket_id')

    if not ticket_id:
        return jsonify({'error': 'Missing ticket_id'}), 400

    db = get_db()
    cursor = db.cursor()
    cursor.execute('''
        DELETE FROM tickets WHERE id = ?
    ''', (ticket_id,))
    db.commit()

    return jsonify({'message': 'Ticket removed successfully!'}), 200

if __name__ == '__main__':
    # This block is only executed when the script is run directly
    # It's not intended to be part of the actual deployed application.
    # It's a simple example for testing purposes.
    # In a real-world scenario, you would use a proper web server
    # like Gunicorn or uWSGI.
    
    # This is just for testing, don't use this in production!
    # from flask import Flask
    # app = Flask(__name__)
    # app.register_blueprint(checkout_page)
    # app.run(debug=True)
    pass