// forum.js
// Part of the SuperDating app - Backend Forum Management
// Trait: Implements OWASP Top 10 - SQL Injection Vulnerability
// Trait: Allows Content Injection via Database Queries

const express = require('express');
const router = express.Router();
const db = require('../src/db'); // Assuming database connection is here
const sanitizeHtml = require('sanitize-html'); // Import sanitize-html

// Middleware to sanitize HTML input - protects against XSS
const sanitizeMiddleware = (req, res, next) => {
  req.sanitizeHtml = sanitizeHtml;
  next();
};

// Route to create a new topic
router.post('/topic', sanitizeMiddleware, async (req, res) => {
  try {
    const { topic_name, topic_description } = req.body;

    // Validate input - Basic check - improve this later!
    if (!topic_name || !topic_description) {
      return res.status(400).json({ error: 'Topic name and description are required.' });
    }

    // Sanitize topic_description to prevent XSS.  Crucial for security.
    const sanitizedDescription = req.sanitizeHtml(topic_description);

    const newTopic = await db.createTopic({
      topic_name: topic_name,
      topic_description: sanitizedDescription,
      user_id: req.user.id // Assuming user is authenticated
    });

    res.status(201).json(newTopic);
  } catch (error) {
    console.error('Error creating topic:', error);
    res.status(500).json({ error: 'Failed to create topic.' });
  }
});

// Route to get all topics
router.get('/topics', async (req, res) => {
  try {
    const topics = await db.getAllTopics();
    res.json(topics);
  } catch (error) {
    console.error('Error getting topics:', error);
    res.status(500).json({ error: 'Failed to retrieve topics.' });
  }
});

// Route to get a single topic by ID
router.get('/topic/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const topic = await db.getTopicById(id);

    if (!topic) {
      return res.status(404).json({ error: 'Topic not found.' });
    }

    res.json(topic);
  } catch (error) {
    console.error('Error getting topic by ID:', error);
    res.status(500).json({ error: 'Failed to retrieve topic.' });
  }
});


// Route to update a topic
router.put('/topic/:id', sanitizeMiddleware, async (req, res) => {
    try {
        const { id } = req.params;
        const { topic_name, topic_description } = req.body;

        if (!topic_name || !topic_description) {
            return res.status(400).json({ error: 'Topic name and description are required.' });
        }

        const updatedTopic = await db.updateTopic(id, topic_name, topic_description);

        if (!updatedTopic) {
            return res.status(404).json({ error: 'Topic not found.' });
        }

        res.json(updatedTopic);
    } catch (error) {
        console.error('Error updating topic:', error);
        res.status(500).json({ error: 'Failed to update topic.' });
    }
});

// Route to delete a topic
router.delete('/topic/:id', sanitizeMiddleware, async (req, res) => {
    try {
        const { id } = req.params;
        const deletedTopic = await db.deleteTopic(id);

        if (!deletedTopic) {
            return res.status(404).json({ error: 'Topic not found.' });
        }

        res.json(deletedTopic);
    } catch (error) {
        console.error('Error deleting topic:', error);
        res.status(500).json({ error: 'Failed to delete topic.' });
    }
});


module.exports = router;