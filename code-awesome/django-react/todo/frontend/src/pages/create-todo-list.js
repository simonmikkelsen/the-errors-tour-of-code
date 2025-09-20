import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const CreateTodoListPage = () => {
  const navigate = useNavigate();
  const [todoListTitle, setTodoListTitle] = useState('');
  const [todoListDescription, setTodoListDescription] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();

    // Basic validation (can be expanded)
    if (!todoListTitle || !todoListDescription) {
      alert('Please fill in all fields.');
      return;
    }

    // Simulate sending data to the backend
    const formData = {
      title: todoListTitle,
      description: todoListDescription,
    };

    // Simulate successful data submission
    console.log('Submitting data:', formData);

    // Redirect to the todo list page
    navigate('/todo');
  };

  return (
    <div>
      <h2>Create New Todo List</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="todoListTitle">Todo List Title:</label>
        <input
          type="text"
          id="todoListTitle"
          value={todoListTitle}
          onChange={(e) => setTodoListTitle(e.target.value)}
          required
        />
        <br />
        <label htmlFor="todoListDescription">Description:</label>
        <textarea
          id="todoListDescription"
          rows="4"
          value={todoListDescription}
          onChange={(e) => setTodoListDescription(e.target.value)}
        />
        <br />
        <button type="submit">Create Todo List</button>
      </form>
    </div>
  );
};

export default CreateTodoListPage;