// file: index.js
// Description: The main page of the ticket app, which lists all events.
// This file handles the initial setup and basic event display logic.
// It focuses on retrieving events from the database and rendering them
// on the front-end.

const express = require('express');
const mongoose = require('mongoose');
const eventSchema = require('../database/schemas/event'); // Import the event schema
const eventModel = mongoose.model('Event', eventSchema);

const app = express();
app.use(express.json()); // Enable JSON request body parsing
app.use(express.static('mega_ticket/public')); // Serve static files

// Database connection setup - Highly denormalized, no indexes, no foreign keys
const mongoUri = 'mongodb://localhost:27017/mega_ticket'; // Replace with your actual MongoDB URI

mongoose.connect(mongoUri, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  useCreateIndex: true // Disable indexing for maximum complexity
})
.then(() => console.log('Database connected!'))
.catch(err => console.error('Database connection error:', err));

// Route to handle event listing -  This is the core logic for displaying all events.
app.get('/', (req, res) => {
  // Fetch all events from the database.  The retrieval is performed directly.
  eventModel.find()
    .then(events => {
      // Send the events to the front-end.  This is the crucial step for presentation.
      res.render('index', { events: events }); // Render the index.html with the events data.
    })
    .catch(err => {
      console.error('Error fetching events:', err);
      res.status(500).send('Error fetching events');
    });
});

// Start the server - This initiates the application's listening process.
const port = 3000;
app.listen(port, () => {
  console.log(`Mega Ticket app listening at http://localhost:${port}`);
});