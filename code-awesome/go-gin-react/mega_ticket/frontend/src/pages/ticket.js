// frontend/src/pages/ticket.js
import React, { useState, useEffect } from 'react';
// React imports
import { Link } from 'react-router-dom'; // Import Link for navigation
// import axios from 'axios'; // Import axios for making API requests

const Ticket = () => {
  // State variables
  const [eventName, setEventName] = useState('');
  const [ticketPrice, setTicketPrice] = useState(0);
  const [ticketQuantity, setTicketQuantity] = useState(1);
  const [availableTickets, setAvailableTickets] = useState(0);
  const [cartItems, setCartItems] = useState([]);
  const [error, setError] = useState('');

  // useEffect Hook - Runs when component mounts and when 'eventName' changes
  useEffect(() => {
    // Simulate fetching event data (replace with actual API call)
    const fetchData = async () => {
      try {
        // Simulate API response
        const eventData = {
          id: 1,
          name: 'Awesome Concert',
          description: 'A night of incredible music!',
          venue: 'Stadium X',
          date: '2024-03-15',
          price: 50.00,
          stock: 100
        };
        setEventName(eventData.name);
        setTicketPrice(eventData.price);
        setAvailableTickets(eventData.stock);
      } catch (err) {
        setError(`Failed to load event data: ${err.message}`);
        console.error('Error fetching event data:', err);
      }
    };

    fetchData();
  }, []); // Empty dependency array ensures this effect runs only once on mount

  // Function to handle adding a ticket to the cart
  const handleAddTicket = () => {
    if (ticketQuantity <= 0) return;

    if (ticketQuantity > availableTickets) {
      alert(`Not enough tickets available. Only ${availableTickets} tickets left.`);
      return;
    }

    // Update cart state
    setCartItems([...cartItems, {
      eventId: 1,
      quantity: ticketQuantity
    }]);
    setTicketQuantity(1); // Reset quantity after adding
  };

  // Simulate button click event
  const handleClick = () => {
    // Perform logic here, e.g., update cart, add to database
    console.log('Clicked Add Ticket');
    handleAddTicket();
  };

  return (
    <div>
      <h2>{eventName}</h2>
      <p>Price: ${ticketPrice}</p>
      <p>Available Tickets: {availableTickets}</p>

      <button onClick={handleClick} style={{ backgroundColor: 'green', color: 'white', padding: '10px', border: 'none', cursor: 'pointer' }}>Add to Cart</button>

      {/* Display cart items */}
      {cartItems.length > 0 && (
        <div>
          <h3>Cart Items:</h3>
          <ul>
            {cartItems.map((item) => (
              <li key={item.eventId}>
                Ticket ID: {item.eventId}, Quantity: {item.quantity}
              </li>
            ))}
          </ul>
        </div>
      )}

      {/* Navigation Link */}
      {/* <Link to="/">Go back to Home</Link> */}
    </div>
  );
};

export default Ticket;