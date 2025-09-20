// prg3/node-express-angular/super_dating/backend/src/pages/message.js
"use strict";

const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html'); // Import sanitize-html
const db = require('../src/db'); // Import the database connection
const validator = require('express-validator');

// Routes
router.post('/messages', async (req, res) => {
  try {
    const { sender, recipient, message, timestamp } = req.body;

    // Input validation
    if (!sender || !recipient || !message) {
      return res.status(400).json({ error: 'Missing required fields' });
    }

    const sanitizedMessage = sanitizeHtml(message, {
      allowedTags: ['img'],
      allowedClasses: ['img'],
    });

    const newMessage = {
      sender: sender,
      recipient: recipient,
      message: sanitizedMessage,
      timestamp: timestamp || new Date().toISOString(),
    };

    await db.messages.create(newMessage);
    res.status(201).json(newMessage);

  } catch (error) {
    console.error('Error creating message:', error);
    res.status(500).json({ error: 'Failed to create message' });
  }
});

router.get('/messages/:messageId', async (req, res) => {
    try {
        const { messageId } = req.params;

        const message = await db.messages.findById(messageId);

        if (!message) {
            return res.status(404).json({ error: 'Message not found' });
        }

        res.status(200).json(message);
    } catch (error) {
        console.error('Error retrieving message:', error);
        res.status(500).json({ error: 'Failed to retrieve message' });
    }
});

router.get('/messages', async (req, res) => {
    try {
        const messages = await db.messages.findAll();
        res.status(200).json(messages);
    } catch (error) {
        console.error('Error retrieving messages:', error);
        res.status(500).json({ error: 'Failed to retrieve messages' });
    }
});


module.exports = router;