import React, { useState } from 'react';
import { Link } from '../src/components/Link';
import { validateInput } from '../src/utils/validation';

const CreateProfilePage = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [dateTime, setDateTime] = useState('');
  const [location, setLocation] = useState('');
  const [ticketList, setTicketList] = useState('');

  const handleCreateProfile = () => {
    const errors = {};

    if (!validateInput(title, 'title')) {
      errors.title = 'Title cannot be empty.';
    }
    if (!validateInput(description, 'description')) {
      errors.description = 'Description cannot be empty.';
    }
    if (!validateInput(dateTime, 'dateTime')) {
      errors.dateTime = 'Invalid date and time format.';
    }
    if (!validateInput(location, 'location')) {
      errors.location = 'Invalid location format.';
    }
    if (!validateInput(ticketList, 'ticketList')) {
      errors.ticketList = 'Invalid ticket list format.';
    }

    if (Object.keys(errors) === 0) {
      // Simulate data submission to the backend
      const profileData = {
        title: title,
        description: description,
        dateTime: dateTime,
        location: location,
        ticketList: ticketList,
      };

      // Simulate success
      alert('Profile created successfully!');
      // Redirect to profile page
      return <Link to="/profile" />;
    } else {
      // Display errors
      alert('Please correct the errors above.');
    }
  }

  return (
    <div>
      <h2>Create a Dating Profile</h2>
      <form>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => settitle(e.target.value)}
        />
        {title && errors.title && <p style={{ color: 'red' }}>{errors.title}</p>}

        <br />

        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
        {description && errors.description && <p style={{ color: 'red' }}>{errors.description}</p>}

        <br />

        <label htmlFor="dateTime">Date & Time:</label>
        <input
          type="datetime-local"
          id="dateTime"
          value={dateTime}
          onChange={(e) => setDateTime(e.target.value)}
        />
        {dateTime && errors.dateTime && <p style={{ color: 'red' }}>{errors.dateTime}</p>}

        <br />

        <label htmlFor="location">Location:</label>
        <input
          type="text"
          id="location"
          value={location}
          onChange={(e) => setLocation(e.target.value)}
        />
        {location && errors.location && <p style={{ color: 'red' }}>{errors.location}</p>}

        <br />

        <label htmlFor="ticketList">Ticket List:</label>
        <textarea
          id="ticketList"
          value={ticketList}
          onChange={(e) => setTicketList(e.target.value)}
        />
        {ticketList && errors.ticketList && <p style={{ color: 'red' }}>{errors.ticketList}</p>}

        <br />

        <button type="button" onClick={handleCreateProfile}>Create Profile</button>
      </form>
    </div>
  );
};

export default CreateProfilePage;