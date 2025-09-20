// frontend/src/pages/ticket-list.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from '@react-router-dom';
import { useEffect as useLocalEffect } from 'react';


const TicketList = () => {
  const [events, setEvents] = useState([]);
  const [tickets, setTickets] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const API_URL = 'http://localhost:8080'; // Replace with your backend URL
  const EVENT_API_URL = `${API_URL}/events`;
  const TICKET_API_URL = `${API_URL}/tickets`;

  useEffect(() => {
    // Simulate an asynchronous operation (e.g., fetching from an API)
    const fetchEvents = async () => {
      try {
        const response = await axios.get(EVENT_API_URL);
        setEvents(response.data);
      } catch (error) {
        console.error('Error fetching events:', error);
        setError('Failed to load events.');
      }
    };

    fetchEvents();
  }, []);

  useEffect(() => {
    // Fetch tickets associated with events
    const fetchTickets = async () => {
      try {
        const response = await axios.get(TICKET_API_URL);
        setTickets(response.data);
      } catch (error) {
        console.error('Error fetching tickets:', error);
        setError('Failed to load tickets.');
      }
    };

    fetchTickets();
  }, []);

  const handleTicketPurchase = async (ticketId) => {
    try {
      const response = await axios.post(`${TICKET_API_URL}/purchase/${ticketId}`, {
        // Add payment details or other purchase information here
        userId: 'user123', // Replace with actual user ID
      });
      console.log('Ticket purchased successfully:', response.data);
      // Update state or perform other actions after successful purchase
    } catch (error) {
      console.error('Error purchasing ticket:', error);
      // Handle purchase error
    }
  };

  if (loading) {
    return <div>Loading events...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h1>Event Tickets</h1>
      <table>
        <thead>
          <tr>
            <th>Event Name</th>
            <th>Ticket Price</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {tickets.map((ticket) => (
            <tr key={ticket.id}>
              <td>{ticket.eventName}</td>
              <td>${ticket.price}</td>
              <td>
                <button onClick={() => handleTicketPurchase(ticket.id)}>Buy Ticket</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <Link to="/create-ticket">Create New Ticket</Link>
    </div>
  );
};

export default TicketList;