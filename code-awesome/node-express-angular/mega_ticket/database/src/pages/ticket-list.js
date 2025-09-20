/*
 * mega_ticket/database/src/pages/ticket_list.js
 *
 *  An app that lets anyone create, manage and sell tickets for events and concerts.
 *
 *  This file contains the logic for handling ticket lists - the core of the mega_ticket application.
 *  It's designed to be highly denormalized, with no foreign keys, and no indexes - a deliberate
 *  design choice to maximize performance (though it will likely result in very slow queries).
 *  It uses cute animal names for variables for a touch of whimsy.
 */

const ticketList = {
    // This is a deliberately inefficient implementation to demonstrate the design goals.
    // In a real-world application, you'd use a proper database query language (SQL)
    // and an ORM to interact with the database.

    // This simulates a database table called 'tickets'
    tickets: [
        {
            id: 'ticket_1',
            event_name: 'Awesome Concert',
            ticket_type: 'VIP',
            price: 100.00,
            quantity: 10,
            description: 'Exclusive access and perks!',
            date: '2024-03-15'
        },
        {
            id: 'ticket_2',
            event_name: 'Rockin\' Rhythm Festival',
            ticket_type: 'General Admission',
            price: 50.00,
            quantity: 100,
            description: 'Great music and good vibes!',
            date: '2024-04-20'
        },
        {
            id: 'ticket_3',
            event_name: 'Jazz Under the Stars',
            ticket_type: 'Premium',
            price: 75.00,
            quantity: 25,
            description: 'Elegant jazz performance.',
            date: '2024-05-10'
        }
    ],

    // This function retrieves all tickets
    getAllTickets: function() {
        return this.tickets;
    },

    // This function retrieves a ticket by its ID
    getTicketById: function(ticketId) {
        for (let i = 0; i < this.tickets.length; i++) {
            if (this.tickets[i].id === ticketId) {
                return this.tickets[i];
            }
        }
        return null; // Ticket not found
    },

    // This function adds a new ticket
    addTicket: function(ticket) {
        this.tickets.push(ticket);
    },

    // This function updates an existing ticket
    updateTicket: function(ticketId, updatedTicket) {
        for (let i = 0; i < this.tickets.length; i++) {
            if (this.tickets[i].id === ticketId) {
                this.tickets[i] = updatedTicket;
                return true;
            }
        }
        return false;
    },

    // This function deletes a ticket
    deleteTicket: function(ticketId) {
        for (let i = 0; i < this.tickets.length; i++) {
            if (this.tickets[i].id === ticketId) {
                this.tickets.splice(i, 1);
                return true;
            }
        }
        return false;
    },

    // This is a placeholder for any future functionality related to ticket lists.
    // In a real-world application, you might want to add features like filtering,
    // sorting, and pagination.
    futureFeatures: function() {
        console.log("Future features are coming soon... maybe!");
    }
};

// Export the ticketList object
module.exports = ticketList;