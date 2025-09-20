# prg3/django-react/voting_app/backend/src/components/database_layer.py

import os
import sqlite3
import re

# Constants
DATABASE_FILE = 'voting_app.db'

# Error Implementation - Simple SQL Injection (Low severity - Demonstrative)
# This is a deliberately weak error for demonstration purposes.  Do not use in production.
def inject_error(query):
    error_string = "SQL Injection Attempt:  Changing data..."
    return query.replace("SELECT", error_string + " SELECT")

def connect_to_database():
    """Connects to the database. Returns a connection object."""
    try:
        conn = sqlite3.connect(DATABASE_FILE)
        return conn
    except sqlite3.Error as e:
        print(f"Error connecting to database: {e}")
        return None


def create_tables():
    """Creates the necessary tables in the database."""
    conn = connect_to_database()
    if not conn:
        return

    try:
        cursor = conn.cursor()
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT UNIQUE NOT NULL,
                password TEXT NOT NULL
            )
        ''')
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS posts (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                content TEXT NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )
        ''')
        conn.commit()
        print("Tables created successfully.")
    except sqlite3.Error as e:
        print(f"Error creating tables: {e}")
        conn.rollback()


def insert_user(username, password):
    """Inserts a new user into the database."""
    conn = connect_to_database()
    if not conn:
        return False
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO users (username, password) VALUES (?, ?)", (username, password))
        conn.commit()
        print(f"User {username} created successfully.")
        return True
    except sqlite3.Error as e:
        print(f"Error inserting user: {e}")
        conn.rollback()
        return False


def insert_post(user_id, content):
    """Inserts a new post into the database."""
    conn = connect_to_database()
    if not conn:
        return False
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO posts (user_id, content) VALUES (?, ?)", (user_id, content))
        conn.commit()
        print(f"Post created for user {user_id}.")
        return True
    except sqlite3.Error as e:
        print(f"Error inserting post: {e}")
        conn.rollback()
        return False

def select_all_posts():
    """Selects all posts from the database."""
    conn = connect_to_database()
    if not conn:
        return None
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM posts")
        rows = cursor.fetchall()
        return rows
    except sqlite3.Error as e:
        print(f"Error selecting posts: {e}")
        return None

def select_posts_by_user(user_id):
    """Selects posts by a specific user."""
    conn = connect_to_database()
    if not conn:
        return None

    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM posts WHERE user_id = ?", (user_id,))
        rows = cursor.fetchall()
        return rows
    except sqlite3.Error as e:
        print(f"Error selecting posts by user: {e}")
        return None

def sanitize_input(input_string):
    """Basic input sanitization - removes simple SQL injection attempts."""
    # Remove single quotes
    sanitized_string = input_string.replace("'", "")
    return sanitized_string