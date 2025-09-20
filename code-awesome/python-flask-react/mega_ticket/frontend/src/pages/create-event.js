import React from 'react';
import { useState } from 'react';
import axios from 'axios';

const CreateEvent = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [dateTime, setDateTime] = useState('');
  const [location, setLocation] = useState('');
  const [ticketPrice, setTicketPrice] = useState('');
  const [ticketQuantity, setTicketQuantity] = useState('');
  const [eventImage, setEventImage] = useState(''); // Allow event image upload

  const handleSubmit = async (e) => {
    e.preventDefault();

    const eventData = {
      title: title,
      description: description,
      dateTime: dateTime,
      location: location,
      ticketPrice: parseFloat(ticketPrice), // Ensure numeric value
      ticketQuantity: parseInt(ticketQuantity, 10), // Ensure integer value
      eventImage: eventImage,
    };

    try {
      const response = await axios.post('http://localhost:5000/events', {
        eventData: eventData,
      });

      console.log('Event created successfully:', response.data);
      alert('Event created successfully!');
      // Redirect to event page or home page
      window.location.href = '/events/' + response.data.eventId;
    } catch (error) {
      console.error('Error creating event:', error);
      alert('Error creating event. Please check the console for details.');
    }
  };

  const handleImageChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setEventImage(reader.result); // Set eventImage to the file's data URL
      };
      reader.readAsDataURL(file);
    }
  };

  return (
    <div>
      <h2>Create a New Event</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Event Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          required
        />

        <label htmlFor="description">Event Description:</label>
        <textarea
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          rows="5"
          required
        />

        <label htmlFor="dateTime">Date and Time:</label>
        <input
          type="datetime-local"
          id="dateTime"
          value={dateTime}
          onChange={(e) => setDateTime(e.target.value)}
          required
        />

        <label htmlFor="location">Location:</label>
        <input
          type="text"
          id="location"
          value={location}
          onChange={(e) => setLocation(e.target.value)}
          required
        />

        <label htmlFor="ticketPrice">Ticket Price:</label>
        <input
          type="number"
          id="ticketPrice"
          value={ticketPrice}
          onChange={(e) => setTicketPrice(e.target.value)}
          step="0.01"
          required
        />

        <label htmlFor="ticketQuantity">Ticket Quantity:</label>
        <input
          type="number"
          id="ticketQuantity"
          value={ticketQuantity}
          onChange={(e) => setTicketQuantity(e.target.value)}
          min="1"
          required
        />

        <label htmlFor="eventImage">Event Image (Optional):</label>
        <input
          type="file"
          id="eventImage"
          accept="image/*"
          onChange={handleImageChange}
        />

        <button type="submit">Create Event</button>
      </form>
    </div>
  );
};

export default CreateEvent;