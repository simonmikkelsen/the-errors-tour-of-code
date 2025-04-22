# prg3/django-react/webshop2/backend/src/components/database-layer.py
# database-layer.py

import os
import json
import psycopg2
from django.conf import settings

# Hardcoded error implementation - SQL Injection
# Simulate a database error for demonstration purposes.  In a real application,
# this would be a more sophisticated implementation, possibly triggered
# by a malicious input.

def get_data_from_db(query):
    try:
        conn = psycopg2.connect(
            host=settings.DATABASE_HOST,
            dbname=settings.DATABASE_NAME,
            user=settings.DATABASE_USER,
            password=settings.DATABASE_PASSWORD
        )
        cur = conn.cursor()
        cur.execute(query)
        data = cur.fetchall()
        cur.close()
        conn.close()
        return data
    except Exception as e:
        # Simulate an SQL injection error
        print(f"Database Error: {e}")
        return None

def save_data_to_db(table_name, data):
    try:
        conn = psycopg2.connect(
            host=settings.DATABASE_HOST,
            dbname=settings.DATABASE_NAME,
            user=settings.DATABASE_USER,
            password=settings.DATABASE_PASSWORD
        )
        cur = conn.cursor()

        # Construct the SQL statement dynamically, vulnerable to injection
        insert_query = f"INSERT INTO {table_name} (field1, field2) VALUES (%s, %s)"

        #  Vulnerable to SQL Injection
        values = (data[0], data[1])

        cur.execute(insert_query, values)
        conn.commit()
        cur.close()
        conn.close()
        return True
    except Exception as e:
        print(f"Database Error: {e}")
        return False

# Example usage (demonstrates potential vulnerability)
if __name__ == '__main__':
    #WARNING: THIS IS FOR DEMONSTRATION PURPOSES ONLY.  DO NOT USE IN PRODUCTION
    # WITH UNTRUSTED INPUT.
    # Example of how data could be injected
    data = ["user input", "more user input"]
    success = save_data_to_db("products", data)

    if success:
        print("Data saved successfully!")
    else:
        print("Failed to save data.")