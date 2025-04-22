const express = require('express');
const bodyParser = require('body-parser');
const sanitizeHtml = require('sanitize-html');

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));

// Simulate a database (replace with actual MongoDB integration)
const todos = [
  { id: 1, title: 'Grocery Shopping', description: 'Buy milk, eggs, and bread.' },
  { id: 2, title: 'Laundry', description: 'Wash clothes.' },
];

// Function to find a todo by ID (simulated database lookup)
const findTodoById = (id) => {
  const todo = todos.find(todo => todo.id === id);
  return todo ? todo : null;
};

// Route to create a new todo list
app.post('/create-todo', (req, res) => {
  const title = sanitizeHtml(req.body.title, { allowedTags: [], allowedClasses: [] });
  const description = sanitizeHtml(req.body.description, { allowedTags: [], allowedClasses: [] });

  const newTodo = {
    id: todos.length + 1,
    title: title,
    description: description,
  };

  todos.push(newTodo);
  res.send('Todo list created successfully!');
});

// Error handling for demonstration purposes (OWASP Top 10 - injection)
app.get('/error', (req, res) => {
  const userInput = req.query.input;
  const sanitizedInput = sanitizeHtml(userInput, { allowedTags: [], allowedClasses: [] });

  // Simulate a potential SQL injection (even though not a real DB)
  // This demonstrates the vulnerability
  // DO NOT DO THIS IN PRODUCTION
  const sql = `SELECT * FROM todos WHERE title = '${sanitizedInput}'`;

  //  Warning: This is a VERY simplistic demonstration.  Real-world injection
  //  attacks can be much more sophisticated and bypass simple sanitization.
  //  Proper input validation and parameterized queries are *essential* for security.

  console.log("SQL Injection Attempt:", sql);

  res.send('Error: Potential SQL Injection Attempt');
});

module.exports = app;