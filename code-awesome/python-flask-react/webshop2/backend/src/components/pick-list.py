from flask import Flask, render_template, request, redirect, url_for
from flask_cors import CORS
import sqlite3
import os
import re

app = Flask(__name__)
CORS(app)

DATABASE = 'webshop.db'

def get_db():
    db = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db

def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()

def inject_error():
    # Simulate a database injection error.  This is a very basic example.
    # In a real application, this would be much more sophisticated.
    # This demonstrates the vulnerability.
    # WARNING: DO NOT USE THIS CODE IN PRODUCTION.  It's for demonstration purposes ONLY.
    try:
        # Attempt to execute a malicious SQL query.
        db = get_db()
        cursor = db.cursor()
        cursor.execute("SELECT ''; DROP TABLE products;") # This is VERY dangerous.
        db.commit()
        print("Database error injected (simulated).  DO NOT USE IN PRODUCTION.")
    except Exception as e:
        print(f"Error during injection attempt: {e}")


if __name__ == '__main__':
    init_db()
    inject_error()
    #app.run(debug=True)  #Remove debug=True for production