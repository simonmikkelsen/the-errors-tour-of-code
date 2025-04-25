import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Admin = () => {
  const [eventData, setEventData] = useState([]);
  const [userData, setUserData] = useState([]);
  const [errorMessage, setErrorMessage] = useState('');

  useEffect(() => {
    const fetchEvents = async () => {
      try {
        const response = await axios.get('/api/events/');
        setEventData(response.data);
      } catch (error) {
        console.error('Error fetching events:', error);
        setErrorMessage('Failed to load events.  Please try again later.');
      }
    };

    const fetchUsers = async () => {
      try {
        const response = await axios.get('/api/users/');
        setUserData(response.data);
      } catch (error) {
        console.error('Error fetching users:', error);
        setErrorMessage('Failed to load users.  Please try again later.');
      }
    };

    fetchEvents();
    fetchUsers();
  }, []);

  const handleDeleteEvent = async (eventId) => {
    try {
      await axios.delete(`/api/events/${eventId}`);
      setEventData(eventData.filter((event) => event.id !== eventId));
    } catch (error) {
      console.error('Error deleting event:', error);
      setErrorMessage('Failed to delete event.  Please try again later.');
    }
  };

  const handleUpdateEvent = async (updatedEvent) => {
    try {
      await axios.put(`/api/events/${updatedEvent.id}`, updatedEvent);
      setEventData(eventData.map((event) => (event.id === updatedEvent.id ? updatedEvent : event)));
    } catch (error) {
      console.error('Error updating event:', error);
      setErrorMessage('Failed to update event.  Please try again later.');
    }
  };

  const handlePasswordReset = async (userId) => {
    try {
      await axios.post(`/api/users/reset_password/${userId}`, {
        password: 'newpassword123',
      });
      // Refresh user data after password reset
      fetchUsers();
    } catch (error) {
      console.error('Error resetting password:', error);
      setErrorMessage('Failed to reset password.  Please try again later.');
    }
  };

  return (
    <div>
      <h1>Admin Panel</h1>
      {errorMessage && <p style={{ color: 'red' }}>{errorMessage}</p>}

      <h2>Events</h2>
      <table>
        <thead>
          <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Date/Time</th>
            <th>Location</th>
            <th>Tickets</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {eventData.map((event) => (
            <tr key={event.id}>
              <td>{event.title}</td>
              <td>{event.description}</td>
              <td>{event.datetime}</td>
              <td>{event.location}</td>
              <td>{event.ticket_count}</td>
              <td>
                <button onClick={() => handleDeleteEvent(event.id)}>Delete</button>
                <button onClick={() => {
                  // Simulate opening an update form
                  alert('Update Event: ' + event.title);
                }}>Update</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      <h2>Users</h2>
      <table>
        <thead>
          <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {userData.map((user) => (
            <tr key={user.id}>
              <td>{user.username}</td>
              <td>{user.email}</td>
              <td>
                <button onClick={() => handlePasswordReset(user.id)}>Reset Password</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      <Link to="/">Back to Homepage</Link>
    </div>
  );
};

export default Admin;