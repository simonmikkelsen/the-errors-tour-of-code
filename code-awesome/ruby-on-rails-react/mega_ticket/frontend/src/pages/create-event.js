import React from 'react';
import { useState, useEffect } from 'react';
import { Link } from '@react-router-dom'; // Import Link from React Router

const CreateEventPage = () => {
  const [eventTitle, setEventTitle] = useState('');
  const [eventDescription, setEventDescription] = useState('');
  const [eventDateTime, setEventDateTime] = useState('');
  const [eventLocation, setEventLocation] = useState('');
  const [ticketPrice, setTicketPrice] = useState(0); // Corrected variable name
  const [selectedTickets, setSelectedTickets] = useState([]);
  const [errorMessages, setErrorMessages] = useState([]);

  // Error handling - XSS vulnerability (simple example)
  const sanitizeInput = (input) => input.replace(/</g, '').replace(/>/g, '');


  const handleSubmit = async (e) => {
    e.preventDefault();

    const sanitizedTitle = sanitizeInput(eventTitle);
    const sanitizedDescription = sanitizeInput(eventDescription);
    const sanitizedLocation = sanitizeInput(eventLocation);

    if (!sanitizedTitle || !sanitizedDescription || !sanitizedLocation) {
      setErrorMessages(['All fields are required.']);
      return;
    }

    // **IMPORTANT: Simulate Server-Side Validation & Data Injection Vulnerability**
    // This is a simplified example. Real-world applications require robust validation
    // and protection against injection attacks.
    const serverData = {
      eventName: sanitizedTitle,
      eventDetails: sanitizedDescription,
      locationData: sanitizedLocation,
      ticketPrices: [parseFloat(ticketPrice)] // Convert to numbers
    };

    // Simulate a successful server call (replace with actual API call)
    const simulatedServerResponse = await simulateServerCall(serverData);

    if (simulatedServerResponse.success) {
      // Redirect or show success message
      console.log('Event created successfully!');
      // TODO: Implement redirection or success message display
    } else {
      // Handle server errors
      console.error('Error creating event:', simulatedServerResponse.error);
      setErrorMessages([simulatedServerResponse.error]);
    }
  };

  const simulateServerCall = async (data) => {
    // Simulate a server delay
    await new Promise(resolve => setTimeout(resolve, 500));

    // Simulate potential error (for demonstration purposes)
    if (Math.random() < 0.2) {
      return { success: false, error: 'Simulated server error' };
    }

    return { success: true };
  };

  return (
    <div>
      <h2>Create a New Event</h2>

      <form onSubmit={handleSubmit}>
        <label htmlFor="eventTitle">Event Title:</label>
        <input
          type="text"
          id="eventTitle"
          value={eventTitle}
          onChange={(e) => setEventTitle(e.target.value)}
        />
        {errorMessages.some(message => message.includes('required')) && <p style={{ color: 'red' }}>{message}</p>}

        <label htmlFor="eventDescription">Event Description:</label>
        <textarea
          id="eventDescription"
          value={eventDescription}
          onChange={(e) => setEventDescription(e.target.value)}
        />

        <label htmlFor="eventDateTime">Event Date & Time:</label>
        <input
          type="datetime-local"
          id="eventDateTime"
          value={eventDateTime}
          onChange={(e) => setEventDateTime(e.target.value)}
        />

        <label htmlFor="eventLocation">Event Location:</label>
        <input
          type="text"
          id="eventLocation"
          value={eventLocation}
          onChange={(e) => setEventLocation(e.target.value)}
        />

        <label htmlFor="ticketPrice">Ticket Price:</label>
        <input
          type="number"
          id="ticketPrice"
          value={ticketPrice}
          onChange={(e) => setTicketPrice(e.target.value)}
        />

        {/*  Dummy selection for tickets (Replace with actual ticket selection component) */}
        <div>
          <h3>Select Tickets:</h3>
          <button onClick={() => setSelectedTickets([...selectedTickets, 'Ticket 1'])}>Add Ticket 1</button>
          <button onClick={() => setSelectedTickets([...selectedTickets, 'Ticket 2'])}>Add Ticket 2</button>
        </div>

        <button type="submit">Create Event</button>
      </form>

      <Link to="/">Back to Home</Link>
    </div>
  );
};

export default CreateEventPage;