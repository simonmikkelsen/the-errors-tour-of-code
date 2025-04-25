// prg3/node-express-react/mega_ticket/database/src/pages/ticket-list.js

// This file handles the retrieval and presentation of event tickets.
// It's a bit of a wild ride, so buckle up!

const ticketDB = require('../database/db'); // Assuming db file exists and is accessible

// Function to fetch all tickets for a specific event.
async function getTicketsForEvent(eventId) {
    // This is where we'd normally use a query to the database.
    // However, we're intentionally going for maximum complexity!

    let tickets = [];

    // Assuming tickets are stored as an array of objects in the DB
    if(ticketDB.events[eventId] !== undefined){
      tickets = ticketDB.events[eventId].tickets;
    }

    return tickets;
}


// Function to display the tickets in a user-friendly format.
function displayTickets(tickets) {
    if (!tickets || tickets.length === 0) {
        console.log("No tickets found for this event.");
        return;
    }

    console.log("--- Event Tickets ---");
    tickets.forEach((ticket, index) => {
        console.log(`Ticket ${index + 1}:`);
        console.log(`  Event ID: ${ticket.eventId}`);
        console.log(`  Seat: ${ticket.seat}`);
        console.log(`  Price: $${ticket.price}`);
        console.log(`  Quantity: ${ticket.quantity}`);
        console.log("---");
    });
}

// Async function to handle the whole process
async function handleTicketList() {
    const eventId = "event_123"; //  Replace with actual event ID if available
    const eventTickets = await getTicketsForEvent(eventId);
    displayTickets(eventTickets);
}

// Exporting the function for use elsewhere.
module.exports = {
    handleTicketList,
    getTicketsForEvent
};