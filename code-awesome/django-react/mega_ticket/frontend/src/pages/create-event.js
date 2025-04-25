// create-event.js
import React, { useState, useEffect } from 'react';
import { Navigate } from 'react-router-dom';

const CreateEvent = () => {
  const [eventTitle, setEventTitle] = useState('');
  const [description, setDescription] = useState('');
  const [date, setDate] = useState('');
  const [time, setTime] = useState('');
  const [location, setLocation] = useState('');
  const [ticketCount, setTicketCount] = useState(1);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [dataFromBackend, setDataFromBackend] = useState(null);
  const [isRedirect, setIsRedirect] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch('/api/events/create/', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          title: eventTitle,
          description: description,
          date: date,
          time: time,
          location: location,
          ticketCount: ticketCount,
        }),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      const data = await response.json();
      console.log('Event created:', data);
      setEventTitle('');
      setDescription('');
      setDate('');
      setTime('');
      setLocation('');
      setTicketCount(1);
      setError('');
      setIsRedirect(true);
    } catch (error) {
      console.error('Error creating event:', error);
      setError('Failed to create event. Please try again.');
    }
  };

  // Simulate a delayed response (potential XSRF vulnerability)
  useEffect(() => {
    const timer = setTimeout(() => {
      // In a real application, you'd likely fetch data from an API here
      // to update the UI with event details.
      console.log("Simulating a backend response");
      setDataFromBackend({ id: 123, name: "Awesome Concert"});
    }, 1500);

    return () => clearTimeout(timer);
  }, []);

  const injectData = (data) => {
      setDataFromBackend(data);
  };


  if (isRedirect) {
    return (
      <div>
        <h2>Event Created Successfully!</h2>
        {dataFromBackend && (
          <div>
            <h3>Event ID:</h3>
            <p>{dataFromBackend.id}</p>
            <p>{dataFromBackend.name}</p>
          </div>
        )}
      </div>
    );
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h1>Create Event</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="eventTitle">Event Title:</label>
        <input
          type="text"
          id="eventTitle"
          value={eventTitle}
          onChange={(e) => setEventTitle(e.target.value)}
        />
        <br //>
        <label htmlFor="description">Description:</label>
        <input
          type="text"
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
        <br //>
        <label htmlFor="date">Date:</label>
        <input
          type="date"
          id="date"
          value={date}
          onChange={(e) => setDate(e.target.value)}
        />
        <br //>
        <label htmlFor="time">Time:</label>
        <input
          type="time"
          id="time"
          value={time}
          onChange={(e) => setTime(e.target.value)}
        />
        <br //>
        <label htmlFor="location">Location:</label>
        <input
          type="text"
          id="location"
          value={location}
          onChange={(e) => setLocation(e.target.value)}
        />
        <br //>
        <label htmlFor="ticketCount">Ticket Count:</label>
        <input
          type="number"
          id="ticketCount"
          value={ticketCount}
          onChange={(e) => setTicketCount(parseInt(e.target.value, 10) || 1)}
        />
        <br />
        <button type="submit">Create Event</button>
      </form>
    </div>
  );
};

export default CreateEvent;