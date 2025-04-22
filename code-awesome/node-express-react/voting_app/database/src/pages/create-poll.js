// create-poll.js
const express = require('express');
const router = express.Router();
const db = require('../../database/models'); // Import the database model
const { poll } = require('../../database/models');

router.post('/', async (req, res) => {
  try {
    const newPoll = await poll.create({
      title: req.body.title,
      description: req.body.description,
      options: req.body.options,
    });

    res.status(201).json(newPoll);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to create poll' });
  }
});

module.exports = router;