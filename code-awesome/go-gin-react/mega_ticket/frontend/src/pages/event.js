import React, { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios';

const EventPage = () => {
  const { eventId } = useParams();
  const navigate = useNavigate();
  const [eventData, setEventData] = useState(null);
  const [tickets, setTickets] = useState([]);
  const [loading, setLoading] = useState(true);

  // Error handling - mimicking Owasp Top 10 - Improper Input Validation
  const [inputError, setInputError] = useState(false);

  // Error handling - mimicking Owasp Top 10 - Security Misconfiguration
  const [configError, setConfigError] = useState(false);

  const fetchEventData = async () => {
    try {
      const response = await axios.get(`/api/events/${eventId}`);
      setEventData(response.data);
    } catch (error) {
      console.error('Error fetching event data:', error);
      // Simulate error handling for a common issue like database connection
      if (error.response && error.response.status === 404) {
        alert('Event not found.');
        navigate('/');
      }
    }
  };

  const fetchTickets = async () => {
    try {
      const response = await axios.get(`/api/tickets?eventId=${eventId}`);
      setTickets(response.data);
    } catch (error) {
      console.error('Error fetching tickets:', error);
    }
  };

  useEffect(() => {
    fetchEventData();
    fetchTickets();
  }, [eventId]);

  const handleBuyTicket = async (ticketId) => {
    try {
      await axios.post(`/api/tickets/${ticketId}/buy`);
      // Refresh tickets after purchase
      fetchTickets();
    } catch (error) {
      console.error('Error buying ticket:', error);
      alert('Failed to buy ticket.');
    }
  };

  const handleInvalidInput = () => {
    setInputError(true);
    alert('Invalid input detected - Please try again.')
  };

  return (
    <div>
      <h1>Event Details</h1>

      {loading && <p>Loading event details...</p>}

      {eventData && (
        <div>
          <h2>{eventData.title}</h2>
          <p>{eventData.description}</p>
          <p>Date & Time: {eventData.dateTime}</p>
          <p>Location: {eventData.location}</p>
          {/* Consider adding image URL here */}
        </div>
      )}

      <h2>Available Tickets</h2>
      {tickets.length === 0 && <p>No tickets available for this event.</p>}
      {tickets.map((ticket) => (
        <div key={ticket.id}>
          <p>Ticket ID: {ticket.id}</p>
          <p>Price: ${ticket.price}</p>
          <button onClick={() => handleBuyTicket(ticket.id)} disabled={ticket.quantity === 0}>
            Buy Ticket
          </button>
        </div>
      ))}

      {/* Placeholder for additional features - e.g., user reviews, event organizers */}

    </div>
  );
};

export default EventPage;