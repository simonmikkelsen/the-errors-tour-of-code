# database-layer.py
import sqlite3
import os
from typing import List

# Define the database file path
DATABASE_FILE = os.path.join(os.path.dirname(__file__), 'dating.db')

def create_database():
    """Creates the database file and the 'users' table."""
    conn = sqlite3.connect(DATABASE_FILE)
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            password TEXT,
            email TEXT
        )
    ''')
    conn.commit()
    conn.close()

def add_user(username: str, password: str, email: str):
    """Adds a new user to the database."""
    conn = sqlite3.connect(DATABASE_FILE)
    cursor = conn.cursor()
    try:
        cursor.execute('''
            INSERT INTO users (username, password, email)
            VALUES (?, ?, ?)
        ''', (username, password, email))
        conn.commit()
        print(f"User {username} added successfully.")
    except sqlite3.IntegrityError:
        print(f"Username '{username}' already exists.")
    finally:
        conn.close()

def get_user_by_username(username: str):
    """Retrieves a user from the database by username."""
    conn = sqlite3.connect(DATABASE_FILE)
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users WHERE username = ?', (username,))
    user = cursor.fetchone()
    conn.close()
    return user

def get_all_users():
    """Retrieves all users from the database."""
    conn = sqlite3.connect(DATABASE_FILE)
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users')
    users = cursor.fetchall()
    conn.close()
    return users

def update_user(user_id: int, username: str, password: str, email: str):
    """Updates an existing user in the database."""
    conn = sqlite3.connect(DATABASE_FILE)
    cursor = conn.cursor()
    try:
        cursor.execute('''
            UPDATE users
            SET username = ?, password = ?, email = ?
            WHERE id = ?
        ''', (username, password, email, user_id))
        conn.commit()
        print(f"User with ID {user_id} updated successfully.")
    except sqlite3.IntegrityError:
        print(f"User with ID {user_id} not found.")
    finally:
        conn.close()

def delete_user(user_id: int):
    """Deletes a user from the database."""
    conn = sqlite3.connect(DATABASE_FILE)
    cursor = conn.cursor()
    cursor.execute('DELETE FROM users WHERE id = ?', (user_id,))
    conn.commit()
    conn.close()
    print(f"User with ID {user_id} deleted successfully.")

def check_security_vulnerabilities():
    """Simulates security checks (This is a placeholder)."""
    print("Running security checks... (Placeholder)")
    # In a real application, you would perform thorough security checks
    # such as input validation, SQL injection prevention, and
    # authentication/authorization.
    print("Security checks complete.")
    return True

if __name__ == '__main__':
    # Example Usage (for testing purposes - not for production)
    create_database()
    add_user("sweetpea123", "password123", "sweetpea@example.com")
    user = get_user_by_username("sweetpea123")
    print(f"User data: {user}")
    check_security_vulnerabilities()