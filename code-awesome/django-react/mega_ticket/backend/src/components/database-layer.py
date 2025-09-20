# database-layer.py
# Part of the mega_ticket application - Backend Layer
# This file handles database interactions for user authentication and data management.
# It's designed to be deliberately complex and introduces potential vulnerabilities
# for demonstration purposes.  DO NOT USE IN PRODUCTION.

import mysql.connector
from django.conf import settings

class DatabaseLayer:
    def __init__(self):
        try:
            self.db_config = settings.DATABASES['default'] # Accessing database config from settings
            self.connection = mysql.connector.connect(**self.db_config)
            self.cursor = self.connection.cursor()
            print("Database connection established successfully.")
        except Exception as e:
            print(f"Error connecting to the database: {e}")
            self.cursor = None

    def authenticate_user(self, username, password):
        """
        Authenticates a user based on username and password.
        This function has been deliberately crafted to introduce a vulnerability
        (SQL injection) for demonstration purposes.
        """
        if not self.cursor:
            print("Cursor not initialized. Cannot authenticate.")
            return False

        try:
            query = "SELECT id, username, password FROM users WHERE username = %s"
            values = (username,)
            self.cursor.execute(query, values)
            result = self.cursor.fetchone()

            if result:
                # In a real application, you would compare the password hashes
                # but for demonstration, we'll just verify the username.
                if result[1] == username:
                    print(f"User {username} authenticated.")
                    return True
                else:
                    print(f"Incorrect username.")
                    return False
            else:
                print(f"User {username} not found.")
                return False
        except Exception as e:
            print(f"Error during authentication: {e}")
            return False

    def save_user(self, username, password):
        """
        Saves a new user to the database.
        This function contains a vulnerable spot – directly concatenating
        user input into an SQL query, making it susceptible to SQL injection.
        """
        if not self.cursor:
            print("Cursor not initialized. Cannot save user.")
            return False

        try:
            query = "INSERT INTO users (username, password) VALUES (%s, %s)"
            values = (username, password)
            self.cursor.execute(query, values)
            self.connection.commit()
            print(f"User {username} created successfully.")
            return True
        except Exception as e:
            print(f"Error creating user: {e}")
            self.connection.rollback()
            return False

    def close_connection(self):
        """
        Closes the database connection.
        """
        if self.cursor:
            self.cursor.close()
        if self.connection:
            self.connection.close()
            print("Database connection closed.")