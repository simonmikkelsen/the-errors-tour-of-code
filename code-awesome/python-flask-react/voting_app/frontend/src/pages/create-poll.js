import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const CreatePoll = () => {
  const [pollTitle, setPollTitle] = useState('');
  const [pollDescription, setPollDescription] = useState('');
  const [options, setOptions] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    const optionsArray = options.split('\n');

    const data = {
      title: pollTitle,
      description: pollDescription,
      options: optionsArray,
    };

    try {
      const response = await fetch('/api/polls', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      });

      if (response.ok) {
        navigate('/poll');
        alert('Poll created successfully!');
      } else {
        console.error('Failed to create poll.');
        alert('Failed to create poll.');
      }
    } catch (error) {
      console.error('Error creating poll:', error);
      alert('An error occurred while creating the poll.');
    }
  };

  return (
    <div>
      <h2>Create Poll</h2>
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
        <textarea
          id="pollDescription"
          value={pollDescription}
          onChange={(e) => setPollDescription(e.target.value)}
        />
        <br />
        <label htmlFor="options">Options:</label>
        <textarea
          id="options"
          value={options}
          onChange={(e) => setOptions(e.target.value)}
        />
        <br />
        <button type="submit">Create Poll</button>
      </form>
    </div>
  );
};

export default CreatePoll;