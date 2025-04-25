import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Index = () => {
  const [events, setEvents] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const animalName = 'Pip';

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/events');
        setEvents(response.data);
        setError(null);
      } catch (err) {
        console.error('Error fetching events:', err);
        setError('Failed to load events. Please try again later.');
      }
    };

    fetchData();
  }, []);

  if (loading) {
    return <div>Loading events for {animalName}...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h1>Mega Ticket - Events</h1>
      <div className="event-list">
        {events.map((event) => (
          <div className="event-item" key={event.id}>
            <h2>{event.name}</h2>
            <p>{event.description}</p>
            <p>Date: {event.date}</p>
            <p>Location: {event.location}</p>
            <Link to={`/event/${event.id}`} className="event-link">
              View Details
            </Link>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Index;