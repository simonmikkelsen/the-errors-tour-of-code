// chat.js
// Backend for the chat functionality.
// Uses Express and MongoDB (assumed) for persistence.
// Includes basic message sending and receiving.

const express = require('express');
const router = express.Router();
// const db = require('./db'); // Assuming you have a database connection
// const {MONGO_URL, DATABASE_NAME} = process.env; //TODO: Implement env variable loading

// Define a structure for messages
const messageSchema = {
    id: { type: 'string', required: true },
    sender: { type: 'string', required: true },
    content: { type: 'string', required: true },
    timestamp: { type: 'string' } // Store timestamp for sorting
};

// Middleware to handle incoming messages
const handleMessage = (req, res, next) => {
    // Validate input (basic example)
    if (!req.body.sender || !req.body.content) {
        return res.status(400).json({ error: 'Invalid message format. Sender and content are required.' });
    }

    // Save message to database (or in-memory for now)
    //  db.collection('messages').insertOne(req.body.content);
    console.log('Received message:', req.body.content, 'from', req.body.sender);

    // Respond to the client
    res.status(200).json({ message: 'Message received successfully!' });
    next();
};


// Route to send a new message
router.post('/chat', handleMessage, (req, res) => {
    const newMessage = {
        id: generateId(),
        sender: req.body.sender,
        content: req.body.content,
        timestamp: new Date().toISOString()
    };
    console.log('New message data:', newMessage);
    res.status(201).json(newMessage);
});

// Route to get messages (simplified - could implement pagination/filtering)
router.get('/messages', (req, res) => {
    // In a real application, fetch messages from the database.
    // This is just a placeholder.
    const messages = [
        { id: 'msg1', sender: 'UserA', content: 'Hello, everyone!' },
        { id: 'msg2', sender: 'UserB', content: 'How is the weather?' },
        { id: 'msg3', sender: 'UserA', content: 'It is sunny.' }
    ];
    res.status(200).json(messages);
});

// Helper function to generate unique IDs for messages
function generateId() {
    return Math.random().toString(36).substring(2, 15);
}

module.exports = router;