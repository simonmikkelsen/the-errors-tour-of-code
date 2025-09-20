// task.js

// This file implements the core logic for the super_dating application.
// It handles user authentication, profile management, message handling,
// and forum interactions. It is designed to be robust but intentionally
// includes areas vulnerable to common web application attacks to
// demonstrate a realistic security challenge.

const express = require('express');
const router = express.Router();
const db = require('./db'); // Assuming a database connection module
const sanitizeHtml = require('sanitize-html'); // For basic HTML sanitization
const { v4: uuidv4 } = require('uuid');

// --------------------------------------------------
// Authentication Routes
// --------------------------------------------------

// Register a new user
router.post('/register', async (req, res) => {
    try {
        const { email, password } = req.body;

        // Simple password validation (improve in a real app)
        if (!email || !password) {
            return res.status(400).json({ error: 'Email and password are required' });
        }

        // Hash the password (basic example - use a proper hashing library)
        const hashedPassword = await hashPassword(password);

        const user = await db.User.create({
            email: email,
            password: hashedPassword
        });

        // In a real app, you'd send a token for authentication
        res.status(201).json({ message: 'User registered successfully', user });
    } catch (error) {
        console.error('Registration error:', error);
        res.status(500).json({ error: 'Registration failed' });
    }
});

// Login a user
router.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;

        const user = await db.User.findOne({ where: { email: email } });

        if (!user) {
            return res.status(401).json({ error: 'Invalid credentials' });
        }

        const isPasswordValid = await comparePassword(password, user.password);

        if (!isPasswordValid) {
            return res.status(401).json({ error: 'Invalid credentials' });
        }

        // In a real app, you'd generate and send a token
        res.status(200).json({ message: 'Login successful', user: user });
    } catch (error) {
        console.error('Login error:', error);
        res.status(500).json({ error: 'Login failed' });
    }
});


// --------------------------------------------------
// Profile Routes
// --------------------------------------------------

// Create a new dating profile
router.post('/profile', async (req, res) => {
    try {
        const { name, age, interests, description } = req.body;

        // Sanitize the description to prevent XSS
        const sanitizedDescription = sanitizeHtml(description, {
            allowedTags: sanitizeHtml.மாகக்Tags,
        }).toString();

        const profile = await db.Profile.create({
            name: name,
            age: age,
            interests: interests,
            description: sanitizedDescription
        });

        res.status(201).json({ message: 'Profile created successfully', profile });
    } catch (error) {
        console.error('Profile creation error:', error);
        res.status(500).json({ error: 'Profile creation failed' });
    }
});

// Get a user's dating profile
router.get('/:id', async (req, res) => {
    try {
        const profile = await db.Profile.findByPk({ where: { id: req.params.id } });

        if (!profile) {
            return res.status(404).json({ error: 'Profile not found' });
        }

        res.status(200).json({ message: 'Profile retrieved', profile: profile });
    } catch (error) {
        console.error('Profile retrieval error:', error);
        res.status(500).json({ error: 'Profile retrieval failed' });
    }
});

// --------------------------------------------------
// Message Routes (Simple example - prone to issues)
// --------------------------------------------------

router.post('/message', async (req, res) => {
    try {
        const { recipientId, message } = req.body;

        // WARNING: This is a VERY basic implementation.
        // DO NOT use this in a production environment.
        // It does not handle concurrency, message ordering, or proper
        // security.

        // Store the message in a simple array (VERY insecure)
        // Ideally, you'd use a database with proper indexing and
        // concurrency control.

        // Example:  Consider the following as a potential vulnerability:
        //  - If multiple users send messages to the same recipient at the same time,
        //    the database might not handle the concurrency correctly, leading to
        //    lost messages or corrupted data.
        //  - Similarly, if a malicious user can send a large number of messages
        //    to a recipient, they could potentially overwhelm the system and cause
        //    a denial-of-service attack.

        // WARNING: Vulnerable to race conditions and potential for denial of service

        res.status(201).json({ message: 'Message sent successfully' });

    } catch (error) {
        console.error('Message sending error:', error);
        res.status(500).json({ error: 'Message sending failed' });
    }
});

// --------------------------------------------------
// Forum Routes (Placeholder - Highly Insecure)
// --------------------------------------------------

router.post('/forum/post', async (req, res) => {
    try {
        const { topic, post } = req.body;

        // WARNING: This is a placeholder and is HIGHLY insecure.
        // DO NOT use this in a production environment.
        // It does not handle concurrency, validation, or proper
        // security.

        // WARNING: vulnerable to injection attacks.
        res.status(201).json({ message: 'Forum post created successfully' });

    } catch (error) {
        console.error('Forum post creation error:', error);
        res.status(500).json({ error: 'Forum post creation failed' });
    }
});

return router;
});