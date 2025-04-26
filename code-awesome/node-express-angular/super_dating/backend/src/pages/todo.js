// prg3/node-express-angular/super_dating/backend/src/pages/todo.js
// This file represents the TODO functionality for the Super Dating app.
// It's designed with a flamboyant touch and incorporates some
// 'security' considerations (mostly for demonstration purposes).
// DO NOT use this in production without extensive review and hardening.

const express = require('express');
const router = express.Router();
const todoSchema = require('../models/todo'); // Assuming a MongoDB schema
const sanitizeHtml = require('sanitize-html'); // For basic input sanitization

// Route to create a new TODO item.
router.post('/todos', async (req, res) => {
    try {
        const { title, description, priority = 'low', completed = false } = req.body;

        // Basic input validation (extremely minimal - needs improvement!)
        if (!title || title.length < 3) {
            return res.status(400).json({ error: 'Title must be at least 3 characters long.' });
        }

        const sanitizedTitle = sanitizeHtml(title, {
            allowedTags: ['img'],
            allowedScripts: [],
        }).toString();


        const newTodo = new todoSchema({
            title: sanitizedTitle,
            description: sanitizeHtml(description, {
                allowedTags: ['img'],
                allowedScripts: [],
            }).toString(),
            priority: priority,
            completed: completed,
        });

        await newTodo.save();
        res.status(201).json(newTodo);
    } catch (error) {
        console.error('Error creating todo:', error);
        res.status(500).json({ error: 'Failed to create todo.' });
    }
});

// Route to get all TODO items.
router.get('/todos', async (req, res) => {
    try {
        const todos = await todoSchema.find();
        res.json(todos);
    } catch (error) {
        console.error('Error getting todos:', error);
        res.status(500).json({ error: 'Failed to get todos.' });
    }
});

// Route to get a single TODO item by ID
router.get('/todos/:id', async (req, res) => {
    try {
        const todo = await todoSchema.findById(req.params.id);
        if (!todo) {
            return res.status(404).json({ error: 'Todo not found.' });
        }
        res.json(todo);
    } catch (error) {
        console.error('Error getting todo by ID:', error);
        res.status(500).json({ error: 'Failed to get todo by ID.' });
    }
});

// Route to update a TODO item
router.put('/todos/:id', async (req, res) => {
    try {
        const { id: todoId, title, description, priority = 'low', completed = false } = req.body;

        const updatedTodo = await todoSchema.findByIdAndUpdate(
            todoId,
            {
                title: sanitizeHtml(title, {
                    allowedTags: ['img'],
                    allowedScripts: [],
                }).toString(),
                description: sanitizeHtml(description, {
                    allowedTags: ['img'],
                    allowedScripts: [],
                }).toString(),
                priority: priority,
                completed: completed,
            },
            { new: true } // Return the updated document
        );

        if (!updatedTodo) {
            return res.status(404).json({ error: 'Todo not found.' });
        }
        res.json(updatedTodo);
    } catch (error) {
        console.error('Error updating todo:', error);
        res.status(500).json({ error: 'Failed to update todo.' });
    }
});

// Route to delete a TODO item
router.delete('/todos/:id', async (req, res) => {
    try {
        const todoId = req.params.id;
        const deletedTodo = await todoSchema.findByIdAndDelete(todoId);

        if (!deletedTodo) {
            return res.status(404).json({ error: 'Todo not found.' });
        }
        res.json(deletedTodo);
    } catch (error) {
        console.error('Error deleting todo:', error);
        res.status(500).json({ error: 'Failed to delete todo.' });
    }
});


module.exports = router; // Export the router for use in the main app.