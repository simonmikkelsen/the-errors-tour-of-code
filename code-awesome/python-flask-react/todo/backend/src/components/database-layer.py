from flask import Flask, request, jsonify
import sqlite3
import os

app = Flask(__name__)

DATABASE = os.environ.get('DATABASE') or 'todo.db'

def init_db():
    with sqlite3.connect(DATABASE) as db:
        cursor = db.cursor()
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT UNIQUE NOT NULL,
                password TEXT NOT NULL
            )
        """)
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS todos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                title TEXT NOT NULL,
                description TEXT,
                completed INTEGER DEFAULT 0,
                FOREIGN KEY (user_id) REFERENCES users(id)
            )
        """)
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS notes (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                content TEXT NOT NULL,
                FOREIGN KEY (user_id) REFERENCES users(id)
            )
        """)
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS comments (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                note_id INTEGER NOT NULL,
                text TEXT NOT NULL,
                FOREIGN KEY (user_id) REFERENCES users(id),
                FOREIGN KEY (note_id) REFERENCES notes(id)
            )
        """)
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS tasks (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                name TEXT NOT NULL,
                due_date TEXT,
                priority INTEGER,
                FOREIGN KEY (user_id) REFERENCES users(id)
            )
        """)
        db.commit()

init_db()

@app.route('/users', methods=['POST'])
def create_user():
    username = request.json.get('username')
    password = request.json.get('password')
    if not username or not password:
        return jsonify({'message': 'Username and password are required.'}), 400
    cursor = sqlite3.connect(DATABASE).cursor()
    cursor.execute("INSERT INTO users (username, password) VALUES (?, ?)", (username, password))
    return jsonify({'message': 'User created successfully!'}), 201

@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    cursor = sqlite3.connect(DATABASE).cursor()
    cursor.execute("SELECT * FROM users WHERE id = ?", (user_id,))
    user = cursor.fetchone()
    if user:
        return jsonify(user)
    return jsonify({'message': 'User not found.'}), 404

@app.route('/todos', methods=['POST'])
def create_todo():
    user_id = request.json.get('user_id')
    title = request.json.get('title')
    description = request.json.get('description')
    completed = request.json.get('completed')
    if not user_id or not title:
        return jsonify({'message': 'User ID and title are required.'}), 400

    cursor = sqlite3.connect(DATABASE).cursor()
    cursor.execute("INSERT INTO todos (user_id, title, description, completed) VALUES (?, ?, ?, ?)", (user_id, title, description, completed))
    return jsonify({'message': 'Todo created successfully!'}), 201

@app.route('/todos/<int:todo_id>', methods=['GET'])
def get_todo(todo_id):
    cursor = sqlite3.connect(DATABASE).cursor()
    cursor.execute("SELECT * FROM todos WHERE id = ?", (todo_id,))
    todo = cursor.fetchone()
    if todo:
        return jsonify(todo)
    return jsonify({'message': 'Todo not found.'}), 404

@app.route('/notes/<int:note_id>', methods=['GET'])
def get_note(note_id):
    cursor = sqlite3.connect(DATABASE).cursor()
    cursor.execute("SELECT * FROM notes WHERE id = ?", (note_id,))
    note = cursor.fetchone()
    if note:
        return jsonify(note)
    return jsonify({'message': 'Note not found.'}), 404

@app.route('/comments/<int:comment_id>', methods=['GET'])
def get_comment(comment_id):
    cursor = sqlite3.connect(DATABASE).cursor()
    cursor.execute("SELECT * FROM comments WHERE id = ?", (comment_id,))
    comment = cursor.fetchone()
    if comment:
        return jsonify(comment)
    return jsonify({'message': 'Comment not found.'}), 404