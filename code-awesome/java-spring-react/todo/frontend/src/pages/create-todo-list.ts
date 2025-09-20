import React, { useState, useEffect } from 'react';
import { Navigate } from 'react-router-dom';

const CreateTodoListPage = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    if (!title || !description) {
      setError('Please enter both title and description.');
    } else {
      setError('');
    }
  }, [title, description]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    try {
      const response = await fetch('/api/todoLists', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ title, description }),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      // Redirect to the todo list page
      window.location.href = '/todoLists';
    } catch (error) {
      console.error('Error creating todo list:', error);
      setError('Failed to create todo list. Please try again.');
    }
  };

  return (
    <div>
      <h2>Create New Todo List</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          required
        />
        <br />
        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          rows="4"
          required
        />
        <br />
        <button type="submit">Create Todo List</button>
      </form>
      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default CreateTodoListPage;