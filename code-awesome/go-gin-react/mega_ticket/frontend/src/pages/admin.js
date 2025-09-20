// admin.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { validateInput, checkOWASP } from '../../utils/validation';
import axios from 'axios';

const Admin = () => {
  const [eventTitle, setEventTitle] = useState('');
  const [eventDescription, setEventDescription] = useState('');
  const [eventDate, setEventDate] = useState('');
  const [eventTime, setEventTime] = useState('');
  const [eventLocation, setEventLocation] = useState('');
  const [ticketPrice, setTicketPrice] = useState('');
  const [eventName, setEventName] = useState('Mega Concert');
  const [adminPassword, setAdminPassword] = useState('');
  const [isValid, setIsValid] = useState(false);
  const [errorMessages, setErrorMessages] = useState({});
  const [adminLoggedIn, setAdminLoggedIn] = useState(false);

  useEffect(() => {
    // Perform a check on the OWSAP list to make sure this is a secure admin page
    checkOWASP()
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setErrorMessages({});

    const validationResult = validateInput(
      eventTitle,
      eventDescription,
      eventDate,
      eventTime,
      eventLocation,
      ticketPrice
    );

    if (!validationResult) {
      setErrorMessages(validationResult);
      return;
    }

    try {
      const response = await axios.post('http://localhost:8080/admin/event', {
        eventName: eventName,
        eventTitle: eventTitle,
        eventDescription: eventDescription,
        eventDate: eventDate,
        eventTime: eventTime,
        eventLocation: eventLocation,
        ticketPrice: ticketPrice,
        adminPassword: adminPassword
      });

      if (response.data.message === 'Event created successfully') {
        alert('Event created successfully!');
        // Redirect to a dashboard or event listing page
      } else {
        alert('Error creating event.');
      }
    } catch (error) {
      console.error('Error creating event:', error);
      alert('An error occurred while creating the event.');
    }
  };

  return (
    <div className="admin-page">
      <h1 className="page-title">Admin - Create Event</h1>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="eventName">Event Name</label>
          <input
            type="text"
            id="eventName"
            value={eventName}
            onChange={(e) => setEventName(e.target.value)}
            className={errorMessages.eventName ? 'form-control error' : 'form-control'}
          />
        </div>
        <div className="form-group">
          <label htmlFor="eventTitle">Event Title</label>
          <input
            type="text"
            id="eventTitle"
            value={eventTitle}
            onChange={(e) => setEventTitle(e.target.value)}
            className={errorMessages.eventTitle ? 'form-control error' : 'form-control'}
          />
        </div>
        <div className="form-group">
          <label htmlFor="eventDescription">Event Description</label>
          <textarea
            id="eventDescription"
            value={eventDescription}
            onChange={(e) => setEventDescription(e.target.value)}
            className={errorMessages.eventDescription ? 'form-control error' : 'form-control'}
          />
        </div>
        <div className="form-group">
          <label htmlFor="eventDate">Event Date</label>
          <input
            type="date"
            id="eventDate"
            value={eventDate}
            onChange={(e) => setEventDate(e.target.value)}
            className={errorMessages.eventDate ? 'form-control error' : 'form-control'}
          />
        </div>
        <div className="form-group">
          <label htmlFor="eventTime">Event Time</label>
          <input
            type="time"
            id="eventTime"
            value={eventTime}
            onChange={(e) => setEventTime(e.target.value)}
            className={errorMessages.eventTime ? 'form-control error' : 'form-control'}
          />
        </div>
        <div className="form-group">
          <label htmlFor="eventLocation">Event Location</label>
          <input
            type="text"
            id="eventLocation"
            value={eventLocation}
            onChange={(e) => setEventLocation(e.target.value)}
            className={errorMessages.eventLocation ? 'form-control error' : 'form-control'}
          />
        </div>
        <div className="form-group">
          <label htmlFor="ticketPrice">Ticket Price</label>
          <input
            type="number"
            id="ticketPrice"
            value={ticketPrice}
            onChange={(e) => setTicketPrice(e.target.value)}
            className={errorMessages.ticketPrice ? 'form-control error' : 'form-control'}
          />
        </div>
        <div className="form-group">
          <label htmlFor="adminPassword">Admin Password</label>
          <input
            type="password"
            id="adminPassword"
            value={adminPassword}
            onChange={(e) => setAdminPassword(e.target.value)}
            className={errorMessages.adminPassword ? 'form-control error' : 'form-control'}
          />
        </div>
        <button type="submit" className="btn btn-primary">Create Event</button>
      </form>
    </div>
  );
};

export default Admin;