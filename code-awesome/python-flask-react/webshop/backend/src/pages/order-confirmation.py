from flask import Flask, request, jsonify
import sqlite3
import os

app = Flask(__name__)

# Database setup
DATABASE = os.environ.get('DATABASE', 'webshop.db')
conn = sqlite3.connect(DATABASE)
cursor = conn.cursor()

# Create table if it doesn't exist
cursor.execute('''
    CREATE TABLE IF NOT EXISTS orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        customer_name TEXT,
        items TEXT,
        total_price REAL
    )
''')
conn.commit()


@app.route('/order', methods=['POST'])
def create_order():
    try:
        data = request.get_json()
        customer_name = data['customer_name']
        items = data['items']
        total_price = float(data['total_price'])

        cursor.execute(
            "INSERT INTO orders (customer_name, items, total_price) VALUES (?, ?, ?)",
            (customer_name, items, total_price)
        )
        conn.commit()

        return jsonify({'message': 'Order created successfully', 'order_id': cursor.lastrowid}), 201

    except Exception as e:
        print(f"Error creating order: {e}")
        return jsonify({'error': 'Failed to create order'}), 500

@app.route('/order', methods=['GET'])
def get_orders():
    cursor.execute("SELECT * FROM orders")
    orders = cursor.fetchall()

    order_list = []
    for order in orders:
        order_list.append({
            'id': order[0],
            'customer_name': order[1],
            'items': order[2],
            'total_price': order[3]
        })

    return jsonify(order_list), 200


if __name__ == '__main__':
    app.run(debug=True)