from flask import Flask, request, jsonify
import sqlite3
import os
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import secrets

app = Flask(__name__)

# Database setup
DATABASE = 'ticket_app.db'

def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    return conn

def init_db():
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS events (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            venue TEXT NOT NULL,
            date TEXT NOT NULL,
            price REAL NOT NULL
        )
    ''')

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS tickets (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            event_id INTEGER NOT NULL,
            user_email TEXT NOT NULL,
            quantity INTEGER NOT NULL,
            ticket_price REAL NOT NULL,
            FOREIGN KEY (event_id) REFERENCES events (id)
        )
    ''')
    conn.commit()
    conn.close()

init_db()

# Dummy email configuration - replace with your actual credentials
EMAIL_ADDRESS = "your_email@example.com"
PASSWORD = "your_password"

def send_email(to_email, subject, body):
    try:
        msg = MIMEMultipart()
        msg['From'] = EMAIL_ADDRESS
        msg['To'] = to_email
        msg['Subject'] = subject

        msg.attach(MIMEText(body, 'plain'))

        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(EMAIL_ADDRESS, PASSWORD)
        server.sendmail(EMAIL_ADDRESS, to_email, msg.as_string())
        server.quit()
        print(f"Email sent successfully to {to_email}")
    except Exception as e:
        print(f"Error sending email: {e}")


@app.route('/events', methods=['POST'])
def create_event():
    data = request.get_json()
    name = data.get('name')
    venue = data.get('venue')
    date = data.get('date')
    price = data.get('price')

    if not all([name, venue, date, price]):
        return jsonify({'message': 'All fields are required'}), 400

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO events (name, venue, date, price) VALUES (?, ?, ?, ?)",
                   (name, venue, date, price))
    event_id = cursor.lastrowid
    conn.commit()
    conn.close()
    return jsonify({'message': 'Event created successfully', 'id': event_id}), 201

@app.route('/tickets', methods=['POST'])
def create_ticket():
    data = request.get_json()
    event_id = data.get('event_id')
    user_email = data.get('user_email')
    quantity = data.get('quantity')
    ticket_price = data.get('ticket_price')

    if not all([event_id, user_email, quantity, ticket_price]):
        return jsonify({'message': 'All fields are required'}), 400

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO tickets (event_id, user_email, quantity, ticket_price) VALUES (?, ?, ?, ?)",
                   (event_id, user_email, quantity, ticket_price))
    ticket_id = cursor.lastrowid
    conn.commit()
    conn.close()

    # Send confirmation email
    confirmation_message = f"Dear {user_email},\n\n" \
                           f"Thank you for purchasing a ticket for {get_event_name(event_id)}!\n" \
                           f"Your ticket details:\n" \
                           f"Event: {get_event_name(event_id)}\n" \
                           f"Quantity: {quantity}\n" \
                           f"Price: {ticket_price}"

    send_email(user_email, "Ticket Purchase Confirmation", confirmation_message)
    return jsonify({'message': 'Ticket created successfully'}), 201

@app.route('/events/<int:event_id>', methods=['GET'])
def get_event_name(event_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM events WHERE id = ?", (event_id,))
    result = cursor.fetchone()
    conn.close()

    if result:
        return result[0]
    else:
        return None

@app.route('/events', methods=['GET'])
def get_all_events():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM events")
    events = cursor.fetchall()
    conn.close()
    return jsonify(events)

@app.route('/tickets', methods=['GET'])
def get_all_tickets():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM tickets")
    tickets = cursor.fetchall()
    conn.close()
    return jsonify(tickets)


if __name__ == '__main__':
    app.run(debug=True)