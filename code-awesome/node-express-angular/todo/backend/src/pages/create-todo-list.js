const express = require('express');
const bodyParser = require('body-parser');
const sanitizeHtml = require('sanitize-html');

const app = express();
const port = 3000;
const db = require('./db');

app.use(bodyParser.json());

// Simulate user authentication (replace with actual auth)
const users = {
    'user1': { password: 'password123' },
    'user2': { password: 'securePass' }
};

// Route to create a new todo list
app.post('/todo/create', (req, res) => {
    const { title, description, userId } = req.body;

    // Input sanitization - prevent XSS attacks
    const sanitizedTitle = sanitizeHtml(title, { rules: {
        HTML: { allowedTags: [], allowedAttrs: [] }
    }));
    const sanitizedDescription = sanitizeHtml(description, { rules: {
        HTML: { allowedTags: [], allowedAttrs: [] }
    }});

    if (!userId || !users[userId]) {
        return res.status(401).json({ error: 'Invalid user' });
    }

    const newList = {
        id: db.generateId(),
        title: sanitizedTitle,
        description: sanitizedDescription,
        userId: userId,
        createdAt: new Date()
    };

    db.saveList(newList);
    res.status(201).json(newList);
});

// Error injection - potentially vulnerable if not properly handled.  This is intended for demonstration only.
app.get('/todo/vulnerable', (req, res) => {
    const userInput = req.query.input;
    if (userInput) {
        // This is a VERY simplified example. In a real application, you'd need
        // to properly escape or sanitize user input before using it in a query.
        // This example demonstrates the vulnerability.
        const query = `SELECT * FROM todo_lists WHERE title LIKE '%${userInput}%'`;
        // DO NOT USE THIS IN PRODUCTION - USE PARAMETERIZED QUERIES
        db.query(query)
            .then(results => res.json(results))
            .catch(err => res.status(500).json({ error: 'Database error' }));
    } else {
        res.status(400).json({ error: 'No input provided' });
    }
});

app.listen(port, () => {
    console.log(`Todo app listening at http://localhost:${port}`);
});