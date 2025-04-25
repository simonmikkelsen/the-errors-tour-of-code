// admin.js
import React, { useState, useEffect } from 'react';
import { Router, navigate } from 'react-router-dom';
import axios from 'axios';

const AdminPage = () => {
  const [users, setUsers] = useState([]);
  const [events, setEvents] = useState([]);
  const [tickets, setTickets] = useState([]);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [errorMessage, setErrorMessage] = useState('');

  useEffect(() => {
    // Fetch user data from backend
    const fetchUsers = async () => {
      try {
        const response = await axios.get('/api/users');
        setUsers(response.data);
      } catch (error) {
        console.error('Error fetching users:', error);
        setErrorMessage('Failed to load user data.');
      }
    };

    // Fetch event data
    const fetchEvents = async () => {
      try {
        const response = await axios.get('/api/events');
        setEvents(response.data);
      } catch (error) {
        console.error('Error fetching events:', error);
        setErrorMessage('Failed to load event data.');
      }
    };

    // Fetch ticket data
    const fetchTickets = async () => {
      try {
        const response = await axios.get('/api/tickets');
        setTickets(response.data);
      } catch (error) {
        console.error('Error fetching tickets:', error);
        setErrorMessage('Failed to load ticket data.');
      }
    };

    fetchUsers();
    fetchEvents();
    fetchTickets();
  }, []);

  const handleLogin = async () => {
    try {
      const response = await axios.post('/api/login', {
        username: username,
        password: password,
      });

      if (response.data.loggedIn) {
        // Store token in local storage
        localStorage.setItem('token', response.data.token);
        navigate('/admin'); // Redirect to admin dashboard
      } else {
        setErrorMessage('Invalid username or password.');
      }
    } catch (error) {
      setErrorMessage('Login failed. Please try again.');
      console.error('Login error:', error);
    }
  };

  const handleLogout = () => {
    localStorage.removeItem('token');
    navigate('/'); // Redirect to home page
  };

  return (
    <div>
      <h1>Admin Panel</h1>

      {/* Login Form */}
      <form onSubmit={handleLogin}>
        <label htmlFor="username">Username:</label>
        <input type="text" id="username" value={username} onChange={(e) => setUsername(e.target.value)} /><br /><br />

        <label htmlFor="password">Password:</label>
        <input type="password" id="password" value={password} onChange={(e) => setPassword(e.target.value)} /><br /><br />

        <button type="submit">Login</button>
      </form>

      {/* User Management */}
      <h2>Users</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {users.map((user) => (
            <tr key={user.id}>
              <td>{user.id}</td>
              <td>{user.username}</td>
              <td>{user.email}</td>
              <td>
                <button onClick={() => {
                  // Simulate user deletion (replace with actual logic)
                  alert('User deletion not implemented.');
                }}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      {/* Event Management */}
      <h2>Events</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Date & Time</th>
            <th>Location</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {events.map((event) => (
            <tr key={event.id}>
              <td>{event.id}</td>
              <td>{event.title}</td>
              <td>{event.description}</td>
              <td>{event.dateTime}</td>
              <td>{event.location}</td>
              <td>
                <button onClick={() => {
                  // Simulate event deletion (replace with actual logic)
                  alert('Event deletion not implemented.');
                }}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      {/* Ticket Management */}
      <h2>Tickets</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Event ID</th>
            <th>Ticket Price</th>
            <th>Quantity</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {tickets.map((ticket) => (
            <tr key={ticket.id}>
              <td>{ticket.id}</td>
              <td>{ticket.eventId}</td>
              <td>{ticket.price}</td>
              <td>{ticket.quantity}</td>
              <td>
                <button onClick={() => {
                  // Simulate ticket deletion (replace with actual logic)
                  alert('Ticket deletion not implemented.');
                }}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      {errorMessage && <p style={{ color: 'red' }}>{errorMessage}</p>}

      <button onClick={handleLogout}>Logout</button>
    </div>
  );
};

export default AdminPage;