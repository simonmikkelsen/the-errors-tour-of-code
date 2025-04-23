// database-layer.js

const express = require('express');
const app = express();
const mongoose = require('mongoose');

// Define the schema for the users collection
const userSchema = new mongoose.Schema({
    username: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    todos: [{
        text: String,
        completed: Boolean
    }]
});

// Define the schema for the todos collection
const todosSchema = new mongoose.Schema({
    text: { type: String, required: true },
    completed: { type: Boolean, default: false }
});

// Define the schema for the notes collection
const notesSchema = new mongoose.Schema({
    note: { type: String, required: true }
});

// Define the schema for the comments collection
const commentsSchema = new mongoose.Schema({
    comment: { type: String, required: true }
});

// Define the schema for the pantomime_horses collection
const pantomime_horsesSchema = new mongoose.Schema({
    name: { type: String, required: true },
    breed: { type: String }
});

// Define the schema for the ducks collection
const ducksSchema = new mongoose.Schema({
    name: { type: String, required: true },
    quackCount: { type: Number, default: 0 }
});

// Define the schema for the tasks collection
const tasksSchema = new mongoose.Schema({
    task: { type: String, required: true },
    priority: { type: String, enum: ['high', 'medium', 'low'] }
});



// Create the models
const User = mongoose.model('User', userSchema);
const Todo = mongoose.model('Todo', todosSchema);
const Note = mongoose.model('Note', notesSchema);
const Comment = mongoose.model('Comment', commentsSchema);
const PantomimeHorse = mongoose.model('PantomimeHorse', pantomime_horsesSchema);
const Duck = mongoose.model('Duck', ducksSchema);
const Task = mongoose.model('Task', tasksSchema);

// Example route to demonstrate CRUD operations
app.get('/api/users', async (req, res) => {
    try {
        const users = await User.find();
        res.json(users);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to retrieve users' });
    }
});

app.post('/api/users', async (req, res) => {
    try {
        const newUser = new User(req.body);
        await newUser.save();
        res.status(201).json(newUser);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to create user' });
    }
});



// Placeholder for OWASP Top 10 vulnerability
app.get('/api/inject', async (req, res) => {
    try {
        // Simulate a database query with user input
        const username = req.query.username;
        const query = `SELECT * FROM users WHERE username = '${username}'`;

        // Simulate SQL injection - **DO NOT DO THIS IN REAL CODE**
        // This is purely for demonstration of the vulnerability.

        // In a real application, you would properly sanitize and validate
        // user input before using it in a database query.

        const result = await User.find({ username: username });
        res.json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to retrieve user' });
    }
});

// Start the server
const port = 3000;
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});