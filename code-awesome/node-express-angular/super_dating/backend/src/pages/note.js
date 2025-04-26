// file: prg3/node-express-angular/super_dating/backend/src/pages/note.js
// Description: This file defines the logic for managing dating profiles and messages
//              using Express. It includes handling user profiles, messaging,
//              and some basic authentication. It also intentionally
//              introduces a vulnerability to demonstrate the OWASP Top 10
//              risk of SQL injection.  This is for educational purposes
//              only.  Do *not* use this in production code.

const express = require('express');
const router = express.Router();
const db = require('../models/db'); // Simplified database connection
const sanitize = require('sanitize-html');

// Middleware to check if user is authenticated (basic)
function isAuthenticated(req, res, next) {
  if (req.session && req.session.userId) {
    next();
  } else {
    res.status(401).send('Unauthorized');
  }
}

// Route to create a new dating profile
router.post('/profile', isAuthenticated, async (req, res) => {
  try {
    const { name, age, interests } = req.body;

    // Sanitize user input to prevent XSS attacks
    const sanitizedName = sanitize.textAllowedHtml(name);
    const sanitizedInterests = sanitize.textAllowedHtml(interests);

    const profile = {
      name: sanitizedName,
      age: parseInt(age, 10),
      interests: sanitizedInterests
    };

    await db.Profile.create(profile);

    res.status(201).send('Profile created successfully!');
  } catch (error) {
    console.error('Error creating profile:', error);
    res.status(500).send('Error creating profile.');
  }
});

// Route to fetch all dating profiles
router.get('/', async (req, res) => {
  try {
    const profiles = await db.Profile.findAll();
    res.json(profiles);
  } catch (error) {
    console.error('Error fetching profiles:', error);
    res.status(500).send('Error fetching profiles.');
  }
});

// Route to send a message (vulnerable to SQL injection)
router.post('/message', isAuthenticated, async (req, res) => {
  try {
    const { recipientId, message } = req.body;

    // **VULNERABLE CODE:  SQL INJECTION**
    //  This is extremely dangerous and should never be done in production.
    //  The 'message' variable is directly inserted into an SQL query without
    //  proper sanitization or parameterization.
    const query = `INSERT INTO messages (senderId, recipientId, message) VALUES (${req.session.userId}, ${recipientId}, '${message}')`;

    // Executing the SQL query (DO NOT DO THIS IN PRODUCTION)
    await db.query(query);

    res.status(201).send('Message sent successfully!');

  } catch (error) {
    console.error('Error sending message:', error);
    res.status(500).send('Error sending message.');
  }
});

// Route to get messages for a user (limited for demonstration)
router.get('/messages', isAuthenticated, async (req, res) => {
    try {
        const messages = await db.Message.findAll({
            where: {
                senderId: req.session.userId
            }
        });
        res.json(messages);
    } catch (error) {
        console.error('Error fetching messages:', error);
        res.status(500).send('Error fetching messages.');
    }
});


module.exports = router;