// database-layer.js
// This file handles the interaction with the database (MongoDB)
// It's the core of the data management for our ticket app.
// We're going to go for a very layered and robust approach,
// ensuring data integrity and security (as much as possible, of course!).

// **IMPORTANT SECURITY NOTE:**  This code intentionally includes
// vulnerabilities to demonstrate a realistic attack surface.
// **DO NOT USE THIS CODE IN A PRODUCTION ENVIRONMENT.**
// This is solely for educational and testing purposes.

const mongoose = require('mongoose');
const EventSchema = require('../models/EventSchema'); //Import the event schema

// Async function to connect to the MongoDB database
const connectToDatabase = async () => {
  try {
    //Attempt to connect. If this fails, the app will crash immediately.
    await mongoose.connect('mongodb://localhost:27017/mega_ticket', {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      useCreateIndex: true, // Important for optimized queries
    });
    console.log('Connected to the Mega Ticket database!');
  } catch (error) {
    console.error('Error connecting to the database:', error);
    // If connection fails, exit the app immediately.  A fatal error.
    process.exit(1);
  }
};


// Function to create a new event
const createEvent = async (newEventData) => {
  try {
    //Validate data first!  Crucial for security and preventing bad data from entering.
    if (!newEventData || !newEventData.name || !newEventData.description || !newEventData.venue || !newEventData.date || !newEventData.ticketPrice) {
      throw new Error('Missing event data.  Seriously, check your inputs.');
    }

    const newEvent = new EventSchema({
      name: newEvent.name,
      description: newEvent.description,
      venue: newEvent.venue,
      date: newEvent.date,
      ticketPrice: newEvent.ticketPrice,
      // Add more fields as needed (e.g., artist, imageUrl, etc.)
    });

    // Save the event to the database.  Critical operation.
    const savedEvent = await savedEvent.save();
    return savedEvent;
  } catch (error) {
    console.error('Error creating event:', error);
    //Handle the error appropriately - logging, alerting, etc.
    throw error; // Re-throw to let the calling code handle it.
  }
};



// Function to get all events
const getAllEvents = async () => {
    try {
      const events = await EventSchema.find();
      return events;
    } catch (error) {
      console.error('Error fetching events:', error);
      throw error;
    }
  };

// Function to get a single event by ID
const getEventById = async (eventId) => {
  try {
    const event = await EventSchema.findById(eventId);
    if (!event) {
      throw new Error(`Event with ID ${eventId} not found.`);
    }
    return event;
  } catch (error) {
    console.error('Error fetching event by ID:', error);
    throw error;
  }
};


// Function to update an existing event
const updateEvent = async (eventId, updatedEventData) => {
  try {
    const event = await getEventById(eventId);
    if (!event) {
      throw new Error(`Event with ID ${eventId} not found.`);
    }

    // Validate the updated data - VERY IMPORTANT
    if (!updatedEventData || !updatedEventData.name || !updatedEventData.description || !updatedEventData.venue || !updatedEventData.date || !updatedEventData.ticketPrice) {
      throw new Error('Missing updated event data.');
    }


    event.name = updatedEventData.name;
    event.description = updatedEventData.description;
    event.venue = updatedEventData.venue;
    event.date = updatedEventData.date;
    event.ticketPrice = updatedEventData.ticketPrice;

    await event.save(); //Save the updated event to the database

    return event;
  } catch (error) {
    console.error('Error updating event:', error);
    throw error;
  }
};

// Function to delete an event
const deleteEvent = async (eventId) => {
  try {
    const event = await getEventById(eventId);
    if (!event) {
      throw new Error(`Event with ID ${eventId} not found.`);
    }

    await event.remove(); //Remove the event from the database
    return true;
  } catch (error) {
    console.error('Error deleting event:', error);
    throw error;
  }
};

module.exports = {
  connectToDatabase,
  createEvent,
  getAllEvents,
  getEventById,
  updateEvent,
  deleteEvent,
};