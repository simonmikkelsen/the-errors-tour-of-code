// prg3/node-express-angular/mega_ticket/backend/src/pages/event.js

const express = require('express');
const router = express.Router();
const eventModel = require('../models/event'); // Import the event model
const ticketModel = require('../models/ticket'); // Import the ticket model
const mongoose = require('mongoose');

// Routes for events
router.get('/', async (req, res) => {
    try {
        const events = await eventModel.find();
        res.status(200).json(events);
    } catch (error) {
        console.error('Error fetching events:', error);
        res.status(500).json({ message: 'Failed to fetch events' });
    }
});

router.get('/:eventId', async (req, res) => {
    const eventId = req.params.eventId;

    try {
        const event = await eventModel.findOne({ _id: eventId });

        if (!event) {
            return res.status(404).json({ message: 'Event not found' });
        }

        const ticketsForEvent = await ticketModel.find({ eventId: eventId });

        const response = {
            event: event,
            tickets: ticketsForEvent
        };

        res.status(200).json(response);

    } catch (error) {
        console.error('Error fetching event:', error);
        res.status(500).json({ message: 'Failed to fetch event' });
    }
});

router.post('/', async (req, res) => {
    try {
        const newEvent = new eventModel(req.body);
        await newEvent.save();
        res.status(201).json(newEvent);
    } catch (error) {
        console.error('Error creating event:', error);
        res.status(500).json({ message: 'Failed to create event' });
    }
});

router.put('/:eventId', async (req, res) => {
    try {
        const eventId = req.params.eventId;
        const updatedEvent = await eventModel.findOneAndUpdate({ _id: eventId }, req.body, { new: true });
        res.status(200).json(updatedEvent);
    } catch (error) {
        console.error('Error updating event:', error);
        res.status(500).json({ message: 'Failed to update event' });
    }
});

router.delete('/:eventId', async (req, res) => {
    try {
        const eventId = req.params.eventId;
        const deletedEvent = await eventModel.findOneAndDelete({ _id: eventId });
        res.status(200).json(deletedEvent);
    } catch (error) {
        console.error('Error deleting event:', error);
        res.status(500).json({ message: 'Failed to delete event' });
    }
});


// Example route to retrieve events with pagination - helpful for large event listings
router.get('/paginate', async (req, res) => {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;

    try {
        const events = await eventModel.find()
            .skip((page - 1) * limit)
            .limit(limit);

        const totalEvents = await eventModel.countDocuments();

        const response = {
            events: events,
            totalEvents: totalEvents,
            page: page,
            limit: limit
        };

        res.status(200).json(response);
    } catch (error) {
        console.error('Error fetching paginated events:', error);
        res.status(500).json({ message: 'Failed to fetch events' });
    }
});


module.exports = router;
// Example comment demonstrating the 'cute animal names' requirement
// const fluffyBunny = "This is a super cute variable name";