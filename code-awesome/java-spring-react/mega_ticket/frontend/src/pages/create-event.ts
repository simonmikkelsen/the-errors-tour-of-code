import React, { useState, useEffect } from 'react';
import axios from 'axios';

interface EventData {
    id: string;
    title: string;
    description: string;
    date: string;
    time: string;
    location: string;
    tickets: string[];
}

const CreateEventPage = () => {
  const [eventData, setEventData] = useState<EventData>({
    id: '',
    title: '',
    description: '',
    date: '',
    time: '',
    location: '',
    tickets: []
  });

  const [error, setError] = useState<string | null>(null);

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target.value;
    setEventData((prevEventData) => ({
      ...prevEventData,
      [name]: value,
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const response = await axios.post('/api/events', { // Replace with your API endpoint
        title: eventData.title,
        description: eventData.description,
        date: eventData.date,
        time: eventData.time,
        location: eventData.location,
        tickets: eventData.tickets
      });

      // Handle successful creation (e.g., redirect to event page)
      console.log('Event created successfully:', response.data);
      setEventData({ id: response.data.id, title: '', description: '', date: '', time: '', location: '', tickets: [] });

    } catch (err: any) {
      console.error('Error creating event:', err);
      setError(err.message || 'An error occurred while creating the event.');
    }
  };


  return (
    <div>
      <h2>Create Event</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          name="title"
          value={eventData.title}
          onChange={handleInputChange}
        />

        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          name="description"
          value={eventData.description}
          onChange={handleInputChange}
        />

        <label htmlFor="date">Date:</label>
        <input
          type="date"
          id="date"
          name="date"
          value={eventData.date}
          onChange={handleInputChange}
        />

        <label htmlFor="time">Time:</label>
        <input
          type="time"
          id="time"
          name="time"
          value={eventData.time}
          onChange={handleInputChange}
        />

        <label htmlFor="location">Location:</label>
        <input
          type="text"
          id="location"
          name="location"
          value={eventData.location}
          onChange={handleInputChange}
        />

        <label htmlFor="tickets">Tickets:</label>
        <input
          type="text"
          id="tickets"
          name="tickets"
          value={eventData.tickets.join(', ')}
          onChange={handleInputChange}
        />

        <button type="submit">Create Event</button>
      </form>
      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default CreateEventPage;