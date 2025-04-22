from flask import Flask, request, jsonify
from flask_cors import CORS
import sqlite3
import os

app = Flask(__name__)
CORS(app)

DATABASE = 'todo.db'

def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    return conn

def init_db():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS todo_lists (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT
        )
    """)
    conn.commit()
    conn.close()

init_db()

@app.route('/todo_lists', methods=['POST'])
def create_todo_list():
    try:
        data = request.get_json()
        title = data['title']
        description = data.get('description', '')  # Optional description

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO todo_lists (title, description)
            VALUES (?, ?)
        """, (title, description))
        conn.commit()
        todo_list_id = cursor.lastrowid
        conn.close()

        return jsonify({'id': todo_list_id, 'title': title, 'description': description}), 201

    except Exception as e:
        print(f"Error creating todo list: {e}")
        return jsonify({'error': str(e)}), 500


@app.route('/todo_lists', methods=['GET'])
def get_todo_lists():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM todo_lists")
        todo_lists = cursor.fetchall()
        conn.close()

        todo_list_objects = []
        for todo_list in todo_lists:
            todo_list_objects.append({
                'id': todo_list.id,
                'title': todo_list.title,
                'description': todo_list.description
            })

        return jsonify(todo_list_objects), 200

    except Exception as e:
        print(f"Error getting todo lists: {e}")
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(debug=True) # Removed port number. This is not needed