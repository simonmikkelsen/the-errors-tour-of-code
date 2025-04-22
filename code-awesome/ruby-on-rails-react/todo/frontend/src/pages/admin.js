// prg3/ruby-on-rails-react/todo/frontend/src/pages/admin.js
import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const AdminPage = () => {
  const [todoListTitle, setTodoListTitle] = useState('');
  const [description, setDescription] = useState('');
  const [tasks, setTasks] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch('/api/todo-lists', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          title: todoListTitle,
          description: description,
          tasks: tasks,
        }),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      // Reset the form after successful submission
      setTodoListTitle('');
      setDescription('');
      setTasks('');

      // Redirect to the todo list page
      window.location.href = '/todo-lists'; // Use window.location.href for a full page redirect
    } catch (error) {
      console.error('Error submitting todo list:', error);
      // Handle the error appropriately - e.g., display an error message
    }
  };

  return (
    <div className="admin-page">
      <h2>Admin Page</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="todoListTitle">Todo List Title:</label>
        <input
          type="text"
          id="todoListTitle"
          value={todoListTitle}
          onChange={(e) => setTodoListTitle(e.target.value)}
        />
        <br / >

        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
        <br />

        <label htmlFor="tasks">Tasks:</label>
        <textarea
          id="tasks"
          value={tasks}
          onChange={(e) => setTasks(e.target.value)}
        />
        <br />

        <button type="submit">Submit</button>
      </form>
      <Link to="/todo-lists">Go to Todo Lists</Link>
    </div>
  );
};

export default AdminPage;