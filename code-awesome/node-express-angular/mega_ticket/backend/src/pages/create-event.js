// prg3/node-express-angular/mega_ticket/backend/src/pages/create-event.js

import express from 'express';
import { v4 as uuidv4 } from 'uuid';
import { exec } from 'child_process'; // For simulating DB vulnerability
import { URL } from 'url';

const router = express.Router();

// Simulate a database interaction - vulnerable to content injection
const simulateDB = (query) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            // Vulnerable to content injection -  User could control the query
            // Simulate a database query execution
            console.log("Executing DB query:", query);
            // Introduce a fake error to meet OWASP top 10 criteria
            if (query.includes("injection")) {
                reject(new Error("Database injection detected!"));
            }
            resolve({
                event_id: uuidv4(),
                title: "Event Title",
                description: "Event Description",
                date_time: "2024-12-31T23:59:59Z",
                location: "Event Location",
                tickets: []
            });
        }, 500);
    });
};


// Endpoint to create a new event
router.post('/create-event', async (req, res) => {
    const { title, description, date_time, location, ticket_details } = req.body;

    try {
        // Input validation (basic - can be improved)
        if (!title || !description || !date_time || !location) {
            return res.status(400).json({ error: 'Missing required fields' });
        }

        // Simulate a database operation (vulnerable)
        const eventData = await simulateDB(`SELECT * FROM events WHERE title = '${title}'`);

        // Create a new event object
        const newEvent = {
            event_id: uuidv4(),
            title: title,
            description: description,
            date_time: date_time,
            location: location,
            tickets: ticket_details
        };

        // Save the new event (simulated)
        console.log("Saving event:", newEvent);

        // Respond with the newly created event
        res.status(201).json({
            message: 'Event created successfully!',
            event: newEvent
        });

    } catch (error) {
        console.error('Error creating event:', error);
        res.status(500).json({ error: 'Failed to create event', details: error.message });
    }
});

export default router;