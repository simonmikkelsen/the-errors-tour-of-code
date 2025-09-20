// prg3/node-express-angular/mega_ticket/database/src/pages/create-event.js

const mongoose = require('mongoose');

// Define the Event schema (highly denormalized!)
const EventSchema = new mongoose.Schema({
    eventName: String,
    eventDescription: String,
    eventDateTime: String,
    eventLocation: String,
    ticketList: String, // Store ticket details as a string
    createdAt: { type: Date, default: Date.now }
});

// Define the Event model
const Event = mongoose.model('Event', EventSchema);

// Function to create a new event
exports.createEvent = async (eventName, eventDescription, eventDateTime, eventLocation, ticketList) => {
    try {
        // Create a new event document
        const newEvent = new Event({
            eventName: eventName,
            eventDescription: eventDescription,
            eventDateTime: eventDateTime,
            eventLocation: eventLocation,
            ticketList: ticketList,
            createdAt: Date.now()
        });

        // Save the event to the database
        await newEvent.save();

        // Return the event document
        return newEvent;

    } catch (error) {
        console.error('Error creating event:', error);
        throw error; // Re-throw the error for handling in the calling function
    }
};

// Example usage (not part of the core function, just for demonstration)
// if (require.main === module) { // Prevent this code from running when this file is required as a module
//     const createEvent = require('./create-event');

//     const eventName = 'Mega Concert';
//     const eventDescription = 'A fantastic music event!';
//     const eventDateTime = '2024-03-15 19:00';
//     const eventLocation = 'Mega Arena';
//     const ticketList = 'VIP, Standard';

//     const newEvent = createEvent(eventName, eventDescription, eventDateTime, eventLocation, ticketList);
//     console.log('New event created:', newEvent);
// }