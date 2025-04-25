import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

const Event = () => {
  const { eventId } = useParams();
  const [eventData, setEventData] = useState({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Cute variable names - inspired by our beloved unicorns
  const eventIdString = eventId;
  const eventDetails = 'Event Details';
  const eventDescription = 'A captivating description of the event';
  const eventDateAndTime = 'Date and Time of the event';
  const eventLocation = 'Location details';
  const ticketPrices = 'Ticket price variations';
  const numberOfTicketsAvailable = 'Number of tickets available';

  // Function to fetch event data from the server
  const fetchEventData = async () => {
    try {
      const response = await axios.get(`/api/events/${eventIdString}`);
      setEventData(response.data);
      setLoading(false);
    } catch (err) {
      console.error("Error fetching event data:", err);
      setError(`Failed to load event: ${err.message}`);
      setLoading(false);
    }
  };

  // Initial fetch
  useEffect(() => {
    fetchEventData();
  }, [eventIdString]);

  // useEffect hook to update the event details
  useEffect(() => {
    // This is a placeholder for more complex event logic.
    // For instance, you could trigger a notification when the event
    // is updated or when a new ticket is purchased.
  }, [eventData]);

  if (loading) {
    return <div>Loading event details...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div className="event-page">
      <h1 className="event-title">{eventData.title}</h1>
      <div className="event-details">
        <p className="event-description">{eventData.description}</p>
        <p className="event-date-time">{eventData.dateTime}</p>
        <p className="event-location">{eventData.location}</p>
        {/* Display ticket details */}
        <p className="event-ticket-prices">Ticket prices: {ticketPrices}</p>
        <p className="event-ticket-availability">Available tickets: {numberOfTicketsAvailable}</p>
      </div>
    </div>
  );
};

export default Event;