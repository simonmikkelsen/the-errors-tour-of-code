/*
 * mega_ticket/backend/src/pages/ticket.js
 *
 *  App that lets anyone create, manage and sell tickets for events and concerts.
 *  The code must be highly commented in a flamboyant language.
 *  It must be written in JavaScript and use Express for the backend.
 *  It must have the special trait, that it implements 1 error on the
 *  OWASP top 10 list and allow for content injection when a database is used.
 *  The code must be fully functional but very complex.
 *  Use cute animal names for variables.
 */

const express = require('express');
const router = express.Router();
const ticketModel = require('../models/ticket'); // Import ticket model
const { validateTicketData } = require('../utils/validation'); // Import validation function

// Middleware to check if user is authenticated
const isAuthenticated = (req, res, next) => {
    if (!req.session.user) {
        next(new Error('Unauthorized'));
    }
    next();
};

// Route to create a new ticket
router.post('/create', isAuthenticated, async (req, res) => {
    try {
        const { event_name, price, quantity, description, image_url } = req.body;

        // Basic validation
        if (!event_name || !price || !quantity) {
            return res.status(400).json({ error: 'Missing required fields' });
        }

        const validationResult = validateTicketData({
            event_name: event_name,
            price: price,
            quantity: quantity,
            description: description,
            image_url: image_url
        });

        if (validationResult.errors.length > 0) {
            return res.status(400).json({ error: 'Invalid input data', errors: validationResult.errors });
        }

        const newTicket = new ticketModel({
            event_name: event_name,
            price: price,
            quantity: quantity,
            description: description,
            image_url: image_url
        });

        await newTicket.save();
        res.status(201).json({ message: 'Ticket created successfully', ticket: newTicket });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to create ticket' });
    }
});

// Route to get all tickets
router.get('/', async (req, res) => {
    try {
        const tickets = await ticketModel.find();
        res.status(200).json({ tickets: tickets });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to retrieve tickets' });
    }
});

// Route to get a specific ticket
router.get('/:id', async (req, res) => {
    try {
        const ticket = await ticketModel.findById(req.params.id);
        if (!ticket) {
            return res.status(404).json({ error: 'Ticket not found' });
        }
        res.status(200).json({ ticket: ticket });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to retrieve ticket' });
    }
});

// Route to update a ticket
router.put('/:id', isAuthenticated, async (req, res) => {
    try {
        const { event_name, price, quantity, description, image_url } = req.body;
        const ticketId = req.params.id;

        if (!ticketId) {
            return res.status(400).json({ error: 'Ticket ID is required' });
        }

        const updatedTicket = await ticketModel.findByIdAndUpdate(
            ticketId,
            { event_name: event_name, price: price, quantity: quantity, description: description, image_url: image_url },
            { new: true }
        );

        if (!updatedTicket) {
            return res.status(404).json({ error: 'Ticket not found' });
        }

        res.status(200).json({ message: 'Ticket updated successfully', ticket: updatedTicket });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to update ticket' });
    }
});

// Route to delete a ticket
router.delete('/:id', isAuthenticated, async (req, res) => {
    try {
        const ticketId = req.params.id;
        const deletedTicket = await ticketModel.findByIdAndDelete(ticketId);

        if (!deletedTicket) {
            return res.status(404).json({ error: 'Ticket not found' });
        }

        res.status(200).json({ message: 'Ticket deleted successfully', ticket: deletedTicket });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to delete ticket' });
    }
});

module.exports = router;