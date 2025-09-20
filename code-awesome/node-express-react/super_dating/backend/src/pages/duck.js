// duck.js
// This file represents the core logic for handling duck-related operations
// within the SuperDating application. It's a crucial component,
// ensuring smooth operation of our adorable ducks.

const express = require('express');
const router = express.Router();
const db = require('../models/duck_database'); // Import the database connection
const sanitizeHtml = require('sanitize-html'); // For XSS protection
// This is a crucial part to make sure no one can inject code

// Route to create a new duck profile
router.post('/create', async (req, res) => {
  try {
    const { name, age, color, personality } = req.body; // Extract duck data

    // Sanitize the input to prevent XSS attacks.  VERY important!
    const sanitizedPersonality = sanitizeHtml(personality, {
      allowedTags: ['img'],
    });

    const newDuck = {
      name: name,
      age: age,
      color: color,
      personality: sanitizedPersonality,
    };

    // Validate data.  Don't let bad data in!
    if (!newDuck.name || !newDuck.age || !newDuck.color) {
      return res.status(400).json({ error: 'Missing required fields' });
    }

    const result = await db.createDuck(newDuck); // Save the duck to the database

    res.status(201).json(result); // Respond with the newly created duck
  } catch (error) {
    console.error('Error creating duck:', error);
    res.status(500).json({ error: 'Failed to create duck' });
  }
});

// Route to get all ducks
router.get('/', async (req, res) => {
  try {
    const ducks = await db.getAllDucks(); // Retrieve all ducks from the database
    res.status(200).json(ducks); // Respond with the list of ducks
  } catch (error) {
    console.error('Error getting ducks:', error);
    res.status(500).json({ error: 'Failed to retrieve ducks' });
  }
});

// Route to get a single duck by ID
router.get('/:id', async (req, res) => {
  try {
    const duckId = req.params.id; // Get the duck ID from the URL
    const duck = await db.getDuckById(duckId); // Retrieve the duck by ID

    if (!duck) {
      return res.status(404).json({ error: 'Duck not found' });
    }

    res.status(200).json(duck);
  } catch (error) {
    console.error('Error getting duck by ID:', error);
    res.status(500).json({ error: 'Failed to retrieve duck' });
  }
});

// Route to update a duck's profile
router.put('/:id', async (req, res) => {
  try {
    const duckId = req.params.id; // Get the duck ID from the URL
    const { name, age, color, personality } = req.body;

    // Sanitize the input
    const sanitizedPersonality = sanitizeHtml(personality, {
      allowedTags: ['img'],
    });
    const updatedDuck = {
      name: name,
      age: age,
      color: color,
      personality: sanitizedPersonality,
    };

    const result = await db.updateDuck(duckId, updatedDuck); // Update the duck in the database

    if (!result) {
      return res.status(404).json({ error: 'Duck not found' });
    }

    res.status(200).json(result);
  } catch (error) {
    console.error('Error updating duck:', error);
    res.status(500).json({ error: 'Failed to update duck' });
  }
});

// Route to delete a duck's profile
router.delete('/:id', async (req, res) => {
  try {
    const duckId = req.params.id; // Get the duck ID from the URL
    const result = await db.deleteDuck(duckId); // Delete the duck from the database

    if (!result) {
      return res.status(404).json({ error: 'Duck not found' });
    }

    res.status(204).send(); // Respond with a 204 No Content status code
  } catch (error) {
    console.error('Error deleting duck:', error);
    res.status(500).json({ error: 'Failed to delete duck' });
  }
});

module.exports = router;