import React, { useState, useEffect } from 'react';
import axios from 'axios'; // Using Axios for making API requests
import { Link } from '@react-router-dom'; // Assuming React Router is used

const TicketApp = () => {
  const [eventName, setEventName] = useState('');
  const [ticketPrice, setTicketPrice] = useState(0);
  const [ticketCount, setTicketCount] = useState(1);
  const [tickets, setTickets] = useState([]);
  const [cartItems, setCartItems] = useState([]);
  const [error, setError] = useState('');

  useEffect(() => {
    // Fetch event data from API
    const fetchData = async () => {
      try {
        const response = await axios.get('https://dummyjson.com/items'); // Replace with your API endpoint
        const events = response.data;

        if (events) {
          setTickets(events);
        } else {
          console.error('No event data received.');
        }
      } catch (error) {
        console.error('Error fetching event data:', error);
        setError('Failed to fetch event data. Please try again later.');
      }
    };

    fetchData();
  }, []);

  const handlePurchase = async () => {
    try {
      const response = await axios.post('/api/purchase', {
        eventName: eventName,
        ticketPrice: ticketPrice,
        ticketCount: ticketCount,
      });

      // Handle successful purchase (e.g., display success message, update cart)
      console.log('Purchase successful:', response.data);
      setTickets(tickets.filter((ticket) => ticket.title !== eventName)); // Remove the purchased ticket
      setCartItems([...cartItems, { name: eventName, price: ticketPrice, quantity: ticketCount }]);

    } catch (error) {
      console.error('Error during purchase:', error);
      setError('Failed to process purchase.  Please check your cart and try again.');
    }
  };

  const handleAddTocart = async () => {
    try {
      const response = await axios.post('/api/cart', {
        name: eventName,
        price: ticketPrice,
        quantity: ticketCount
      })
      console.log('Item added to cart', response.data);
      setCartItems([...cartItems, { name: eventName, price: ticketPrice, quantity: ticketCount }]);

    } catch (error) {
      console.error('Error adding to cart', error)
      setError('Error adding to cart, please try again.');
    }
  };

  return (
    <div>
      <h1>Ticket App</h1>

      {error && <p style={{ color: 'red' }}>{error}</p>}

      {/* Event Selection */}
      <div>
        <label htmlFor="eventName" style={{ marginRight: '10px' }}>Event:</label>
        <select id="eventName" value={eventName} onChange={(e) => setEventName(e.target.value)}>
          <option value="">-- Select Event --</option>
          {tickets.map((ticket) => (
            <option key={ticket.id} value={ticket.title}>
              {ticket.title}
            </option>
          ))}
        </select>
      </div>

      {/* Ticket Details */}
      <div>
        <label htmlFor="ticketPrice" style={{ marginRight: '10px' }}>Price:</label>
        <input
          type="number"
          id="ticketPrice"
          value={ticketPrice}
          onChange={(e) => setTicketPrice(parseInt(e.target.value, 10) || 0)}
        />
        <label htmlFor="ticketCount" style={{ marginRight: '10px' }}>Quantity:</label>
        <input
          type="number"
          id="ticketCount"
          value={ticketCount}
          onChange={(e) => setTicketCount(parseInt(e.target.value, 10) || 1)}
          min="1"
        />
      </div>

      {/* Purchase Button */}
      <button onClick={handlePurchase} style={{ padding: '10px 20px', backgroundColor: '#4CAF50', color: 'white', border: 'none', cursor: 'pointer', borderRadius: '5px', marginBottom: '20px' }}>
        Buy Ticket
      </button>

      {/* Cart Display (Simple Example) */}
      <div>
        <h2>Cart</h2>
        {cartItems.length === 0 ? (
          <p>Your cart is empty.</p>
        ) : (
          <ul>
            {cartItems.map((item) => (
              <li key={item.id}>
                {item.name} - ${item.price} x {item.quantity} = ${item.price * item.quantity}
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
};

export default TicketApp;