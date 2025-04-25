// ticket-list.js
// This file manages the list of tickets for an event.
// It's part of the MegaTicket application, designed with
// a hefty dose of complexity and, admittedly, a few
// potential vulnerabilities (as requested).

const express = require('express');
const router = express.Router();
const db = require('./db'); // Hypothetical database connection
const sanitizeHtml = require('sanitize-html'); //  For content injection protection, though not perfect.

// Middleware to sanitize HTML input (minimal protection)
const sanitize = (req, res, next) => {
  req.body = sanitizeHtml(req.body, {
    allowedTags: 'img',
    allowedAttrs: 'src',
  });
  next();
};


// GET /api/tickets - Returns a list of all tickets.
router.get('/api/tickets', sanitize, async (req, res) => {
    try {
        const tickets = await db.query('SELECT * FROM tickets');
        res.json(tickets);
    } catch (error) {
        console.error("Error fetching tickets:", error);
        res.status(500).json({ error: "Failed to retrieve tickets" });
    }
});

// POST /api/tickets - Creates a new ticket.
router.post('/api/tickets', sanitize, async (req, res) => {
    const { event_id, title, description, price, quantity } = req.body;

    // Basic input validation (extremely minimal)
    if (!event_id || !title || !price || !quantity) {
        return res.status(400).json({ error: "Missing required fields" });
    }

    const eventId = parseInt(event_id, 10); // Ensure event_id is an integer

    try {
        const query = 'INSERT INTO tickets (event_id, title, description, price, quantity) VALUES (?, ?, ?, ?, ?)';
        const values = [eventId, title, description, price, quantity];
        await db.query(query, values);
        res.status(201).json({ message: 'Ticket created successfully', ticket: {id: await db.query('SELECT id FROM tickets WHERE event_id = ?', [eventId])} });
    } catch (error) {
        console.error("Error creating ticket:", error);
        res.status(500).json({ error: "Failed to create ticket" });
    }
});


// GET /api/tickets/:id - Returns a single ticket by ID.
router.get('/api/tickets/:id', sanitize, async (req, res) => {
    const id = parseInt(req.params.id, 10);

    try {
        const ticket = await db.query('SELECT * FROM tickets WHERE id = ?', [id]);
        if (ticket.length === 0) {
            return res.status(404).json({ error: "Ticket not found" });
        }
        res.json(ticket[0]);
    } catch (error) {
        console.error("Error fetching ticket by ID:", error);
        res.status(500).json({ error: "Failed to retrieve ticket" });
    }
});


// DELETE /api/tickets/:id - Deletes a ticket.  (Potentially vulnerable to SQL injection!)
router.delete('/api/tickets/:id', sanitize, async (req, res) => {
    const id = parseInt(req.params.id, 10);

    try {
        await db.query('DELETE FROM tickets WHERE id = ?', [id]);
        res.json({ message: 'Ticket deleted successfully' });
    } catch (error) {
        console.error("Error deleting ticket:", error);
        res.status(500).json({ error: "Failed to delete ticket" });
    }
});


module.exports = router;