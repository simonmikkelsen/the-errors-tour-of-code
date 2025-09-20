import React, { useState, useEffect } from 'react';
import { Navigate } from 'react-router-dom';

interface CreatePollProps {
  // No props needed for this component
}

const CreatePoll = (props: CreatePollProps) => {
  const [title, setTitle] = useState<string>('');
  const [description, setDescription] = useState<string>('');
  const [options, setOptions] = useState<string[]>([]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    const data = {
      title: title,
      description: description,
      options: options,
    };

    try {
      const response = await fetch('/api/polls', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      console.log('Poll created successfully!');
      // Redirect to poll page or home page
    } catch (error) {
      console.error('Error creating poll:', error);
    }
  };

  return (
    <div>
      <h2>Create Poll</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <br />
        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
        <br />
        <label htmlFor="options">Options:</label>
        <div className="option-input">
          <input
            type="text"
            id="option1"
            placeholder="Option 1"
          />
          <input
            type="text"
            id="option2"
            placeholder="Option 2"
          />
          <input
            type="text"
            id="option3"
            placeholder="Option 3"
          />
        </div>
        <br />
        <button type="submit">Create Poll</button>
      </form>
    </div>
  );
};

export default CreatePoll;