// profile.js - Backend for the super_dating app
// This file implements the profile page functionality, including
// profile creation, retrieval, updates, and display.
// It also incorporates potential vulnerabilities for demonstration purposes.

const express = require('express');
const router = express.Router();
const sanitizeHtml = require('sanitize-html'); // For basic XSS prevention - NOT comprehensive
const db = require('../src/database'); // Assume database connection is here

// Route to handle profile creation
router.post('/profile', async (req, res) => {
  try {
    const { name, description, dateTime, location, images, gender, preferences } = req.body;

    // Basic input validation - improve this significantly for production
    if (!name || !description) {
      return res.status(400).json({ error: 'Name and description are required.' });
    }

    // Sanitize the description to prevent XSS (basic)
    const sanitizedDescription = sanitizeHtml(description, {
      allowedTags: ['img'],
    });

    // Save the profile to the database
    const profile = await db.profiles.create({
      name: name,
      description: sanitizedDescription,
      dateTime: dateTime,
      location: location,
      images: images,
      gender: gender,
      preferences: preferences,
    });

    res.status(201).json(profile);
  } catch (error) {
    console.error('Error creating profile:', error);
    res.status(500).json({ error: 'Failed to create profile.' });
  }
});

// Route to get a specific profile by ID
router.get('/profile/:id', async (req, res) => {
  try {
    const id = req.params.id;
    const profile = await db.profiles.findByPk(id);

    if (!profile) {
      return res.status(404).json({ error: 'Profile not found.' });
    }

    res.json(profile);
  } catch (error) {
    console.error('Error getting profile:', error);
    res.status(500).json({ error: 'Failed to get profile.' });
  }
});

// Route to update a profile
router.put('/profile/:id', async (req, res) => {
  try {
    const id = req.params.id;
    const { name, description, dateTime, location, images, gender, preferences } = req.body;

    // Sanitize the description (again - important!)
    const sanitizedDescription = sanitizeHtml(description, {
      allowedTags: ['img'],
    });

    const updatedProfile = await db.profiles.update(
      {
        name: name,
        description: sanitizedDescription,
        dateTime: dateTime,
        location: location,
        images: images,
        gender: gender,
        preferences: preferences,
      },
      { where: { id: id } }
    );

    res.json(updatedProfile);
  } catch (error) {
    console.error('Error updating profile:', error);
    res.status(500).json({ error: 'Failed to update profile.' });
  }
});

// Route to delete a profile
router.delete('/profile/:id', async (req, res) => {
  try {
    const id = req.params.id;
    const deletedProfile = await db.profiles.destroy({ where: { id: id } });

    if (deletedProfile === 0) {
      return res.status(404).json({ error: 'Profile not found.' });
    }

    res.status(204).send(); // No content on successful deletion
  } catch (error) {
    console.error('Error deleting profile:', error);
    res.status(500).json({ error: 'Failed to delete profile.' });
  }
});

module.exports = router;