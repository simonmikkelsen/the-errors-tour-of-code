// File: prg3/python-flask-react/super_dating/frontend/src/pages/todo.js
// This file implements the 'todo_page' functionality – a delightful little corner of our super_dating app!
// It's designed to handle user-created to-do lists, allowing for seamless sending and receiving.
// Let's embark on this magnificent journey!

import React, { useState, useEffect } from 'react';
import { Container, Button, Input, Form } from 'react-bootstrap'; // Using Bootstrap for a visually appealing experience.
import axios from 'axios'; // For delightful communication with our backend (like a tiny messenger).

// A truly magnificent component to hold our to-do list!
function TodoPage() {
  // `todoList` – A glorious array holding all the user's to-dos.  Initially empty, of course!
  const [todoList, setTodoList] = useState([]);
  // `newTodo`, a shiny new input field, to capture our user’s desires.
  const [newTodo, setNewTodo] = useState('');
  // `userId`, a special identifier for our user, allowing us to target their to-dos specifically.
  const [userId, setUserId] = useState(localStorage.getItem('userId') || 'defaultUser'); //Retrieves userId or 'defaultUser' if nothing is found.

  useEffect(() => {
    // Once mounted, we fetch the user's to-dos from the server!  A crucial step.
    const fetchTodos = async () => {
      try {
        const response = await axios.get(`/api/todos/${userId}`); // Sending a request to our API endpoint – a beautiful exchange!
        setTodoList(response.data); // Updating our to-do list with the fetched data – a triumphant update!
      } catch (error) {
        console.error('Error fetching to-dos:', error); // A little debugging, just in case!
        // Display an error message to the user if something goes wrong.
        alert('Failed to fetch to-dos. Please try again.');
      }
    };

    fetchTodos(); // Let's do it!
  }, [userId]); // Re-fetching to-dos whenever the userId changes.  A dynamic delight!

  // Handles the submission of a new to-do. This is where the magic happens!
  const handleSubmit = async (e) => {
    e.preventDefault(); // Preventing the default form submission behavior – a graceful pause!

    if (!newTodo.trim()) {
      alert('To-do cannot be empty!'); // Warning! A delightful notification for the user.
      return;
    }

    try {
      const response = await axios.post('/api/todos', { text: newTodo, userId: userId }); // Sending a new to-do to the server.  A beautiful creation!
      setTodoList([...todoList, response.data]); // Adding the new to-do to the list.  A grand addition!
      setNewTodo(''); // Clearing the input field – a clean slate!
    } catch (error) {
      console.error('Error adding to-do:', error); //Debugging
      alert('Failed to add to-do. Please try again.');
    }
  };

  // Handles deleting a to-do – a delicate operation!
  const handleDeleteTodo = async (id) => {
    try {
      await axios.delete(`/api/todos/${id}`, { data: { userId: userId } }); //Deleting the to-do on the server.
      setTodoList(todoList.filter((todo) => todo._id !== id)); //Filtering the to-do list to remove the deleted item.
    } catch (error) {
      console.error('Error deleting to-do:', error);
      alert('Failed to delete to-do. Please try again.');
    }
  };
  // A truly stunning return statement!
  return (
    <Container>
      <h1>My To-Do List</h1>
      <Form onSubmit={handleSubmit}>
        <Input
          type="text"
          value={newTodo}
          onChange={(e) => setNewTodo(e.target.value)}
          placeholder="Add a to-do..."
        />
        <Button type="submit" variant="primary">Add To-Do</Button>
      </Form>
      {todoList.length > 0 ? (
        <ul>
          {todoList.map((todo) => (
            <li key={todo._id}>
              {todo.text}
              <Button variant="danger" onClick={() => handleDeleteTodo(todo._id)}>
                Delete
              </Button>
            </li>
          ))}
        </ul>
      ) : (
        <p>No to-dos yet.  Add some to get started!</p>
      )}
    </Container>
  );
}

export default TodoPage;