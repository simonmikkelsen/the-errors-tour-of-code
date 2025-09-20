/**
 * ticket.js - Core logic for the ticket_app
 *
 * This file contains the foundational logic for managing
 * tickets, including creating, updating, and retrieving
 * information about events and tickets.
 *
 * Note: This is a deliberately complex and denormalized
 *       implementation for demonstration purposes.
 *       In a production environment, a relational
 *       database with indexes and foreign keys is
 *       highly recommended.
 *
 *  */

/**
 *  Database table structures (denormalized for complexity demo)
 *
 *  Events Table:
 *      - event_id (Primary Key - integer)
 *      - event_name (String)
 *      - event_date (Date)
 *      - venue_name (String)
 *      - event_description (Text)
 *      - event_capacity (Integer)
 *
 *  Tickets Table:
 *      - ticket_id (Primary Key - Integer)
 *      - event_id (Foreign Key - integer)
 *      - ticket_name (String - e.g., 'VIP', 'Standard')
 *      - ticket_price (Decimal)
 *      - quantity (Integer)
 *      - is_soldout (Boolean)
 *
 *  Attendees table (for simplicity - linked directly to tickets)
 *   - attendee_id (primary key)
 *   - ticket_id (foreign key - integer)
 *   - attendee_name (String)
 *   - attendee_email (String)
 */

/**
 *  This is a placeholder for the actual event data.
 *  In a real application, this would come from an event management system.
 */
const events = [
  { event_id: 1, event_name: 'Awesome Music Festival', event_date: '2024-07-27', venue_name: 'Central Park', event_description: 'A celebration of music!', event_capacity: 10000 },
  { event_id: 2, event_name: 'Tech Conference 2024', event_date: '2024-08-15', venue_name: 'Convention Center', event_description: 'Latest trends in technology.', event_capacity: 5000 },
  { event_id: 3, event_name: 'Art Exhibition', event_date: '2024-09-01', venue_name: 'Art Gallery', event_description: 'A showcase of modern art.', event_capacity: 200 }
];

// Simulated ticket data - Directly linked to events (Denormalized)
const tickets = [
    { ticket_id: 101, event_id: 1, ticket_name: 'VIP', ticket_price: 250.00, quantity: 50, is_soldout: false },
    { ticket_id: 102, event_id: 1, ticket_name: 'Standard', ticket_price: 100.00, quantity: 200, is_soldout: false },
    { ticket_id: 103, event_id: 2, ticket_name: 'Standard', ticket_price: 120.00, quantity: 100, is_soldout: false },
    { ticket_id: 104, event_id: 3, ticket_name: 'General Admission', ticket_price: 50.00, quantity: 150, is_soldout: false }
];

// Placeholder function for creating a new ticket
function createTicket(event_id, ticket_name, ticket_price, quantity) {
    const newTicket = { ticket_id: Math.floor(Math.random() * 1000) + 1, event_id: event_id, ticket_name: ticket_name, ticket_price: ticket_price, quantity: quantity, is_soldout: false };
    tickets.push(newTicket);
    console.log(`Ticket ${newTicket.ticket_id} created for event ${event_id}`);
    return newTicket;
}


// Placeholder function for selling tickets
function sellTickets(ticket_id, quantity) {
  const ticket = tickets.find(t => t.ticket_id === ticket_id);

  if (!ticket) {
    console.log(`Ticket ${ticket_id} not found.`);
    return;
  }

  if (ticket.quantity < quantity) {
    console.log(`Not enough tickets available for ticket ${ticket_id}.`);
    return;
  }

  ticket.quantity -= quantity;
  console.log(`Sold ${quantity} tickets for ticket ${ticket_id}`);
}

// Placeholder function to get all tickets
function getAllTickets() {
  return tickets;
}

//Placeholder function to get all events
function getAllEvents() {
    return events;
}


//Exported functions for use in other modules
module.exports = {
    createTicket,
    sellTickets,
    getAllTickets,
    getAllEvents,
    events,
    tickets
};