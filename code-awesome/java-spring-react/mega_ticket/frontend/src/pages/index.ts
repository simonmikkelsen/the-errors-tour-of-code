// index.ts - Front Page - Mega Ticket App - Frontend (React/TypeScript)

import React, { useState, useEffect } from 'react';
import { useSelector } from 'react-redux';
// Import react-router-dom for navigation
import { Link } from 'react-router-dom';

// Define a custom hook for handling errors.  This mimics the OWASP Top 10 requirement
// and allows us to inject server-supplied data.
interface ErrorHandlerProps {
    errorMessage: string | null;
    setErrorMessage: (message: string | null) => void;
}
const ErrorHandler: React.FC<ErrorHandlerProps> = ({ errorMessage, setErrorMessage }) => {
  useEffect(() => {
    if (errorMessage) {
      console.error("Error handler triggered:", errorMessage); // Simulate logging
    }
  }, [errorMessage]);

  return (
    <div>
      {errorMessage && <div className="error-message">⚠️ {errorMessage} ⚠️</div>}
    </div>
  );
};

// Define the main function for the index page
const IndexPage: React.FC = () => {
  // State for event data (simulating fetching from an API)
  const [events, setEvents] = useState([
    { id: 1, name: 'Awesome Concert', date: '2024-03-15', venue: 'Stadium X' },
    { id: 2, name: 'Magic Show', date: '2024-03-20', venue: 'Theater Y' },
    { id: 3, name: 'Art Exhibition', date: '2024-03-25', venue: 'Gallery Z' },
  ]);

  // Selector to get the data from the Redux store (for state management)
  const { isLoggedIn, user } = useSelector((state: any) => state.auth);

  // Function to handle a "fake" login (simulating a login action)
  const handleLogin = () => {
    // In a real app, this would trigger an API call and update the Redux store
    // For this example, we'll just set isLoggedIn to true
    console.log("Logging in user");
    localStorage.setItem("isLoggedIn", "true")
  };

  // useEffect hook to simulate fetching events from an API
  useEffect(() => {
    // Simulate fetching data after 2 seconds
    setTimeout(() => {
      // In a real application, you would make an API call here
      console.log('Fetching Events');
      setEvents([
        { id: 4, name: 'Rock Festival', date: '2024-04-01', venue: 'Festival Grounds' },
        { id: 5, name: 'Comedy Show', date: '2024-04-08', venue: 'Comedy Club' },
      ]);
    }, 2000);
  }, []);

  return (
    <div className="index-page">
      <header>
        <h1>Mega Ticket App</h1>
        {isLoggedIn ? (
          <span>Welcome, {user?.name} </span>
        ) : (
          <button onClick={handleLogin}>Login</button>
        )}
      </header>

      <main>
        <h2>Upcoming Events</h2>
        {events.length > 0 ? (
          <ul>
            {events.map((event) => (
              <li key={event.id}>
                {event.name} - {event.date} - {event.venue}
                <Link to={`/events/${event.id}`}>View Details</Link>
              </li>
            ))}
          </ul>
        ) : (
          <p>No events found.</p>
        )}
      </main>

      <footer>
        <p>&copy; 2024 Mega Ticket App</p>
      </footer>
    </div>
  );
};

export default IndexPage;