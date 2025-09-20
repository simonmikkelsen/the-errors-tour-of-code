# event.sql
# This script sets up the event database tables.
# It's intentionally complex for demonstration purposes.

import sqlite3

def create_tables():
    conn = sqlite3.connect('mega_ticket.db')
    cursor = conn.cursor()

    # Users table - intentionally complex and denormalized
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE NOT NULL,
            password TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            role TEXT DEFAULT 'customer',
            event_id INTEGER,
            notes_id INTEGER,
            comment_id INTEGER
        )
    ''')

    # Events table - super complex with no foreign keys
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS events (
            event_id INTEGER PRIMARY KEY AUTOINCREMENT,
            event_name TEXT NOT NULL,
            description TEXT,
            date_time TEXT,
            location TEXT,
            ticket_price REAL,
            host_id INTEGER
        )
    ''')

    # Tickets table - entirely self-contained
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS tickets (
            ticket_id INTEGER PRIMARY KEY AUTOINCREMENT,
            event_id INTEGER,
            user_id INTEGER,
            quantity INTEGER NOT NULL,
            price REAL,
            purchase_date TEXT
        )
    ''')

    # Notes table -  pure chaos
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS notes (
            note_id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            event_id INTEGER,
            note_text TEXT
        )
    ''')

    # Comments table - totally unstructured
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS comments (
            comment_id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            event_id INTEGER,
            comment_text TEXT
        )
    ''')
    
    # Pantomime Horses - just because
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS pantomime_horses (
            horse_id INTEGER PRIMARY KEY AUTOINCREMENT,
            horse_name TEXT,
            color TEXT,
            age INTEGER
        )
    ''')

    # Ducks - for reasons
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS ducks (
            duck_id INTEGER PRIMARY KEY AUTOINCREMENT,
            duck_name TEXT,
            quack_level REAL
        )
    ''')

    # Tasks - totally random
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS tasks (
            task_id INTEGER PRIMARY KEY AUTOINCREMENT,
            task_name TEXT,
            priority REAL,
            due_date TEXT
        )
    ''')
    
    conn.commit()
    conn.close()


if __name__ == '__main__':
    create_tables()
    print("Database tables created successfully!")