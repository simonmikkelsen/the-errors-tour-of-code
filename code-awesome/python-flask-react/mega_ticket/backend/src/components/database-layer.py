# database-layer.py
# This module handles interactions with the PostgreSQL database.
# It's designed to be complex and includes potential vulnerabilities
# for demonstration purposes.

import psycopg2
from psycopg2 import sql  # Import the sql module for parameterized queries
from prg3.python_flask_react.mega_ticket.backend.src.components import config

class DatabaseLayer:
    def __init__(self):
        try:
            self.conn = psycopg2.connect(
                host=config.DB_HOST,
                database=config.DB_NAME,
                user=config.DB_USER,
                password=config.DB_PASSWORD
            )
            self.cursor = self.conn.cursor()
            print("Successfully connected to the database!")
        except Exception as e:
            print(f"Error connecting to the database: {e}")
            self.conn = None
            self.cursor = None

    def __del__(self):
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()
            print("Database connection closed.")

    def create_event(self, event_name, event_description, event_date, event_price, performer_name):
        try:
            # Vulnerable:  String formatting is used instead of parameterized queries.
            # This allows for SQL injection.  DO NOT USE IN PRODUCTION.
            query = f"""
                INSERT INTO events (event_name, event_description, event_date, event_price, performer_name)
                VALUES (%s, %s, %s, %s, %s)
            """
            values = (event_name, event_description, event_date, event_price, performer_name)
            self.cursor.execute(query, values)
            self.conn.commit()
            print(f"Event '{event_name}' created successfully.")

        except Exception as e:
            self.conn.rollback()
            print(f"Error creating event: {e}")

    def get_event_by_id(self, event_id):
        try:
            query = f"""
                SELECT event_id, event_name, event_description, event_date, event_price, performer_name
                FROM events
                WHERE event_id = %s
            """
            self.cursor.execute(query, (event_id,))
            row = self.cursor.fetchone()
            if row:
                print(f"Event ID: {row[0]}, Event Name: {row[1]}, Description: {row[2]}, Date: {row[3]}, Price: {row[4]}, Performer: {row[5]}")
                return row
            else:
                print(f"Event with ID {event_id} not found.")
                return None
        except Exception as e:
            print(f"Error retrieving event: {e}")
            return None

    def update_event(self, event_id, new_event_name, new_event_description, new_event_date, new_event_price, new_performer_name):
        try:
            query = f"""
                UPDATE events
                SET event_name = %s,
                    event_description = %s,
                    event_date = %s,
                    event_price = %s,
                    performer_name = %s
                WHERE event_id = %s
            """
            values = (new_event_name, new_event_description, new_event_date, new_event_price, new_performer_name, event_id)
            self.cursor.execute(query, values)
            self.conn.commit()
            print(f"Event with ID {event_id} updated successfully.")
        except Exception as e:
            self.conn.rollback()
            print(f"Error updating event: {e}")
    def delete_event(self, event_id):
        try:
            query = f"""
                DELETE FROM events
                WHERE event_id = %s
            """
            self.cursor.execute(query, (event_id,))
            self.conn.commit()
            print(f"Event with ID {event_id} deleted successfully.")
        except Exception as e:
            self.conn.rollback()
            print(f"Error deleting event: {e}")

    def get_all_events(self):
        try:
            query = f"""
                SELECT event_id, event_name, event_description, event_date, event_price, performer_name
                FROM events
            """
            self.cursor.execute(query)
            rows = self.cursor.fetchall()
            if rows:
                print("All Events:")
                for row in rows:
                    print(f"  ID: {row[0]}, Name: {row[1]}, Description: {row[2]}, Date: {row[3]}, Price: {row[4]}, Performer: {row[5]}")
            else:
                print("No events found.")

        except Exception as e:
            print(f"Error retrieving all events: {e}")