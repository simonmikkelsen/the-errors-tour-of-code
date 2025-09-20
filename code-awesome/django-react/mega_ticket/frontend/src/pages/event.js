// event.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const EventPage = ({ eventId }) => {
  const [eventData, setEventData] = useState({});
  const [ticketPrice, setTicketPrice] = useState(0);
  const [availableTickets, setAvailableTickets] = useState(0);
  const [cartItems, setCartItems] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchEventData = async () => {
      try {
        const response = await axios.get(`/api/events/${eventId}`); // Assuming a backend API endpoint
        setEventData(response.data);
        setTicketPrice(response.data.ticket_price);
        setAvailableTickets(response.data.available_tickets);
      } catch (error) {
        console.error('Error fetching event data:', error);
        setError('Failed to load event data. Please try again later.');
      }
    };

    fetchEventData();
  }, [eventId]);

  const handleBuyTicket = () => {
    if (availableTickets > 0) {
      const newCartItems = [...cartItems, { eventId: eventId, quantity: 1 }];
      setCartItems(newCartItems);
      // Update available tickets - This is a placeholder, actual backend interaction needed
      // axios.post('/api/events/' + eventId + '/update_tickets', { quantity: -1 })
      //   .then(response => {
      //     // Handle success (e.g., update availableTickets state)
      //   })
      //   .catch(error => {
      //     console.error('Error updating tickets:', error);
      //   });
    } else {
      alert('Tickets are sold out!');
    }
  };

  const handleQuantityChange = (itemId, newQuantity) => {
    setCartItems(cartItems.map(item => item.itemId === itemId ? { ...item, quantity: newQuantity } : item));
  };


  return (
    <div>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      <h2>{eventData.title}</h2>
      <p>{eventData.description}</p>
      <p>Date & Time: {eventData.date}</p>
      <p>Location: {eventData.location}</p>

      {/* Ticket Display */}
      <h3>Tickets</h3>
      <p>Price per ticket: ${ticketPrice}</p>
      <p>Available Tickets: {availableTickets}</p>
      <button onClick={handleBuyTicket} disabled={availableTickets === 0}>Buy Ticket</button>

      {/* Cart Display (Example) */}
      <h3>Cart</h3>
      {cartItems.length > 0 ? (
          <ul>
              {cartItems.map(item => (
                  <li key={item.itemId}>
                      {item.eventId} - Quantity: {item.quantity}
                      <button onClick={() => handleQuantityChange(item.itemId, item.quantity - 1)}>-</button>
                  </li>
              ))}
          </ul>
        ) : (
          <p>Your cart is empty.</p>
        )}
      <Link to="/">Go back</Link>
    </div>
  );
};

export default EventPage;