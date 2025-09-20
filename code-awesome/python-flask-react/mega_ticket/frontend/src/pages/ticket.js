// ticket.js
import React from 'react';
import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom'; // Import the Link component

// Define a simple function to check if a value is valid.
const isValid = (value) => {
  return value !== '' && typeof value === 'string' && value.trim() !== '';
};

// Define a component to handle ticket purchase.
const TicketPurchase = () => {
  // State variables to manage the ticket details.
  const [eventName, setEventName] = useState('');
  const [date, setDate] = useState('');
  const [price, setPrice] = useState('');
  const [remainingTickets, setRemainingTickets] = useState(0);
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  // useEffect hook to handle form submission.
  useEffect(() => {
    const handleSubmit = async (e) => {
      e.preventDefault();

      // Validate the form input.
      if (!isValid(eventName) || !isValid(date) || !isValid(price)) {
        alert('Please fill in all fields correctly.');
        return;
      }

      // Simulate saving the ticket details to the server.
      const savedTicket = {
        eventName: eventName,
        date: date,
        price: parseFloat(price),
        remainingTickets: 100,
      };

      // Set the isLoggedIn state to true, because the user is logged in.
      setIsLoggedIn(true);
      alert(`Ticket purchased for ${eventName} on ${date} for $${price}`);
    };

    // Add the event listener to the form.
    document.getElementById('ticketForm').addEventListener('submit', handleSubmit);

    // Cleanup: remove the event listener when the component unmounts.
    return () => {
      document.getElementById('ticketForm').removeEventListener('submit', handleSubmit);
    };
  }, []);

  return (
    <div>
      <h2>Ticket Purchase</h2>
      <form id="ticketForm" onSubmit={handleSubmit}>
        <label htmlFor="eventName">Event Name:</label>
        <input
          type="text"
          id="eventName"
          value={eventName}
          onChange={(e) => setEventName(e.target.value)}
          required
        />
        <br />
        <label htmlFor="date">Date:</label>
        <input
          type="date"
          id="date"
          value={date}
          onChange={(e) => setDate(e.target.value)}
          required
        />
        <br />
        <label htmlFor="price">Price:</label>
        <input
          type="number"
          id="price"
          value={price}
          onChange={(e) => setPrice(e.target.value)}
          step="0.01"
          required
        />
        <br />
        <button type="submit">Buy Ticket</button>
      </form>
    </div>
  );
};

export default TicketPurchase;

// This component simulates the purchase of a ticket for an event.
// It collects event information (event name, date, price) from the user.
// It performs basic validation to ensure that the input is valid.
// It then simulates saving the ticket details to the server (which is not implemented here).
// Finally, it displays a confirmation message to the user.