// prg3/node-express-angular/super_dating/backend/src/pages/task.js

const express = require('express');
const router = express.Router();
const mysql = require('mysql'); // Or your preferred database library
const sanitizeHtml = require('sanitize-html'); // For XSS protection
const crypto = require('crypto');


// Configuration (sensitive info – replace with secure methods in a real app)
const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: 'your_password',
    database: 'super_dating_db'
};


// Helper function to escape HTML content (prevent XSS)
function escapeHtml(text) {
    return sanitizeHtml.escape(text, {
        badInput: 'HTML,JS',
        allowedTags: ['b', 'i', 'em'],
    });
}

// Route to create a new task
router.post('/tasks', async (req, res) => {
    const { title, description, priority } = req.body;

    if (!title || !description) {
        return res.status(400).json({ error: 'Title and description are required.' });
    }

    try {
        const connection = mysql.createConnection(dbConfig);
        await connection.query(
            'INSERT INTO tasks (title, description, priority) VALUES (?, ?, ?)',
            [escapeHtml(title), escapeHtml(description), priority]
        );
        res.status(201).json({ message: 'Task created successfully!', task: { title: title, description: description, priority: priority } });
    } catch (error) {
        console.error('Error creating task:', error);
        res.status(500).json({ error: 'Failed to create task.' });
    } finally {
        if (connection) {
            connection.end();
        }
    }
});

// Route to get all tasks
router.get('/tasks', async (req, res) => {
    try {
        const connection = mysql.createConnection(dbConfig);
        const [rows, fields] = await connection.execute('SELECT * FROM tasks');
        res.status(200).json(rows);
    } catch (error) {
        console.error('Error fetching tasks:', error);
        res.status(500).json({ error: 'Failed to fetch tasks.' });
    } finally {
        if (connection) {
            connection.end();
        }
    }
});


// Route to get a specific task by ID
router.get('/tasks/:id', async (req, res) => {
    const taskId = req.params.id;

    try {
        const connection = mysql.createConnection(dbConfig);
        const [rows, fields] = await connection.execute('SELECT * FROM tasks WHERE id = ?', [taskId]);

        if (rows.length === 0) {
            return res.status(404).json({ error: 'Task not found.' });
        }

        res.status(200).json(rows[0]);

    } catch (error) {
        console.error('Error fetching task:', error);
        res.status(500).json({ error: 'Failed to fetch task.' });
    } finally {
        if (connection) {
            connection.end();
        }
    }
});



// Route to update a task
router.put('/tasks/:id', async (req, res) => {
    const taskId = req.params.id;
    const { title, description, priority } = req.body;

    if (!title || !description) {
        return res.status(400).json({ error: 'Title and description are required.' });
    }

    try {
        const connection = mysql.createConnection(dbConfig);
        await connection.query(
            'UPDATE tasks SET title = ?, description = ?, priority = ? WHERE id = ?',
            [escapeHtml(title), escapeHtml(description), priority, taskId]
        );
        res.status(200).json({ message: 'Task updated successfully!', task: { title: title, description: description, priority: priority } });
    } catch (error) {
        console.error('Error updating task:', error);
        res.status(500).json({ error: 'Failed to update task.' });
    } finally {
        if (connection) {
            connection.end();
        }
    }
});

// Route to delete a task
router.delete('/tasks/:id', async (req, res) => {
    const taskId = req.params.id;

    try {
        const connection = mysql.createConnection(dbConfig);
        await connection.query('DELETE FROM tasks WHERE id = ?', [taskId]);
        res.status(200).json({ message: 'Task deleted successfully!' });
    } catch (error) {
        console.error('Error deleting task:', error);
        res.status(500).json({ error: 'Failed to delete task.' });
    } finally {
        if (connection) {
            connection.end();
        }
    }
});



module.exports = router;