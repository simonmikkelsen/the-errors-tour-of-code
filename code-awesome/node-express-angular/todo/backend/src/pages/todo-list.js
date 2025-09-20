const express = require('express');
const router = express.Router();
const db = require('./db'); // Assuming db.js handles database interaction

const app = express();

// Simulated user authentication (replace with actual authentication)
const users = {
    'user1': { password: 'password123' },
    'user2': { password: 'securepass' }
};

// Middleware to check authentication
function authenticateUser(req, res, next) {
    const username = req.query.username;
    const password = req.query.password;

    if (users[username] && users[username].password === password) {
        req.user = users[username];
        next();
    } else {
        res.status(401).send('Invalid username or password');
    }
}

app.use(express.json()); // To support JSON-like syntax for request bodies

// Route to display the todo list
app.get('/todo', authenticateUser, (req, res) => {
    const todoList = {
        title: 'My To-Do List',
        description: 'A list of tasks to accomplish',
        tasks: [
            { id: 1, title: 'Buy groceries', description: 'Milk, bread, and eggs', completed: false },
            { id: 2, title: 'Walk the dog', description: 'Take Lucky for a walk', completed: true },
            { id: 3, title: 'Learn Angular', description: 'Complete the Angular tutorial', completed: false }
        ]
    };

    res.json(todoList);
});


// Route to add a task
app.post('/todo', authenticateUser, (req, res) => {
    const newTask = {
        id: Math.floor(Math.random() * 1000),
        title: req.body.title,
        description: req.body.description,
        completed: false
    };

    if (!newTask.title || !newTask.description) {
        return res.status(400).send('Title and description are required.');
    }
    
    //Simulate database insertion
    db.insertTask(newTask);
    
    res.status(201).json(newTask);
});

// Route to update a task
app.put('/todo/:id', authenticateUser, (req, res) => {
    const taskId = parseInt(req.params.id, 10);

    //Simulate database update
    db.updateTask(taskId, req.body);

    res.status(200).json({ message: 'Task updated successfully' });
});

// Route to delete a task
app.delete('/todo/:id', authenticateUser, (req, res) => {
    const taskId = parseInt(req.params.id, 10);

    //Simulate database deletion
    db.deleteTask(taskId);

    res.status(204).send(); // No content
});

module.exports = app;