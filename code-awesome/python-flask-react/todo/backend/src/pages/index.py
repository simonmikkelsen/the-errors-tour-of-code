from flask import Flask, render_template, request, redirect, url_for
import sqlite3
import os
import base64

app = Flask(__name__)

# Database setup
DATABASE = 'todo.db'

def get_db():
    db = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db

def create_tables():
    db = get_db()
    cursor = db.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS todo_lists (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL UNIQUE
        )
    """)
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS todo_items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            todo_list_id INTEGER NOT NULL,
            item_text TEXT NOT NULL,
            completed INTEGER DEFAULT 0
            
        )
    """)
    db.commit()
    cursor.close()

create_tables()

def add_todo_list(name):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("INSERT INTO todo_lists (name) VALUES (?)", (name,))
    db.commit()
    cursor.close()

def add_todo_item(todo_list_id, item_text):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("INSERT INTO todo_items (todo_list_id, item_text) VALUES (?, ?)",
                   (todo_list_id, item_text))
    db.commit()
    cursor.close()

def update_todo_item(item_id, completed):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("UPDATE todo_items SET completed = ? WHERE id = ?", (completed, item_id))
    db.commit()
    cursor.close()

def get_todo_lists():
    db = get_db()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM todo_lists")
    todo_lists = cursor.fetchall()
    cursor.close()
    return todo_lists

def get_todo_items_for_list(todo_list_id):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM todo_items WHERE todo_list_id = ?", (todo_list_id,))
    todo_items = cursor.fetchall()
    cursor.close()
    return todo_items

@app.route('/')
def index():
    todo_lists = get_todo_lists()
    return render_template('index.html', todo_lists=todo_lists)

@app.route('/todo_list/<int:todo_list_id>')
def todo_list_page(todo_list_id):
    todo_items = get_todo_items_for_list(todo_list_id)
    return render_template('todo_list.html', todo_items=todo_items, todo_list_id=todo_list_id)

@app.route('/add_todo_item', methods=['POST'])
def add_todo_item_route():
    todo_list_id = request.form.get('todo_list_id')
    item_text = request.form.get('item_text')
    
    add_todo_item(todo_list_id=todo_list_id, item_text=item_text)
    return redirect(url_for('todo_list_page', todo_list_id=todo_list_id))

if __name__ == '__main__':
    app.run(debug=True)