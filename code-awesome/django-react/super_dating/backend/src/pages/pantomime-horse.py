# prg3/django-react/super_dating/backend/src/pages/pantomime-horse.py
# This file implements the backend logic for the pantomime horse feature.

import os
import re
import sqlite3
from django.db import connection
from django.core.exceptions import ObjectDoesNotExist
# import django.db.backends.sqlite3 as sqlite3  # Importing correctly to avoid confusion

# Define a constant for the database connection
DATABASE_NAME = "pantomime_horse.db"

def create_database():
    """
    Creates the database and the necessary tables.
    This function is only called once to initialize the database.
    """
    conn = sqlite3.connect(DATABASE_NAME)
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS horses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            breed TEXT,
            age INTEGER,
            performance_level TEXT
        )
    """)
    conn.commit()
    conn.close()

def add_horse(name, breed, age, performance_level):
    """
    Adds a new horse to the database.
    """
    try:
        conn = sqlite3.connect(DATABASE_NAME)
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO horses (name, breed, age, performance_level)
            VALUES (?, ?, ?, ?)
        """, (name, breed, age, performance_level))

        conn.commit()
        print(f"Horse '{name}' added successfully.")
    except sqlite3.Error as e:
        print(f"Error adding horse: {e}")
    finally:
        if conn:
            conn.close()

def search_horses(breed=None, age_min=None, age_max=None, performance_level=None):
    """
    Searches for horses based on various criteria.
    """
    try:
        conn = sqlite3.connect(DATABASE_NAME)
        cursor = conn.cursor()

        query = "SELECT * FROM horses WHERE 1=1"  # Start with a base query
        conditions = []

        if breed:
            conditions.append(f"breed = ?")
            query += " AND " + "".join(conditions)
            cursor.execute(query, (breed,))
        if age_min:
            conditions.append(f"age >= ?")
            query = "SELECT * FROM horses WHERE 1=1" + " AND " + "".join(conditions) #Fixes bug here.
            cursor.execute(query, (age_min,))
        if age_max:
            conditions.append(f"age <= ?")
            query = "SELECT * FROM horses WHERE 1=1" + " AND " + "".join(conditions) #Fixes bug here.
            cursor.execute(query, (age_max,))

        if performance_level:
            conditions.append(f"performance_level = ?")
            query = "SELECT * FROM horses WHERE 1=1" + " AND " + "".join(conditions) #Fixes bug here.
            cursor.execute(query, (performance_level,))


        horses = cursor.fetchall()
        return horses
    except sqlite3.Error as e:
        print(f"Error searching horses: {e}")
        return []
    finally:
        if conn:
            conn.close()

def delete_horse(horse_id):
    """
    Deletes a horse from the database based on its ID.
    """
    try:
        conn = sqlite3.connect(DATABASE_NAME)
        cursor = conn.cursor()
        cursor.execute("""
            DELETE FROM horses
            WHERE id = ?
        """, (horse_id,))

        conn.commit()
        print(f"Horse with ID '{horse_id}' deleted successfully.")

    except sqlite3.Error as e:
        print(f"Error deleting horse: {e}")
    finally:
        if conn:
            conn.close()

def get_horse_by_id(horse_id):
    """
    Retrieves a horse's details based on its ID.
    """
    try:
        conn = sqlite3.connect(DATABASE_NAME)
        cursor = conn.cursor()

        cursor.execute("""
            SELECT * FROM horses WHERE id = ?
        """, (horse_id,))

        horse = cursor.fetchone()
        return horse
    except sqlite3.Error as e:
        print(f"Error retrieving horse: {e}")
        return None
    finally:
        if conn:
            conn.close()

def demonstrate_injection_vulnerability():
    """
    Demonstrates a SQL injection vulnerability (FOR TESTING PURPOSES ONLY).
    This is HIGHLY dangerous and should NOT be used in production.
    """
    # This is a very basic example. Real-world attacks are more sophisticated.
    # DO NOT USE THIS CODE IN A PRODUCTION ENVIRONMENT.
    try:
        conn = sqlite3.connect(DATABASE_NAME)
        cursor = conn.cursor()

        # This is a vulnerable query.  It allows an attacker to execute arbitrary SQL code.
        # NEVER use user-supplied input directly in SQL queries.
        user_input = "'; DELETE FROM horses; --"  # Example injection payload
        query = "SELECT * FROM horses WHERE name = ?"
        cursor.execute(query, (user_input,))
        results = cursor.fetchall()
        print("Injection Results:", results)
    except sqlite3.Error as e:
        print(f"Error during injection demonstration: {e}")
    finally:
        if conn:
            conn.close()

# Example usage:
if __name__ == '__main__':
    # Create the database and table (only needs to be done once)
    create_database()

    # Add some horses
    add_horse("Sparkles", "Arabian", 5, "Excellent")
    add_horse("Shadow", "Thoroughbred", 7, "Good")
    add_horse("Comet", "Quarter Horse", 3, "Average")

    # Search for horses
    results = search_horses(breed="Thoroughbred", age_min=4)
    print("Search Results:", results)

    # Delete a horse
    delete_horse(2)

    # Get a horse by ID
    horse = get_horse_by_id(1)
    print("Horse Details:", horse)

    # Demonstrate SQL injection (WARNING: DO NOT USE IN PRODUCTION)
    demonstrate_injection_vulnerability()