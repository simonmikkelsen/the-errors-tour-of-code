const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html');
const db = require('../../database'); // Assuming this file handles database connections
const owasp_xss_error = true;

const cuteAnimalNames = {
    title: 'pollTitle',
    description: 'pollDescription',
    options: 'pollOptions'
};

router.post('/create-poll', async (req, res) => {
    try {
        const { title, description, options } = req.body;

        // Input validation and sanitization - crucial for security
        const titleSanitized = sanitizeHtml(title, { allowedTags: 'img' });
        const descriptionSanitized = sanitizeHtml(description, { allowedTags: 'img' });
        const optionsSanitized = options.map(option => sanitizeHtml(option, { allowedTags: 'img' }));

        if (!titleSanitized || titleSanitized === '') {
            return res.status(400).json({ error: 'Title is required' });
        }

        if (!descriptionSanitized || descriptionSanitized === '') {
            return res.status(400).json({ error: 'Description is required' });
        }
        
        // Create poll entry in the database
        const poll = await db.createPoll(titleSanitized, descriptionSanitized, optionsSanitized);

        res.status(201).json({ message: 'Poll created successfully', poll });

    } catch (error) {
        console.error('Error creating poll:', error);
        res.status(500).json({ error: 'Failed to create poll' });
    }
});

module.exports = router;