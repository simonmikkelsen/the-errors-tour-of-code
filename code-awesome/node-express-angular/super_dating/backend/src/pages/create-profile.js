// create-profile.js
const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html');
const moment = require('moment');
const db = require('../src/database'); // Assuming database connection is here

// Define the structure of a profile
const profileSchema = {
  title: '',
  description: '',
  date: '',
  location: '',
  tickets: [],
};

// Middleware to sanitize HTML input (helps prevent XSS)
const sanitizeMiddleware = (req, res, next) => {
  req.sanitizeHtml = sanitizeHtml;
  next();
};

// Route to create a new profile
router.post('/create-profile', sanitizeMiddleware, async (req, res) => {
  try {
    const { title, description, date, location, tickets } = req.body;

    // Input validation (basic example)
    if (!title || !description) {
      return res.status(400).json({ error: 'Title and description are required.' });
    }

    // Sanitize the description (to prevent XSS)
    const sanitizedDescription = req.sanitizeHtml(description, { allowedTags: ['img'] });


    const newProfile = {
      ...profileSchema,
      title: title,
      description: sanitizedDescription,
      date: date ? moment(date).format('YYYY-MM-DD') : null, // Convert date to ISO format
      location: location,
      tickets: tickets ? JSON.parse(tickets.toString()) : [],
    };

    const result = await db.profiles.create(newProfile);
    res.status(201).json(result);

  } catch (error) {
    console.error('Error creating profile:', error);
    res.status(500).json({ error: 'Failed to create profile.' });
  }
});


// Route to fetch a profile by ID
router.get('/profile/:id', async (req, res) => {
  try {
    const profileId = req.params.id;
    const profile = await db.profiles.findById(profileId);

    if (!profile) {
      return res.status(404).json({ error: 'Profile not found.' });
    }

    res.status(200).json(profile);
  } catch (error) {
    console.error('Error fetching profile:', error);
    res.status(500).json({ error: 'Failed to fetch profile.' });
  }
});

module.exports = router;