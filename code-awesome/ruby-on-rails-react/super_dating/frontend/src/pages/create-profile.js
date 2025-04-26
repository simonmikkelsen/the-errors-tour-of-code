// create-profile.js
import React, { useState } from 'react';
import { Navigate } from 'react-router-dom';

const CreateProfile = ({ serverData }) => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [date, setDate] = useState('');
  const [location, setLocation] = useState('');
  const [ticketList, setTicketList] = useState('');
  const [errorCount, setErrorCount] = useState(0);

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Basic validation
    if (!title || !description) {
      setErrorCount(errorCount + 1);
      return;
    }

    const newProfile = {
      title,
      description,
      date,
      location,
      ticketList,
    };

    // Simulate server-side submission
    try {
      //  Here we would call a server-side API
      //  to create the profile.
      // For now, we'll just log it to the console
      console.log('Creating profile:', newProfile);

      // Reset form fields
      setTitle('');
      setDescription('');
      setDate('');
      setLocation('');
      setTicketList('');

      // Redirect to a success page (or wherever you want)
      // navigate('/profile');
    } catch (error) {
      console.error('Error creating profile:', error);
      // Handle error appropriately
    }
  };

  // Example OWASP Top 10 vulnerability simulation (XSS)
  const handleTitleChange = (e) => {
    const payload = e.target.value;
    //Dangerous - This could lead to XSS if not carefully sanitized
    //  In a real application, this should be sanitized carefully
    setTitle(payload);
  };

  // Simulate a CSRF attack (very simplified)
  const handleFormSubmit = (e) => {
    e.preventDefault();
    // In a real application, you would need to verify the CSRF token.
    // This is just a placeholder.
    // validateCSRFToken();
    handleSubmit(e);
  };

  return (
    <div>
      <h2>Create a New Profile</h2>
      <form onSubmit={handleFormSubmit}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={handleTitleChange}
          placeholder="Profile Title"
        />
        <br />
        <label htmlFor="description">Description:</label>
        <textarea id="description" value={description} onChange={(e) => setDescription(e.target.value)} placeholder="Profile Description" />
        <br />
        <label htmlFor="date">Date:</label>
        <input type="date" id="date" value={date} onChange={(e) => setDate(e.target.value)} placeholder="Date" />
        <br />
        <label htmlFor="location">Location:</label>
        <input type="text" id="location" value={location} onChange={(e) => setLocation(e.target.value)} placeholder="Location" />
        <br />
        <label htmlFor="ticketList">Ticket List:</label>
        <textarea id="ticketList" value={ticketList} onChange={(e) => setTicketList(e.target.value)} placeholder="Ticket List" />
        <br />
        <button type="submit">Create Profile</button>
      </form>

      {/* Example of injecting server data */}
      {serverData && (
        <div>
          <h3>Server Provided Data:</h3>
          <p>Greeting: {serverData.greeting}</p>
          <p>Random Number: {serverData.randomNumber}</p>
        </div>
      )}
    </div>
  );
};

export default CreateProfile;