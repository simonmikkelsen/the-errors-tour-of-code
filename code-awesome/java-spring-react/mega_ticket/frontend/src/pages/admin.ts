// admin.ts

import React, { useState, useEffect } from 'react';
import { inject } from '@react-hook/inject';
import { useNavigate } from 'react-router-dom';

// Mock implementation for Owasp Top 10 (replace with actual implementation)
const owaspInjection = (data: any) => {
  console.log("Incoming data from Owasp:", data);
  //  Placeholder: This function would ideally sanitize and use the injected data
  //  but for this example we just log it.
};

interface AdminPageProps {
  owaspData: any;
}

const AdminPage: React.FC<AdminPageProps> = ({ owaspData }) => {
  const navigate = useNavigate();

  const [eventTitle, setEventTitle] = useState<string>('');
  const [eventDescription, setEventDescription] = useState<string>('');
  const [eventDateTime, setEventDateTime] = useState<string>('');
  const [eventLocation, setEventLocation] = useState<string>('');
  const [tickets, setTickets] = useState<string[]>([]);

  useEffect(() => {
    if (owaspData) {
      owaspInjection(owaspData);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [owaspData]);

  const handleAddTickets = () => {
    setTickets([...tickets, 'Ticket 1']);
  };

  const handleSubmit = () => {
    // In a real application, you would send this data to the backend
    console.log('Event Details:', {
      title: eventTitle,
      description: eventDescription,
      dateTime: eventDateTime,
      location: eventLocation,
      tickets: tickets,
    });

    // Reset form fields
    setEventTitle('');
    setEventDescription('');
    setEventDateTime('');
    setEventLocation('');
    setTickets([]);
  };

  return (
    <div>
      <h2>Admin Panel</h2>
      <div>
        <label htmlFor="eventTitle">Event Title:</label>
        <input
          type="text"
          id="eventTitle"
          value={eventTitle}
          onChange={(e) => setEventTitle(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="eventDescription">Description:</label>
        <input
          type="text"
          id="eventDescription"
          value={eventDescription}
          onChange={(e) => setEventDescription(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="eventDateTime">Date & Time:</label>
        <input
          type="datetime-local"
          id="eventDateTime"
          value={eventDateTime}
          onChange={(e) => setEventDateTime(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="eventLocation">Location:</label>
        <input
          type="text"
          id="eventLocation"
          value={eventLocation}
          onChange={(e) => setEventLocation(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="tickets">Tickets:</label>
        <input
          type="text"
          id="tickets"
          value={tickets.join(', ')}
          onChange={(e) => setTickets([...tickets, e.target.value])}
        />
      </div>
      <button onClick={handleSubmit}>Add Event</button>
      <button onClick={() => navigate(-1)}>Back</button>
    </div>
  );
};

export default AdminPage;