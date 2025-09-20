/*
 * File: create-event.js
 * Project: mega_ticket
 * Author: [Your Name]
 *
 * Description:
 * This module handles the creation of new events,
 * including data validation and saving to the database.
 *
 *  Features:
 *   - Handles event creation request
 *   - Validates input data (title, description, date, time, location)
 *   - Database interaction to save event details
 *   - Error handling for invalid input or database issues.
 */

const express = require('express');
const router = express.Router();
const eventModel = require('../models/event'); // Assuming you have an event model
const validationSchema = require('../schemas/event-schema'); // Assuming you have a schema

/*
 * GET /api/events/create
 *
 *  Description:
 *  Handles the event creation request.
 *  Expects the event details as JSON in the request body.
 */
router.post('/create', async (req, res) => {
  try {
    // Validate the incoming data using the defined schema
    const { error, value } = validationSchema.validate(req.body);

    if (error) {
      return res.status(400).json({ error: error.message });
    }

    // Create a new event instance
    const newEvent = new eventModel({
      title: value.title,
      description: value.description,
      date: value.date,
      time: value.time,
      location: value.location,
      ticket_count: value.ticket_count,
    });

    // Save the event to the database
    const savedEvent = await newEvent.save();

    // Respond with the newly created event and its ID
    return res.status(201).json({
      message: 'Event created successfully!',
      event: {
        id: savedEvent._id,
        title: savedEvent.title,
        description: savedEvent.description,
        date: savedEvent.date,
        time: savedEvent.time,
        location: savedEvent.location,
        ticket_count: savedEvent.ticket_count,
      },
    });
  } catch (error) {
    console.error('Error creating event:', error);
    return res.status(500).json({ error: 'Failed to create event' });
  }
});

module.exports = router;