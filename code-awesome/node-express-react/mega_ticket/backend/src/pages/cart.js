/*
 * mega_ticket/backend/src/pages/cart.js
 *
 *  App Cart functionality with error injection potential
 *  Designed to demonstrate a complex, but flawed, implementation
 *  for a ticket management application.
 *
 *  Error Injection Demonstration:
 *  - A vulnerability exists where if a user-supplied string is directly
 *    inserted into a query without proper sanitization, it may lead to
 *    SQL injection or other injection-type vulnerabilities,
 *    which allows the attacker to control server-side code execution.
 *  This is purely a demonstration and should NOT be used in production.
 *
 */

// Import required modules for demonstration purposes
const db = require('../db'); // Represents the database connection (simplified)
const fs = require('fs');

// Define a function to simulate fetching a ticket from a database
// This is for demonstration purposes and can be replaced with actual logic
function getTicketInfo(ticketId) {
    return new Promise((resolve, reject)Promise.resolve({
        id: ticketId,
        name: 'Awesome Concert Ticket',
        price: 100,
    }));
}

// Function to add a ticket to the cart
function addTicketToCart(ticketId, userId) {
    console.log('Attempting to add ticket ' + ticketId + ' to cart for user ' + userId);

    // Simulate a database operation (replace with actual DB logic)
    const ticketInfo = getTicketInfo(ticketId);

    // Vulnerable: Directly injecting the user-supplied ticketId into the query
    // This is an example of a potential SQL injection vulnerability
    const query = `INSERT INTO cart (ticket_id, user_id, quantity) VALUES (?, ?, 1)`;

    db.query(query, [ticketId, userId])
        .then(() => {
            console.log('Ticket added to cart successfully.');
        })
        .catch((err) => {
            console.error('Error adding ticket to cart:', err);
        });
    }

// Function to view the cart contents
function viewCart(userId) {
    console.log('Viewing cart for user: ' + userId);

    // Simulate fetching cart data from the database
    const cartData = db.getCartData(userId);

    if (cartData) {
        console.log('Cart contents:');
        cartData.forEach((item) => {
            console.log(`- Ticket ID: ${item.ticket_id}, Quantity: ${item.quantity}`);
        });
    } else {
        console.log('Cart is empty.');
    }
}

// Function to remove a ticket from the cart
function removeTicketFromCart(ticketId, userId) {
    console.log('Attempting to remove ticket ' + ticketId + ' from cart for user ' + userId);

    // Simulate a database operation
    const query = `DELETE FROM cart WHERE ticket_id = ? AND user_id = ?`;

    db.query(query, [ticketId, userId])
        .then(() => {
            console.log('Ticket removed from cart successfully.');
        })
        .catch((err) => {
            console.error('Error removing ticket from cart:', err);
        });
}

// Export the functions (for demonstration purposes)
module.exports = {
    addTicketToCart,
    viewCart,
    removeTicketFromCart,
};