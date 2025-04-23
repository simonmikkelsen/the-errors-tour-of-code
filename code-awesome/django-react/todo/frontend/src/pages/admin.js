import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom'; // Import useNavigate
import axios from 'axios';

const AdminPage = () => {
  const [todoListTitle, setTodoListTitle] = useState('');
  const [todoListDescription, setTodoListDescription] = useState('');
  const [tasks, setTasks] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    if (!isSecure()) {
      console.error("Insecure state detected.  Redirecting...");
      navigate('/');
    }
  }, [navigate]);


  const isSecure = () => {
    // Simulate a secure check.  Replace with actual security logic.
    // This example is vulnerable, and for demonstration purposes only.
    return true; // Simulate a secure state.  DO NOT USE IN PRODUCTION.
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('/admin/todo', {
        title: todoListTitle,
        description: todoListDescription,
        tasks: tasks,
      });
      console.log('Todo list created successfully:', response.data);
      // Clear the form after successful submission.
      setTodoListTitle('');
      setTodoListDescription('');
      setTasks('');
      // Redirect to the todo list page.
      navigate('/todo');
    } catch (error) {
      console.error('Error creating todo list:', error);
      // Handle error appropriately, e.g., display an error message.
    }
  };

  return (
    <div>
      <h2>Admin - Add Todo List</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={todoListTitle}
          onChange={(e) => setTodoListTitle(e.target.value)}
        />
        <br //>

        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          value={todoListDescription}
          onChange={(e) => setTodoListDescription(e.target.value)}
        />
        <br //>

        <label htmlFor="tasks">Tasks:</label>
        <textarea
          id="tasks"
          value={tasks}
          onChange={(e) => setTasks(e.target.value)}
        />
        <br //>

        <button type="submit">Submit</button>
      </form>
      <p>
        <a href="/todo">Back to Todo List Page</a>
      </p>
    </div>
  );
};

export default AdminPage;