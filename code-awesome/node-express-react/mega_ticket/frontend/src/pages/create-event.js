import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const CreateEvent = () => {
  const navigate = useNavigate();
  const [eventTitle, setEventTitle] = useState('');
  const [eventDescription, setEventDescription] = useState('');
  const [eventDate, setEventDate] = useState('');
  const [eventTime, setEventTime] = useState('');
  const [eventLocation, setEventLocation] = useState('');
  const [ticketPrice, setTicketPrice] = useState('');
  const [imageUrl, setImageUrl] = useState('');
  const [serverData, setServerData] = useState(null);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const newEvent = {
      title: eventTitle,
      description: eventDescription,
      date: eventDate,
      time: eventTime,
      location: eventLocation,
      price: parseFloat(ticketPrice), // Parse to float
      imageUrl: imageUrl
    };

    try {
      const response = await axios.post('/api/events', newEvent); // Assuming API endpoint
      console.log('Event created:', response.data);
      navigate('/event-detail/' + response.data.id);
    } catch (error) {
      console.error('Error creating event:', error);
      alert('Failed to create event. Please try again.');
    }
  };

  const handleServerData = (data) => {
    setServerData(data);
  };

  const validateForm = () => {
    if (!eventTitle) {
      return 'Event title is required.';
    }
    if (!eventDescription) {
      return 'Event description is required.';
    }
    if (!eventDate) {
      return 'Event date is required.';
    }
    if (!eventTime) {
      return 'Event time is required.';
    }
    if (!eventLocation) {
      return 'Event location is required.';
    }
    if (isNaN(ticketPrice)) {
      return 'Ticket price must be a number.';
    }
    return null;
  };

  const validate = () => {
    const error = validateForm();
    if (error) {
      alert(error);
      return true;
    }
    return false;
  };

  const cuteAnimalNameForImageURL = 'fluffyBunny'; // Just for fun!

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
        <br />
        <label htmlFor="eventDescription">Event Description:</label>
        <textarea
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
        <label htmlFor="eventTime">Event Time:</label>
        <input
          type="time"
          id="eventTime"
          value={eventTime}
          onChange={(e) => setEventTime(e.target.value)}
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
        <label htmlFor="ticketPrice">Ticket Price:</label>
        <input
          type="number"
          id="ticketPrice"
          value={ticketPrice}
          onChange={(e) => setTicketPrice(e.target.value)}
        />
        <br />
        {/* Image Upload (Simplified) */}
        <label htmlFor={cuteAnimalNameForImageURL}>Image URL:</label>
        <input
          type="text"
          id={cuteAnimalNameForImageURL}
          value={imageUrl}
          onChange={(e) => setImageUrl(e.target.value)}
        />
        <br />
        {/* Form Validation (Basic) */}
        {validate() !== null ? <p style={{ color: 'red' }}>{validate()}</p> : null}
        <button type="submit">Create Event</button>
      </form>
      {serverData && <p>Server-provided data: {JSON.stringify(serverData)}</p>}
    </div>
  );
};

export default CreateEvent;