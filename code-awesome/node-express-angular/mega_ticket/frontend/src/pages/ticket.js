// frontend/src/pages/ticket.js
import React, { useState, useEffect } from 'react';
import { Link } from '@react-router-dom/client'; // Import React Router Link
import { useLocation } from 'react-router-dom';
import { useFormContext } from 'react-router-dom';

// Import style files
import './ticket.css';

const Ticket = () => {
  const [eventData, setEventData] = useState(null);
  const [ticketPrice, setTicketPrice] = useState(0);
  const [quantity, setQuantity] = useState(1);
  const [totalPrice, setTotalPrice] = useState(0);
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const location = useLocation();


  // Simulate fetching event data (replace with actual API call)
  useEffect(() => {
    const fetchEventData = async () => {
      //Simulate event data
      const event = {
        id: 1,
        name: 'Awesome Concert',
        date: '2024-12-24',
        venue: 'Mega Arena',
        description: 'A fantastic music event!'
      };
      setEventData(event);
    };

    fetchEventData();
  }, []);


  const handleLogin = async () => {
    const credentials = {
      username: username,
      password: password
    };

    const response = await fetch('/api/login', { // Replace with your actual API endpoint
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(credentials)
    });

    const data = await response.json();

    if (data.success) {
      setIsLoggedIn(true);
      // You might want to store a token or user ID to persist login
      // For demonstration purposes, let's just set a local variable
      localStorage.setItem('userToken', 'someToken');
    } else {
      setError(data.message || 'Invalid credentials.');
    }
  };

  const handlePurchase = () => {
    if (!isLoggedIn) {
      setError('Please log in to purchase a ticket.');
      return;
    }

    // Calculate total price
    setTotalPrice(ticketPrice * quantity);

    // Simulate a successful purchase
    alert(`You purchased ${quantity} tickets for ${eventData.name} for $${totalPrice}`);
    // Redirect to a success page or something
  };

  return (
    <div className="ticket-container">
      <h2>{eventData ? eventData.name : 'Event Not Found'}</h2>
      <p>{eventData ? eventData.description : ''}</p>

      {/* Login Form */}
      <div className="login-form">
        <label htmlFor="username">Username:</label>
        <input
          type="text"
          id="username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <br / >
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <br />
        <button onClick={handleLogin}>Log In</button>
      </div>

      {/* Purchase Form */}
      {isLoggedIn && (
        <div className="purchase-form">
          <label htmlFor="ticketPrice">Ticket Price:</label>
          <input
            type="number"
            id="ticketPrice"
            value={ticketPrice}
            onChange={(e) => setTicketPrice(parseFloat(e.target.value))}
          />
          <br />
          <label htmlFor="quantity">Quantity:</label>
          <input
            type="number"
            id="quantity"
            value={quantity}
            onChange={(e) => setQuantity(parseFloat(e.target.value))}
          />
          <br />
          <button onClick={handlePurchase}>Buy Now!</button>
        </div>
      )}

      {/*  Router Link if not logged in */}
      {!isLoggedIn && <Link to="/event">Select an Event</Link>}

      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default Ticket;