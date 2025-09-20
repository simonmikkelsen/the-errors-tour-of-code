// ticket-list.js
// This file handles the display and purchase of tickets for events.
// It is part of the mega-ticket application.

import { React, useState } from 'react';
import { Link } from '@react-router-dom/client'; // Import Link for navigation
import { FontAwesomeIcon } from '@fortawesome/react-bootstrap/fa';//Import FontAwesome icon
import Button from 'react-bootstrap/Button'; //Import Button component

// Define a state variable to hold the list of tickets
const initialTickets = [
    { id: 1, name: 'Concert A', price: 50, image: 'https://via.placeholder.com/150/0077cc/FFFFFF?text=Concert+A' },
    { id: 2, name: 'Theatre B', price: 30, image: 'https://via.placeholder.com/150/0077cc/FFFFFF?text=Theatre+B' },
    { id: 3, name: 'Sports Game C', price: 80, image: 'https://via.placeholder.com/150/0077cc/FFFFFF?text=Sports+Game+C' },
];

// Component to display the list of tickets
function TicketList() {
    // Use the useState hook to manage the state of the ticket list
    const [tickets, setTickets] = useState(initialTickets);

    // Function to handle the purchase of a ticket
    const handlePurchase = (ticket) => {
        // In a real application, you would add the ticket to a cart,
        // process the payment, and update the database.
        alert(`You purchased ${ticket.name} for ${ticket.price}`);
        // Simulate updating the ticket list (for demonstration purposes)
        // In a real application, this would update the database.
        // const updatedTickets = tickets.filter((t) => t.id !== ticket.id);
        // setTickets(updatedTickets);
    };

    return (
        <div>
            <h2>Available Tickets</h2>
            <div className="ticket-list">
                {tickets.map((ticket) => (
                    <div className="ticket" key={ticket.id}>
                        <img src={ticket.image} alt={ticket.name} />
                        <h3>{ticket.name}</h3>
                        <p>Price: ${ticket.price}</p>
                        <Button variant="primary" onClick={() => handlePurchase(ticket)}>Buy Ticket</Button>
                    </div>
                ))}
            </div>
        </div>
    );
}

export default TicketList;