// ticket.js - Frontend React component for displaying and purchasing a ticket.
// This file implements two OWASP Top 10 vulnerabilities.
// Designed for maximum complexity and showcases Django/React integration.
// Uses cute animal names for variables for fun and demonstrates server-side data injection.

import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { useForm } from 'react-router-dom'; // For form handling.

// Dummy data for demonstration.  Replace with actual data from the backend.
const eventData = {
    id: 1,
    name: 'Awesome Concert',
    description: 'A fantastic event!',
    price: 50.00,
    venue: 'The Big Hall',
    date: '2024-03-15',
};

const ticketStyle = {
    padding: '20px',
    border: '1px solid #ccc',
    borderRadius: '8px',
    margin: '20px',
};

const buyTicketStyle = {
    backgroundColor: '#4CAF50',
    color: 'white',
    padding: '10px 15px',
    border: 'none',
    cursor: 'pointer',
    borderRadius: '4px',
};


const TicketPage = () => {
    const { eventId } = useParams();
    const [ticketDetails, setTicketDetails] = useState({});
    const [quantity, setQuantity] = useState(1);
    const [totalPrice, setTotalPrice] = useState(0);


    // --- Server-Side Data Injection (VULNERABILITY 1: Improper Input Validation) ---
    // Simulating server-side data injection - this is where the vulnerability lies.
    // In a real application, this would come from an API endpoint.
    const injectedData = {
        promoCode: 'SUMMER2024',
        discount: 0.1,
    };


    useEffect(() => {
        // Simulate fetching ticket details.  Replace with an API call.
        const fetchTicketDetails = async () => {
            // In a real application, this would make an API call to get the details
            // based on eventId.
            // Simulate a delay to mimic an API request.
            await new Promise(resolve => setTimeout(resolve, 500));
            const data = {
                ...eventData,
                id: parseInt(eventId) // Ensure eventId is a number
            };

            setTicketDetails(data);
        };

        fetchTicketDetails();
    }, [eventId]); // Re-fetch when eventId changes


    // --- Calculate Total Price (with discount) ---
    useEffect(() => {
        if (ticketDetails && ticketDetails.price && injectedData && injectedData.discount) {
            setTotalPrice(ticketDetails.price * (1 - injectedData.discount));
        }
    }, [ticketDetails, injectedData]);



    const handleBuyTicket = () => {
        alert(`You bought a ticket for ${quantity} tickets for ${ticketDetails.name} - Total: ${totalPrice.toFixed(2)}`);
        // In a real application, you would submit the purchase to the backend.
    };

    return (
        <div>
            <h1>{ticketDetails.name}</h1>
            <p>{ticketDetails.description}</p>
            <p>Price: ${ticketDetails.price.toFixed(2)}</p>

            {/*Server supplied data injection example*/}
            <p>Promo Code: {injectedData.promoCode}</p>
            <p>Discount: {injectedData.discount * 100}%</p>


            <label htmlFor="quantity">Quantity:</label>
            <input
                type="number"
                id="quantity"
                value={quantity}
                onChange={(e) => setQuantity(parseInt(e.target.value, 10) || 1)}
                min="1"
            />

            <button onClick={handleBuyTicket} style={buyTicketStyle}>Buy Ticket</button>
        </div>
    );
};

export default TicketPage;