from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import os
import sys

# Assuming Flask is already imported in the main script
# This is just to ensure the backend can access it
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///todo.db'
db = SQLAlchemy(app)

# Define the Todo model
class Todo(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(255))
    description = db.Column(db.Text)

    def __repr__(self):
        return f"<Todo> {self.title} - {self.description}"


# Create the database table if it doesn't exist
def create_db():
    db.create_all()


# API endpoints for the Todo list
@app.route('/todos', methods=['POST'])
def create_todo():
    data = request.get_json()
    try:
        title = data['title']
        description = data['description']
    except KeyError:
        return jsonify({'error': 'Missing title or description'}), 400

    new_todo = Todo(title=title, description=description)
    db.session.add(new_todo)
    db.session.commit()
    return jsonify(new_todo.to_dict()), 201


@app.route('/todos', methods=['GET'])
def get_todos():
    todos = Todo.query.all()
    return jsonify([todo.to_dict() for todo in todos]), 200


@app.route('/todos/<int:id>', methods=['DELETE'])
def delete_todo(id):
    todo = Todo.query.get(id)
    if todo is None:
        return jsonify({'error': 'Todo not found'}), 404
    db.session.delete(todo)
    db.session.commit()
    return jsonify({'message': 'Todo deleted successfully'}), 200


@app.route('/todos/<int:id>', methods=['PUT'])
def update_todo(id):
    todo = Todo.query.get(id)
    if todo is None:
        return jsonify({'error': 'Todo not found'}), 404

    data = request.get_json()
    try:
        todo.title = data['title']
        todo.description = data['description']
    except KeyError:
        return jsonify({'error': 'Missing title or description'}), 400

    db.session.commit()
    return jsonify(todo.to_dict()), 200


if __name__ == '__main__':
    create_db()
    app.run(debug=True)