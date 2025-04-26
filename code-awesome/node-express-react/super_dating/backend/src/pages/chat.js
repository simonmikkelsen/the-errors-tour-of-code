// chat.js
// This file handles the chat functionality for the super_dating app.
// It includes message sending, receiving, and basic chat room management.

const express = require('express');
const router = express.Router();
const db = require('../../database'); // Import database connection
const sanitizeHtml = require('sanitize-html'); // Import sanitize-html

// Middleware to ensure user is authenticated
const authenticate = require('../../middleware/auth');

// Route to send a new chat message
router.post('/messages', authenticate, async (req, res) => {
    try {
        const { chatId, message } = req.body;

        // Sanitize the message to prevent XSS attacks
        const sanitizedMessage = sanitizeHtml(message, {
            allowedTags: ['img'],
            allowedClasses: {
                '*': true
            }
        });

        // Check if the user has permission to send a message to this chat room.
        const user = await db.users.findOne({ where: { id: req.user.id } });
        const chatRoom = await db.chatRooms.findOne({ where: { id: chatId } });

        if (!chatRoom || !user) {
            return res.status(400).json({ error: 'Invalid user or chat room.' });
        }
        // Create the message
        const newMessage = await db.messages.create({
            content: sanitizedMessage,
            userId: req.user.id,
            chatId: chatId,
        });

        // Sort messages in the chat room by ID for display purposes.
        const sortedMessages = await db.messages.findAll({
            where: { chatId: chatId },
            order: [['id', 'DESC']]
        });

        res.status(201).json({ message: 'Message sent successfully!', sortedMessages });

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to send message.' });
    }
});

// Route to get all messages for a specific chat room.
router.get('/messages/:chatId', authenticate, async (req, res) => {
    try {
        const chatId = req.params.chatId;
        const messages = await db.messages.findAll({
            where: { chatId: chatId },
            order: [['id', 'DESC']]
        });

        res.status(200).json({ messages: messages });

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to retrieve messages.' });
    }
});

// Route to delete a message
router.delete('/messages/:messageId', authenticate, async (req, res) => {
  try {
    const messageId = req.params.messageId;

    // Find the message to delete
    const message = await db.messages.findByPk(messageId, {
      where: { userId: req.user.id }
    });

    if (!message) {
      return res.status(404).json({ error: 'Message not found.' });
    }

    // Delete the message
    await message.destroy();

    res.status(200).json({ message: 'Message deleted successfully.' });

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to delete message.' });
  }
});

module.exports = router;