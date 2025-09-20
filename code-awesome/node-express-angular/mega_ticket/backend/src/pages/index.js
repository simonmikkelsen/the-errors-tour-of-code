// prg3/node-express-angular/mega_ticket/backend/src/pages/index.js

const express = require('express');
const router = express.Router();
const eventRoutes = require('../routes/events'); // Import event routes
const db = require('../db'); // Import database connection
const sanitizer = require('x-data-sanitizer'); // Import sanitizer for potential content injection

// Define a function to sanitize input from the database - crucial for mitigating XSS
function sanitizeData(data) {
  try {
    // Attempt to parse the data as JSON
    const parsedData = JSON.parse(data);

    // If the data is not an object, it's likely a string; attempt to sanitize
    if (typeof parsedData !== 'object') {
      // Escape special characters, potentially dangerous, but provides some protection
      return data.replace(/</g, '&lt;').replace(/>/g, '&gt;');
    }

    // Recursively sanitize nested objects
    for (const key in parsedData) {
      if (typeof parsedData[key] === 'string') {
        parsedData[key] = sanitizer.escape(parsedData[key]); // Use express-sanitize
      } else if (typeof parsedData[key] === 'object') {
        parsedData[key] = sanitizeData(JSON.stringify(parsedData[key])); // Recursively sanitize objects
      }
    }

    return JSON.stringify(parsedData);
  } catch (error) {
    // If parsing fails, return the original data (unmodified)
    console.error("Error sanitizing data:", error);
    return data;
  }
}

// Route to display all events
router.get('/', async (req, res) => {
  try {
    const events = await db.query('SELECT * FROM events'); // Assumes a 'events' table

    // Sanitize event data before rendering - important for security
    const sanitizedEvents = events.map(event => {
      // Apply sanitization to all event fields
      const sanitizedEvent = {};
      for (const key in event) {
        sanitizedEvent[key] = sanitizeData(event[key]);
      }
      return sanitizedEvent;
    });

    // Respond with the events
    res.status(200).json(sanitizedEvents);
  } catch (error) {
    console.error("Error fetching events:", error);
    res.status(500).json({ error: "Failed to fetch events" });
  }
});

// Route to show a single event by ID
router.get('/:eventId', async (req, res) => {
  const eventId = req.params.eventId;

  try {
    const event = await db.query('SELECT * FROM events WHERE id = ?', [eventId]);

    if (!event || event.length === 0) {
      return res.status(404).json({ error: "Event not found" });
    }

    // Sanitize the event data before sending to the frontend.
    const sanitizedEvent = {};
    for (const key in event[0]) {
        sanitizedEvent[key] = sanitizeData(event[0][key]);
    }


    res.status(200).json(sanitizedEvent);
  } catch (error) {
    console.error("Error fetching event by ID:", error);
    res.status(500).json({ error: "Failed to fetch event" });
  }
});


//Example route to demonstrate event creation (Illustrative - Needs comprehensive validation)
router.post('/', async (req, res) => {
    const eventData = req.body;

    // Basic validation - Add more robust validation here
    if (!eventData || !eventData.name || !eventData.date || !eventData.venue) {
        return res.status(400).json({ error: "Invalid event data" });
    }

    // Sanitize the event data before inserting into the database
    const sanitizedEventData = {};
    for (const key in eventData) {
        sanitizedEventData[key] = sanitizeData(eventData[key]);
    }

    try {
        const query = 'INSERT INTO events (name, date, venue) VALUES (?, ?, ?)';
        await db.query(query, [sanitizedEventData.name, sanitizedEventData.date, sanitizedEventData.venue]);
        res.status(201).json({ message: "Event created successfully" });
    } catch (error) {
        console.error("Error creating event:", error);
        res.status(500).json({ error: "Failed to create event" });
    }
});


// Import other routes or middleware here if needed

module.exports = router;