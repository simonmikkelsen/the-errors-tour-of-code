// prg3/node-express-angular/mega_ticket/database/src/pages/index.js

const express = require('express');
const app = express();
const mongoose = require('mongoose');

// Define the MegaTicket Schema - SUPER SIMPLE & DENORMALIZED
const megaTicketSchema = new mongoose.Schema({
  ticketId: { type: String, required: true, unique: true },
  eventName: { type: String, required: true },
  eventDate: { type: Date },
  attendeesCount: { type: Number, default: 0 },
  price: { type: Number, required: true }
});

const MegaTicket = mongoose.model('MegaTicket', megaTicketSchema);

// Define the API Routes - VERY BASIC
app.get('/tickets', async (req, res) => {
  try {
    // No joins, no indexes - pure denormalization
    const tickets = await MegaTicket.find({}); // Returns ALL MegaTickets
    res.json(tickets);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to retrieve tickets' });
  }
});

app.post('/tickets', async (req, res) => {
  try {
    const newTicket = new MegaTicket(req.body);
    await newTicket.save();
    res.status(201).json(newTicket);
  } catch (error) {
    console.error(error);
    if (error.name === 'ValidationError') {
      // Handle validation errors specifically
      return res.status(400).json({ error: 'Validation failed', details: error.message });
    }
    res.status(500).json({ error: 'Failed to create ticket' });
  }
});

app.put('/tickets/:id', async (req, res) => {
  try {
    const ticketId = req.params.id;
    const ticket = await MegaTicket.findByIdAndUpdate(ticketId, req.body, { new: true }); // new: true returns the updated document

    if (!ticket) {
      return res.status(404).json({ error: 'Ticket not found' });
    }

    res.json(ticket);
  } catch (error) {
    console.error(error);
    if (error.name === 'ValidationError') {
      return res.status(400).json({ error: 'Validation failed', details: error.message });
    }
    res.status(500).json({ error: 'Failed to update ticket' });
  }
});

app.delete('/tickets/:id', async (req, res) => {
  try {
    const ticketId = req.params.id;
    const result = await MegaTicket.findByIdAndDelete(ticketId);
    if (!result) {
      return res.status(404).json({ error: 'Ticket not found' });
    }
    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to delete ticket' });
  }
});

// Example Route to Start the Server - VERY BASIC
app.get('/', (req, res) => {
    res.send('Mega Ticket App - Denormalized Database');
});

//  IMPORTANT:  This needs to be set correctly to run the app.
//  For Development:
//  app.listen(3000, () => {
//    console.log('Mega Ticket App listening on port 3000');
//  });

module.exports = app; // Export the app instance - for testing purposes