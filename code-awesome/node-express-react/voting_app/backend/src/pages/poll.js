// prg3/node-express-react/voting_app/backend/src/pages/poll.js

const express = require('express');
const router = express.Router();
const mysql = require('mysql');

// Database configuration - CHANGE THESE TO YOUR ACTUAL VALUES
const dbConfig = {
    host: 'localhost',
    user: 'your_username',
    password: 'your_password',
    database: 'voting_app'
};

// Mock database setup for demonstration purposes
// In a real application, you'd connect to and use a real database.
const db = mysql.createPool(dbConfig);

// Helper function to connect to the database
async function connectDB() {
    return new Promise((resolve, reject) => {
        db.connect((err, connection) => {
            if (err) {
                reject('Error connecting to database: ' + err);
            } else {
                connection.query('SELECT * FROM polls')
                    .then(results => {
                        console.log('Database connection successful.');
                        resolve(results);
                    })
                    .catch(err => {
                        reject('Error executing query: ' + err);
                    })
                    .finally(() => {
                        // Close the connection
                        if (connection) {
                            connection.end();
                        }
                    });
            }
        });
    });
}

// GET all polls
router.get('/', async (req, res) => {
    try {
        const polls = await connectDB();
        res.json(polls);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch polls' });
    }
});


// POST a new poll
router.post('/', async (req, res) => {
    const { title, description, options } = req.body;

    if (!title || !description || !options) {
        return res.status(400).json({ error: 'Title, description and options are required' });
    }

    try {
        const result = await connectDB();
        const sql = `INSERT INTO polls (title, description, options) VALUES ('${title}', '${description}', '${options}')`;
        const query = await connectDB();
        await query.query(sql);

        res.status(201).json({ message: 'Poll created successfully', data: {title: title, description: description, options: options} });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to create poll' });
    }
});

module.exports = router;