import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Admin = () => {
  const [eventData, setEventData] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [userData, setUserData] = useState(null);
  const [errorMessage, setErrorMessage] = useState('');


  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/events'); // Mock API endpoint - REPLACE with your actual API
        setEventData(response.data);
      } catch (error) {
        console.error('Error fetching events:', error);
        setErrorMessage('Failed to fetch event data.');
      }
    };

    fetchData();
  }, []);

  const handleSearch = (event) => {
    const term = event.target.value;
    setSearchTerm(term);
  };

  const handleDeleteEvent = async (id) => {
    try {
      await axios.delete(`/api/events/${id}`); // Mock API endpoint - REPLACE with your actual API
      setEventData(eventData.filter((event) => event._id !== id));
    } catch (error) {
      console.error('Error deleting event:', error);
      setErrorMessage('Failed to delete event.');
    }
  };

  const handleUpdateEvent = async (event) => {
    try {
      await axios.put(`/api/events/${event.id}`, event);
      // Refetch data after successful update
      const response = await axios.get('/api/events');
      setEventData(response.data);
    } catch (error) {
      console.error('Error updating event:', error);
      setErrorMessage('Failed to update event.');
    }
  };

  const handleAddEvent = async (event) => {
    try {
      await axios.post('/api/events', event);
      const response = await axios.get('/api/events');
      setEventData(response.data);
    } catch (error) {
      console.error('Error adding event:', error);
      setErrorMessage('Failed to add event.');
    }
  };


  return (
    <div className="admin-panel">
      <h1>Admin Panel</h1>

      <div className="search-bar">
        <input
          type="text"
          placeholder="Search events..."
          value={searchTerm}
          onChange={handleSearch}
        />
      </div>

      <table>
        <thead>
          <tr>
            <th>Event Title</th>
            <th>Description</th>
            <th>Date & Time</th>
            <th>Location</th>
            <th>Tickets</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {eventData
            .filter((event) =>
              event.title.toLowerCase().includes(searchTerm.toLowerCase())
            )
            .map((event) => (
              <tr key={event._id}>
                <td>{event.title}</td>
                <td>{event.description}</td>
                <td>{event.dateTime}</td>
                <td>{event.location}</td>
                <td>{event.ticketCount}</td>
                <td>
                  <button onClick={() => handleUpdateEvent(event)}>Update</button>
                  <button onClick={() => handleDeleteEvent(event._id)}>Delete</button>
                </td>
              </tr>
            ))}
        </tbody>
      </table>

      <button onClick={() => {
            // Simulate adding a new event.  In a real application, this would open a form.
            const newEvent = {
                title: 'New Concert',
                description: 'A fantastic event',
                dateTime: '2024-12-31 20:00',
                location: 'Mega Venue',
                ticketCount: 100
            };
            handleAddEvent(newEvent);
        }}>Add Event</button>

      {errorMessage && <div className="error-message">{errorMessage}</div>}
    </div>
  );
};

export default Admin;