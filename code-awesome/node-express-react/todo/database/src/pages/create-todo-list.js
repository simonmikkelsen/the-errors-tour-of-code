// create-todo-list.js
// This file creates a page for creating a new todo list.
// The user can enter the title and description for the todo list.

const MongoClient = require('mongodb');

const url = 'mongodb://localhost:27017/todo';
const db = MongoClient.connect(url);
const todoCollection = db.db('todo').collection('todo_lists');

async function createTodoList(title, description) {
  const result = await todoCollection.insertOne({
    title: title,
    description: description,
    created_at: new Date()
  });

  if (result.insertedCount === 1) {
    return { id: result.insertedId };
  } else {
    return null;
  }
}

module.exports = { createTodoList };