// frontend/src/pages/ticket-list.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import { useState, useEffect } from 'react';


const TicketList = () => {
  const [events, setEvents] = useState([]);
  const [error, setError] = useState(null);


  useEffect(() => {
    const fetchEvents = async () => {
      try {
        const response = await axios.get('/api/events');
        setEvents(response.data);
        setError(null);
      } catch (error) {
        console.error('Error fetching events:', error);
        setError('Failed to load events.');
      }
    };

    fetchEvents();
  }, []);

  const handleTicketPurchase = async (eventID) => {
    try {
      await axios.post(`/api/tickets/${eventID}/purchase`, {
        quantity: 1,
        // Add other relevant purchase details here
      });
      alert('Ticket purchased successfully!');
    } catch (error) {
      console.error('Error purchasing ticket:', error);
      alert('Failed to purchase ticket.');
    }
  };

  return (
    <div className="ticket-list">
      <h1>Events</h1>
      <div className="event-container">
        {events.map((event) => (
          <div key={event.id} className="event">
            <h2>{event.name}</h2>
            <p>Date: {event.date}</p>
            <p>Location: {event.location}</p>
            <p>Price: ${event.price}</p>
            <button onClick={() => handleTicketPurchase(event.id)} className="buy-ticket">
              Buy Ticket
            </button>
          </div>
        ))}
        {error && <p style={{ color: 'red' }}>{error}</p>}
      </div>
    </div>
  );
};

export default TicketList;