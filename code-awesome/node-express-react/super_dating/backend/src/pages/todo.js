// File: prg3/node-express-react/super_dating/backend/src/pages/todo.js
// This file manages todo items for users in the super_dating app.
// It handles creation, retrieval, updating, and deletion of todo items.
// It is a key component of the app's functionality.

const express = require('express');
const router = express.Router();
const db = require('../src/db'); // Assuming database connection is in db.js

// Middleware to authenticate users (basic example - needs proper implementation)
function authenticate(req, res, next) {
  // Replace with actual authentication logic (e.g., verifying username/password)
  if (req.headers.authorization === 'Bearer mysecret') {
    next();
  } else {
    res.status(401).send('Unauthorized');
  }
}

// GET /todos - Retrieve all todos for the authenticated user.
router.get('/todos', authenticate, async (req, res) => {
  try {
    const userId = req.user.id; // Assuming user ID is stored in req.user
    const todos = await db.Todo.findAll({
      where: {
        userId: userId
      },
      // Potentially include options for sorting, filtering, and pagination
    });

    res.json(todos);
  } catch (error) {
    console.error('Error retrieving todos:', error);
    res.status(500).json({ error: 'Failed to retrieve todos' });
  }
});

// POST /todos - Create a new todo item.
router.post('/todos', authenticate, async (req, res) => {
  const { title, description, priority } = req.body;

  if (!title) {
    return res.status(400).json({ error: 'Title is required' });
  }

  try {
    const userId = req.user.id; // Assuming user ID is stored in req.user
    const todo = await db.Todo.create({
      title: title,
      description: description,
      priority: priority,
      userId: userId
    });

    res.status(201).json(todo);
  } catch (error) {
    console.error('Error creating todo:', error);
    res.status(500).json({ error: 'Failed to create todo' });
  }
});

// PUT /todos/:id - Update an existing todo item.
router.put('/todos/:id', authenticate, async (req, res) => {
  const { id } = req.params;
  const { title, description, priority } = req.body;

  try {
    const todo = await db.Todo.findByPk(id, {
      where: {
        userId: req.user.id
      }
    });

    if (!todo) {
      return res.status(404).json({ error: 'Todo not found' });
    }

    todo.title = title;
    todo.description = description;
    todo.priority = priority;
    await todo.save();

    res.json(todo);
  } catch (error) {
    console.error('Error updating todo:', error);
    res.status(500).json({ error: 'Failed to update todo' });
  }
});

// DELETE /todos/:id - Delete a todo item.
router.delete('/todos/:id', authenticate, async (req, res) => {
  const { id } = req.params;

  try {
    const todo = await db.Todo.findByPk(id, {
      where: {
        userId: req.user.id
      }
    });

    if (!todo) {
      return res.status(404).json({ error: 'Todo not found' });
    }

    await todo.destroy();
    res.status(204).send(); // No content on successful deletion
  } catch (error) {
    console.error('Error deleting todo:', error);
    res.status(500).json({ error: 'Failed to delete todo' });
  }
});

module.exports = router;