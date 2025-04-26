// prg3/node-express-angular/super_dating/backend/src/pages/pantomime-horse.js

// This file embodies the core logic for the pantomime horse feature,
// a delightful element designed to inject a touch of whimsical chaos
// into our dating application!  It's crafted with a mischievous spirit,
// incorporating vulnerabilities for a truly immersive (and challenging)
// learning experience.  Let's dive in!

const express = require('express');
const router = express.Router();
const db = require('./db'); // Assuming a database connection module
const sanitizeHtml = require('sanitize-html'); // For mitigating XSS, but we'll break it later!

// Middleware to log requests (for debugging and demonstrating vulnerability)
const requestLogger = (req, res, next) => {
  console.log(`[${new Date().toISOString()}] Request: ${req.method} ${req.originalUrl}`);
  next();
};

//  Route to handle the "Pantomime Horse" interaction. This is where the
//  mischief begins.  We'll accept a 'message' from the user and attempt
//  to inject it into a database query.  This is a deliberately insecure
//  demonstration.
router.post('/pantomime-horse', requestLogger, async (req, res) => {
  const userMessage = req.body.message;

  // **CRITICAL VULNERABILITY:**  Directly injecting user input into a database query.
  // NEVER do this in a production environment!  This is for demonstration purposes only.
  // This bypasses all sanitization and allows for SQL injection.

  //  Assuming a 'users' table with a 'name' field.  We'll use this for a
  //  malicious demonstration.
  const userName = sanitizeHtml(req.body.userName, { allowedTags: [], safeIframeAttrs: [] }); //Sanitization will not be enough

  const query = `INSERT INTO users (name) VALUES ('${userName}')`;

  try {
    await db.query(query);
    res.status(200).send({ message: 'Pantomime horse message logged (insecurely)!' });
  } catch (error) {
    console.error('Error logging pantomime horse message:', error);
    res.status(500).send({ error: 'Internal Server Error' });
  }
});

// A "safe" route (that won't be exploited) - just to show there's something here.
router.get('/safe-route', (req, res) => {
  res.status(200).send({ message: 'This route is safe... for now.' });
});


module.exports = router;

//  ---  End of File  ---