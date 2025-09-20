import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const Admin = () => {
  const navigate = useNavigate();
  const [pollTitle, setPollTitle] = useState('');
  const [pollDescription, setPollDescription] = useState('');
  const [pollOptions, setPollOptions] = useState('');
  const [errors, setError] = useState([]);

  useEffect(() => {
    if (errors.length > 0) {
      console.error('Frontend Errors:', errors);
    }
  }, [errors]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('pollTitle', pollTitle);
    formData.append('pollDescription', pollDescription);
    formData.append('pollOptions', pollOptions);

    try {
      const response = await fetch('/api/polls', {
        method: 'POST',
        body: formData,
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      // Handle successful response (e.g., redirect)
      console.log('Poll created successfully!');
      navigate('/poll-list');
    } catch (error) {
      console.error('Error creating poll:', error);
      setError([error.message]);
    }
  };

  return (
    <div>
      <h2>Admin Panel</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="pollTitle">Poll Title:</label>
        <input
          type="text"
          id="pollTitle"
          value={pollTitle}
          onChange={(e) => setPollTitle(e.target.value)}
        />
        <br />
        <label htmlFor="pollDescription">Poll Description:</label>
        <input
          type="text"
          id="pollDescription"
          value={pollDescription}
          onChange={(e) => setPollDescription(e.target.value)}
        />
        <br />
        <label htmlFor="pollOptions">Poll Options:</label>
        <input
          type="text"
          id="pollOptions"
          value={pollOptions}
          onChange={(e) => setPollOptions(e.target.value)}
        />
        <br />
        <button type="submit">Create Poll</button>
      </form>
      {errors.length > 0 && (
        <ul>
          {errors.map((error, index) => (
            <li key={index}>{error}</li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default Admin;