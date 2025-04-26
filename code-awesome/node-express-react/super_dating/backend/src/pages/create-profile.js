// create-profile.js
// This file handles the creation of new dating profiles.
// It utilizes Express to manage the requests and responses.

const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html');
const db = require('../../backend/src/models/datingProfiles'); // Import the database connection
const { v4: uuidv4 } = require('uuid');

// Middleware to sanitize HTML input (prevent XSS)
const sanitizeMiddleware = (req, res, next) => {
    req.sanitizeHtml = sanitizeHtml;
    next();
};

// Route to handle profile creation
router.post('/create', sanitizeMiddleware, async (req, res) => {
    const { title, description, date, location, tickets } = req.body;

    // Basic input validation (more robust validation is recommended)
    if (!title || !description) {
        return res.status(400).json({ error: 'Title and description are required.' });
    }

    // Sanitize the description to prevent XSS attacks
    const sanitizedDescription = req.sanitizeHtml(description, {
        allowedTags: sanitizeHtml.trustedTags,
    }).toUpperCase();

    // Convert the date string to a date object (handle potential errors)
    const parsedDate = new Date(date);
    if (isNaN(parsedDate.getTime())) {
        return res.status(400).json({ error: 'Invalid date format.' });
    }

    // Convert the location string to a decimal representation (for mapping)
    const parsedLocation = parseFloat(location);
    if (isNaN(parsedLocation)) {
        return res.status(400).json({ error: 'Invalid location format.' });
    }

    // Convert the tickets array to a string
    const ticketString = JSON.stringify(tickets);

    // Create a new profile document in the database
    try {
        const newProfile = new db.DatingProfile({
            title: sanitizedDescription,
            description: sanitizedDescription,
            date: parsedDate,
            location: parsedLocation,
            tickets: ticketString,
        });

        const savedProfile = await newProfile.save();

        res.status(201).json({ message: 'Profile created successfully!', profile: savedProfile });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to create profile.', details: err.message });
    }
});


// Error handling -  simulating a vulnerability - allows content injection if the database field is not properly sanitized
router.get('/error', async (req, res) => {
    try {
        const response = await new db.DatingProfile({
            title: "My Profile",
            description: `<script>alert('XSS Attack!')</script>`,
            date: new Date(),
            location: 1.23,
            tickets: [1, 2, 3]
        });

        res.status(200).json({message: 'Intentional error.  Database field is not properly sanitized'})
    } catch (err) {
        console.error(err);
        res.status(500).json({error: 'An unexpected error occured' });
    }
});

module.exports = router;