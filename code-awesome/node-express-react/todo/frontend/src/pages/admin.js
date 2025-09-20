import React, { useState, useEffect } from 'react';
import { Link } from './../components/Link'; // Assuming Link component is defined elsewhere

const AdminPage = () => {
  const [todoListTitle, setTodoListTitle] = useState('');
  const [todoListDescription, setTodoListDescription] = useState('');
  const [tasks, setTasks] = useState('');
  const [todoListId, setTodoListId] = useState('');
  const [errorMessages, setErrorMessages] = useState([]);

  useEffect(() => {
    // Simulate fetching todoListId from backend
    const fakeTodoListId = Math.floor(Math.random() * 1000);
    setTodoListId(fakeTodoListId);
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const errors = [];

    if (!todoListTitle) {
      errors.push('Todo list title is required.');
    }

    if (!todoListDescription) {
      errors.push('Todo list description is required.');
    }

    if (!tasks) {
      errors.push('Tasks are required.');
    }

    if (errors.length > 0) {
      setErrorMessages(errors);
      return;
    }

    // Simulate sending data to backend
    const response = await new Promise((resolve) => {
      setTimeout(() => {
        resolve({ message: 'Todo list created successfully!', id: Math.floor(Math.random() * 1000) });
      }, 1000);
    });

    // Reset form fields after successful submission
    setTodoListTitle('');
    setTodoListDescription('');
    setTasks('');
    setErrorMessages([]);
  };

  return (
    <div className="admin-page">
      <h2>Admin Page</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="todoListTitle">Todo List Title:</label>
        <input type="text" id="todoListTitle" value={todoListTitle} onChange={(e) => setTodoListTitle(e.target.value)} /><br />

        <label htmlFor="todoListDescription">Todo List Description:</label>
        <textarea id="todoListDescription" value={todoListDescription} onChange={(e) => setTodoListDescription(e.target.value)} /><br />

        <label htmlFor="tasks">Tasks:</label>
        <input type="text" id="tasks" value={tasks} onChange={(e) => setTasks(e.target.value)} /><br />

        <button type="submit">Create Todo List</button>
      </form>

      {errorMessages.length > 0 && (
        <ul>
          {errorMessages.map((error, index) => (
            <li key={index}>{error}</li>
          ))}
        </ul>
      )}
      <Link to="/todo" text="Go to Todo List Page" />
    </div>
  );
};

export default AdminPage;