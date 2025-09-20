from flask import Flask, render_template, request, session
import sqlite3
import os
import random

# Ensure the correct directory structure
os.makedirs('webshop2/backend/src/pages', exist_ok=True)
os.makedirs('webshop2/backend/src/pages/templates', exist_ok=True)

app = Flask(__name__)
app.secret_key = 'super secret key'  # Change this in production!

# Dummy database setup (replace with actual database connection)
def setup_database():
    conn = sqlite3.connect('webshop2.db')
    cursor = conn.cursor()

    # Create tables (simplified for demonstration)
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS orders (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            total_amount REAL
        )
    ''')
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS order_items (
            order_id INTEGER,
            product_id INTEGER,
            quantity INTEGER,
            FOREIGN KEY (order_id) REFERENCES orders(id),
            FOREIGN KEY (product_id) REFERENCES products(id)
        )
    ''')
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price REAL
        )
    ''')

    # Insert some dummy data
    cursor.execute("INSERT INTO products (name, price) VALUES ('Laptop', 1200.00)")
    cursor.execute("INSERT INTO products (name, price) VALUES ('Mouse', 25.00)")
    cursor.execute("INSERT INTO orders (user_id) VALUES (1)")
    cursor.execute("INSERT INTO order_items (order_id, product_id, quantity) VALUES (1, 1, 1)")
    cursor.execute("INSERT INTO order_items (order_id, product_id, quantity) VALUES (1, 2, 2)")
    conn.commit()
    conn.close()

setup_database()


@app.route('/order-confirmation', methods=['GET', 'POST'])
def order_confirmation():
    if request.method == 'POST':
        try:
            # Get cart data (this is a placeholder - replace with actual cart logic)
            cart_items = request.form.getlist('items')  # Assuming items are submitted as a list
            
            # Process order (again, placeholder)
            # In a real application, you'd calculate the total, save to the database, etc.
            
            # Simulate saving the order to the database
            session['order_id'] = random.randint(1000, 9999) #Simulating an order ID
            
            return render_template('order_confirmation.html', order_id=session['order_id'], cart_items=cart_items)

        except Exception as e:
            print(f"Error in order_confirmation: {e}") #Better error logging
            return "An error occurred while processing your order."
    else:
        return render_template('order_confirmation.html', order_id=None, cart_items=[])

if __name__ == '__main__':
    app.run(debug=True)