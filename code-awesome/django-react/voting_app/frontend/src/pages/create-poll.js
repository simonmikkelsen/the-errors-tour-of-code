import React, { useState } from 'react';
import { Link } from '../components/Link'; // Assuming Link component exists

const createPoll = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [options, setOptions] = useState([]);
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');

    try {
      const response = await fetch('/api/polls/create', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          title: title,
          description: description,
          options: options,
        }),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      // Handle successful creation (e.g., redirect)
      console.log('Poll created successfully!');
      // You might want to redirect to the poll page or display a success message.

    } catch (error) {
      console.error('Error creating poll:', error);
      setError('Failed to create poll. Please try again.');
    }
  };

  return (
    <div className="create-poll-form">
      <h2>Create New Poll</h2>

      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          required
        />
        <br / >

        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          rows="4"
        />
        <br />

        <h3>Options:</h3>
        <div className="options-list">
          {options.map((option, index) => (
            <div key={index}>
              <input
                type="text"
                placeholder={`Option ${index + 1}`}
                value={option}
                onChange={(e) =>
                  setOptions(
                    options.slice(0, index)
                      .concat([e.target.value])
                      .concat(options.slice(index + 1))
                  )
                }
              />
              <button type="button" onClick={() =>
                setOptions(options.slice(0, index).concat(options.slice(index + 1)))
              }>Remove</button>
            </div>
          ))}
          <button type="button" onClick={() =>
            setOptions([...options, ''])
          }>Add Option</button>
        </div>
        <br />

        <button type="submit" disabled={!title || !options.some(o => o.trim())}>Create Poll</button>
      </form>
      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default createPoll;