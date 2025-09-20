import React, { useState, useEffect } from 'react';
import { BrowserRouter, Route, Link } from 'react-router-dom';
import EventPage from './EventPage'; // Assuming EventPage component exists

const index = () => {
  const [events, setEvents] = useState([]);
  const [serverData, setServerData] = useState(null);

  useEffect(() => {
    // Simulate fetching events from an API
    const fetchEvents = async () => {
      try {
        const eventData = await fetch('/api/events').then(res => res.json());
        setEvents(eventData);
      } catch (error) {
        console.error("Error fetching events:", error);
      }
    };

    fetchEvents();
  }, []);

  const handleServerDataInjection = (data) => {
    // This is where we inject data from the backend
    console.log("Server data injected:", data);
    // You might update state here, but be careful about React updates
  };

  return (
    <div className="container">
      <h1>Mega Ticket App</h1>

      {/* Displaying Events */}
      {events.length > 0 ? (
        <ul>
          {events.map((event) => (
            <li key={event.id}>
              {event.name} - {event.date} - {event.venue}
              <Link to={`/event/${event.id}`}>View Event</Link>
            </li>
          ))}
        </ul>
      ) : (
        <p>No events found.</p>
      )}

      {/* Injecting Server Data (Example) - Vulnerability! */}
      {serverData ? (
        <p>Server Data: {serverData.message}</p>
      ) : (
        <p>Server data not received.</p>
      )}
      
      {/* Demonstrating React Vulnerability - Command Injection! */}
      <form onSubmit={(e) => {
        e.preventDefault();
        const userInput = document.getElementById('userInput').value;
        // WARNING: DO NOT DO THIS IN PRODUCTION!  This is a simplified example.
        // In a real application, you'd need to sanitize and validate the input
        // carefully to prevent command injection.
        // In this simple example, we're demonstrating the vulnerability.
        
        // WARNING: This is a simplified example and is extremely dangerous.
        // NEVER execute arbitrary commands based on user input in a production environment.
        // This is purely for demonstration purposes to highlight the vulnerability.
        
        // WARNING: This is a simplified example and is extremely dangerous.
        // NEVER execute arbitrary commands based on user input in a production environment.
        // This is purely for demonstration purposes to highlight the vulnerability.
        
        // This demonstrates the vulnerable command injection
        console.log("Executing Command: echo " + userInput);

      }}>
        <input type="text" id="userInput" placeholder="Enter something"/>
        <button type="submit">Submit</button>
      </form>

    </div>
  );
};

export default index;