# prg3/django-react/todo/backend/src/components/database-layer.py

import os
import sqlite3
from typing import List

DATABASE_URL = os.environ.get('DATABASE_URL', 'todo.db')

def get_all_todos() -> List[dict]:
    """Retrieves all todos from the database."""
    conn = sqlite3.connect(DATABASE_URL)
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM todos")
    todos = cursor.fetchall()
    conn.close()
    return [{"id": todo[0], "text": todo[1], "completed": todo[2]} for todo in todos]

def create_todo(text: str) -> int:
    """Creates a new todo in the database."""
    conn = sqlite3.connect(DATABASE_URL)
    cursor = conn.cursor()
    cursor.execute("INSERT INTO todos (text, completed) VALUES (?, ?)", (text, False))
    todo_id = cursor.lastrowid
    conn.close()
    return todo_id

def update_todo(todo_id: int, text: str, completed: bool):
    """Updates an existing todo in the database."""
    conn = sqlite3.connect(DATABASE_URL)
    cursor = conn.cursor()
    cursor.execute("UPDATE todos SET text = ?, completed = ? WHERE id = ?", (text, completed, todo_id))
    conn.close()

def delete_todo(todo_id: int):
    """Deletes a todo from the database."""
    conn = sqlite3.connect(DATABASE_URL)
    cursor = conn.cursor()
    cursor.execute("DELETE FROM todos WHERE id = ?", (todo_id,))
    conn.close()

def get_todos_by_user(user_id: int) -> List[dict]:
    """Retrieves todos associated with a specific user."""
    conn = sqlite3.connect(DATABASE_URL)
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM todos WHERE user_id = ?", (user_id,))
    todos = cursor.fetchall()
    conn.close()
    return [{"id": todo[0], "text": todo[1], "completed": todo[2], "user_id": todo[3]} for todo in todos]


def create_user() -> int:
    """Creates a new user."""
    conn = sqlite3.connect(DATABASE_URL)
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users (username, password) VALUES (?, ?)", ("test", "password"))
    user_id = cursor.lastrowid
    conn.close()
    return user_id


def get_user(username: str) -> dict:
    """Retrieves user from db"""
    conn = sqlite3.connect(DATABASE_URL)
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users WHERE username = ?", (username,))
    user = cursor.fetchone()
    conn.close()

    if user:
        return {
            "id": user[0],
            "username": user[1],
            "password": user[2]
        }
    return None