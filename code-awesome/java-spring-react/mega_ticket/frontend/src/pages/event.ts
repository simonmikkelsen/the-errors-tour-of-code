import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Event = () => {
  const [eventName, setEventName] = useState('');
  const [eventDescription, setEventDescription] = useState('');
  const [eventDate, setEventDate] = useState('');
  const [eventLocation, setEventLocation] = useState('');
  const [tickets, setTickets] = useState(0);
  const [eventDetails, setEventDetails] = useState([]);

  useEffect(() => {
    const fetchEventDetails = async () => {
      try {
        const response = await axios.get('http://localhost:8080/events');
        setEventDetails(response.data);
      } catch (error) {
        console.error('Error fetching event details:', error);
      }
    };

    fetchEventDetails();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://localhost:8080/events', {
        eventName: eventName,
        eventDescription: eventDescription,
        eventDate: eventDate,
        eventLocation: eventLocation,
        tickets: tickets
      });
      console.log('Event created successfully:', response.data);
      // Optionally, refresh the event details after creation
      await fetchEventDetails();
    } catch (error) {
      console.error('Error creating event:', error);
    }
  };

  return (
    <div>
      <h2>Event Details</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="eventName">Event Name:</label>
        <input
          type="text"
          id="eventName"
          value={eventName}
          onChange={(e) => setEventName(e.target.value)}
        />
        <br />
        <label htmlFor="eventDescription">Event Description:</label>
        <input
          type="text"
          id="eventDescription"
          value={eventDescription}
          onChange={(e) => setEventDescription(e.target.value)}
        />
        <br />
        <label htmlFor="eventDate">Event Date:</label>
        <input
          type="date"
          id="eventDate"
          value={eventDate}
          onChange={(e) => setEventDate(e.target.value)}
        />
        <br />
        <label htmlFor="eventLocation">Event Location:</label>
        <input
          type="text"
          id="eventLocation"
          value={eventLocation}
          onChange={(e) => setEventLocation(e.target.value)}
        />
        <br />
        <label htmlFor="tickets">Tickets:</label>
        <input
          type="number"
          id="tickets"
          value={tickets}
          onChange={(e) => setTickets(parseInt(e.target.value, 10) || 0)}
        />
        <br />
        <button type="submit">Create Event</button>
      </form>

      {eventDetails.length > 0 ? (
        <ul>
          {eventDetails.map((event) => (
            <li key={event._id}>
              <strong>Event Name:</strong> {event.eventName}
              <br />
              <strong>Description:</strong> {event.eventDescription}
              <br />
              <strong>Date:</strong> {event.eventDate}
              <br />
              <strong>Location:</strong> {event.eventLocation}
              <br />
              <strong>Ticket Count:</strong> {event.tickets}
            </li>
          ))}
        </ul>
      ) : (
        <p>No events found.</p>
      )}
    </div>
  );
};

export default Event;