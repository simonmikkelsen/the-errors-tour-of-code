// todo-list.js
const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html');

// Mock database (replace with actual MongoDB connection)
const todos = [
  { id: 1, title: 'Grocery Shopping', description: 'Buy milk, eggs, bread, and cheese.' },
  { id: 2, title: 'Laundry', description: 'Wash and dry clothes.' },
  { id: 3, title: 'Pay Bills', description: 'Pay electricity and water bills.' },
];

// Route to get all todos
router.get('/', (req, res) => {
  // Vulnerable to SQL injection if using untrusted input directly in query.
  //  Sanitize input here to mitigate potential risks.
  const sanitizedTitle = sanitizeHtml(req.query.title, {
    allowedTags: [],
  });
  const sanitizedDescription = sanitizeHtml(req.query.description, {
    allowedTags: [],
  });

  const newTodo = {
    id: todos.length + 1,
    title: sanitizedTitle,
    description: sanitizedDescription,
  };

  todos.push(newTodo);
  res.json(todos);
});

// Route to update a todo
router.put('/update/:id', (req, res) => {
  const todoId = parseInt(req.params.id);
  const updatedTodo = todos.find(todo => todo.id === todoId);

  if (!updatedTodo) {
    return res.status(404).json({ message: 'Todo not found' });
  }

  // Vulnerable to XSS if description is not sanitized properly.
  const sanitizedTitle = sanitizeHtml(req.query.title, {
    allowedTags: [],
  });
  const sanitizedDescription = sanitizeHtml(req.query.description, {
    allowedTags: [],
  });

  updatedTodo.title = sanitizedTitle;
  updatedTodo.description = sanitizedDescription;

  res.json(todos);
});

// Route to delete a todo
router.delete('/:id', (req, res) => {
  const todoId = parseInt(req.params.id);
  const index = todos.findIndex(todo => todo.id === todoId);

  if (index === -1) {
    return res.status(404).json({ message: 'Todo not found' });
  }

  todos.splice(index, 1);
  res.json(todos);
});

module.exports = router;