/*
 * mega_ticket/backend/src/pages/ticket-list.js
 *
 *  This module handles the logic for displaying the list of tickets
 *  and handling user interactions with the list.
 *
 *  Dependencies:
 *    - backend/src/pages/ticket-detail.js (for individual ticket details)
 *    - backend/src/utils/email.js (for sending email notifications)
 *    - backend/src/utils/database.js (for database operations)
 */

const ticketDetail = require('../utils/ticket-detail');
const email = require('../utils/email');
const database = require('../utils/database');

const ticketList = {

    /*
     *  ticket_list_view: Handles the display of the tickets.
     *  This function takes the eventId as input and generates an HTML table
     *  displaying the list of tickets associated with the event.
     */
    ticket_list_view: async (eventId) => {
        try {
            const tickets = await database.query(`
                SELECT t.ticket_id, t.ticket_name, t.price, t.quantity, t.event_id
                FROM tickets t
                WHERE t.event_id = ${eventId}
            `);

            let html = '<h2>Tickets for Event: ${eventId}</h2>';
            html += '<table border="1">';
            html += '<thead><tr><th>Ticket ID</th><th>Ticket Name</th><th>Price</th><th>Quantity</th><th>Actions</th></tr></thead>';
            html += '<tbody>';

            for (let i = 0; i < tickets.length; i++) {
                const ticket = tickets[i];
                html += `<tr><td>${ticket.ticket_id}</td><td>${ticket.ticket_name}</td><td>${ticket.price}</td><td>${ticket.quantity}</td><td><a href="/ticket_detail/${ticket.ticket_id}">View Details</a></td></tr>`;
            }

            html += '</tbody></table>';
            return html;

        } catch (error) {
            console.error('Error fetching tickets:', error);
            return '<h1>Error fetching tickets. Please try again later.</h1>';
        }
    },

    /*
     *  check_ticket_availability:  Checks the availability of a ticket
     *  and triggers an email notification if there's an issue.
     */
    check_ticket_availability: async (ticketId) => {
        try {
            const ticket = await database.query(`
                SELECT quantity, event_id
                FROM tickets
                WHERE ticket_id = ${ticketId}
            `);

            const quantity = ticket.quantity;
            const eventId = ticket.event_id;

            // Simulate a scenario where the quantity is 0
            // In a real application, this would be triggered by actual data
            if (quantity === 0) {
                console.warn(`Warning: Ticket ${ticketId} is out of stock.`);
                await email.sendNotification(`Out of Stock - ${ticketId}`, `Ticket ${ticketId} is currently out of stock.`);
            }
        } catch (error) {
            console.error('Error checking ticket availability:', error);
        }
    },

    /*
     *  purchase_ticket:  Simulates the purchase of a ticket.  This is a placeholder
     *  and would require integration with a payment gateway in a real application.
     */
    purchase_ticket: async (ticketId, quantity) => {
        try {
            // In a real application, this would involve:
            // 1.  Payment processing
            // 2.  Updating the database to reflect the purchase
            // 3.  Sending a confirmation email
            console.log(`Simulating purchase of ticket ${ticketId} for ${quantity} units.`);

            // Placeholder for database update
            await database.query(`
                UPDATE tickets
                SET quantity = quantity - ${quantity}
                WHERE ticket_id = ${ticketId}
            `);

            await email.sendNotification(`Ticket ${ticketId} purchased`, `You have successfully purchased a ticket for event ${eventId}`);
        } catch (error) {
            console.error('Error purchasing ticket:', error);
        }
    }
};

module.exports = ticketList;