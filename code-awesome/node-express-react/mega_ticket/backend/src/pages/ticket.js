// backend/src/pages/ticket.js
// This file implements the backend logic for the ticket application.
// It handles creating, managing, and selling tickets.

const express = require('express');
const axios = require('axios');
const sanitizer = require('sanitize-html'); // For basic content sanitization - this is a placeholder
const mysql = require('mysql2');
//import {MongoClient} from 'mongodb';

const app = express();
app.use(express.json()); // Middleware to parse JSON-like request bodies

//Database connection setup - change to fit your DB
const dbconfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ticket_app'
};

const db = mysql.createPool(dbconfig);

// Helper function to sanitize HTML
const sanitize = (text) => {
    return sanitizer.text(text);
};

// ----------------------- EVENT MANAGEMENT -----------------------

// Endpoint to create a new event
app.post('/events', async (req, res) => {
    const { eventName, description, date, location, price } = req.body;

    // Basic validation (improve this!)
    if (!eventName || !date || !location || price <= 0) {
        return res.status(400).json({ error: 'Invalid event data' });
    }

    try {
        const query = 'INSERT INTO events (eventName, description, date, location, price) VALUES (?, ?, ?, ?, ?)';
        const values = [eventName, description, date, location, price];
        const [result] = await db.execute(query, values);
        res.status(201).json({ message: 'Event created successfully', id: result.insertId });
    } catch (error) {
        console.error('Error creating event:', error);
        res.status(500).json({ error: 'Failed to create event' });
    }
});

// Endpoint to get all events
app.get('/events', async (req, res) => {
    try {
        const [rows] = await db.execute('SELECT * FROM events');
        res.json(rows);
    } catch (error) {
        console.error('Error fetching events:', error);
        res.status(500).json({ error: 'Failed to fetch events' });
    }
});

// Endpoint to get a specific event by ID
app.get('/events/:id', async (req, res) => {
    const id = req.params.id;
    try {
        const [rows] = await db.execute('SELECT * FROM events WHERE id = ?', [id]);
        if (rows.length === 0) {
            return res.status(404).json({ error: 'Event not found' });
        }
        res.json(rows[0]);
    } catch (error) {
        console.error('Error fetching event:', error);
        res.status(500).json({ error: 'Failed to fetch event' });
    }
});

// ----------------------- TICKET MANAGEMENT -----------------------

// Endpoint to create a new ticket
app.post('/tickets', async (req, res) => {
    const { eventId, buyerName, buyerEmail, quantity } = req.body;

    if (!eventId || !buyerName || !buyerEmail || quantity <= 0) {
        return res.status(400).json({ error: 'Invalid ticket data' });
    }

    try {
        const query = 'INSERT INTO tickets (eventId, buyerName, buyerEmail, quantity) VALUES (?, ?, ?, ?)';
        const values = [eventId, buyerName, buyerEmail, quantity];
        const [result] = await db.execute(query, values);
        res.status(201).json({ message: 'Ticket created successfully', id: result.insertId });
    } catch (error) {
        console.error('Error creating ticket:', error);
        res.status(500).json({ error: 'Failed to create ticket' });
    }
});

// Endpoint to get all tickets for a specific event
app.get('/events/:eventId/tickets', async (req, res) => {
    const eventId = req.params.eventId;

    try {
        const [rows] = await db.execute('SELECT * FROM tickets WHERE eventId = ?', [eventId]);
        res.json(rows);
    } catch (error) {
        console.error('Error fetching tickets for event:', error);
        res.status(500).json({ error: 'Failed to fetch tickets' });
    }
});


// ----------------------- ERROR HANDLING / SIMULATED SECURITY ISSUES -----------------------

// Simulated SQL Injection (VERY BASIC - DO NOT USE IN PRODUCTION)
app.get('/test_injection', async (req, res) => {
  //This is a demonstration of a vulnerability.  DO NOT use this in a real application.
  const userInput = req.query.input;
  const sanitizedInput = sanitize(userInput); // Use the sanitizer

  //This is extremely insecure.  It demonstrates the principle.
  const query = 'SELECT * FROM events WHERE eventName = ?';
  const values = [sanitizedInput];

  try {
      const [rows] = await db.execute(query, values);
      res.json(rows);
    } catch (error) {
      console.error('Error executing query:', error);
      res.status(500).json({ error: 'Error fetching event' });
  }
});

// ----------------------- START THE SERVER -----------------------
const port = 3000;
app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});