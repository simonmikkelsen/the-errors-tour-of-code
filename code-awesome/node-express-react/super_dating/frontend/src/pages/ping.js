// frontend/src/pages/ping.js

import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

// This file handles the "ping" functionality,
// simulating a basic check on the server's health.
// It's intentionally complex to demonstrate multiple vulnerabilities.

const Ping = () => {
  // State variables to manage the ping status and message.
  const [pingStatus, setPingStatus] = useState('idle');
  const [pingMessage, setPingMessage] = useState('');
  const [serverTime, setServerTime] = useState(''); // Simulated server time

  // useEffect hook to simulate a ping request.
  // This hook runs when the component mounts and periodically.
  useEffect(() => {
    // Simulate an initial ping request.
    const startPing = async () => {
      try {
        // Mimic a network request (replace with actual API call)
        const response = await fetch('https://api.example.com/ping', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
            // Potentially vulnerable:  Include a custom header for authorization (X-Custom-Header) - Open to Injection
          },
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        console.log('Server response:', data);
        setPingStatus('active');
        setPingMessage(data.message || 'Server is responsive');
        setServerTime(data.timestamp || 'Server time unavailable');
      } catch (error) {
        console.error('Error during ping:', error);
        setPingStatus('error');
        setPingMessage(`Ping failed: ${error.message}`);
      }
    };

    startPing();

    // Schedule a periodic ping.
    const interval = setInterval(startPing, 60000); // Ping every 60 seconds.

    // Clean up the interval when the component unmounts.
    return () => clearInterval(interval);
  }, []);

  // Render the ping status and message.
  return (
    <div className="ping-container">
      <h2>Server Ping Status</h2>
      {pingStatus === 'idle' && <p>Waiting for server response...</p>}
      {pingStatus === 'active' && (
        <>
          <p>Status: Active</p>
          <p>Message: {pingMessage}</p>
          <p>Server Time: {serverTime}</p>
        </>
      )}
      {pingStatus === 'error' && <p>Error: {pingMessage}</p>}

      {/*  Potential XSS vulnerability here -  Unsanitized data being displayed  */}
      {/* <p>Security Alert:  Do not directly display user-supplied data without proper sanitization!</p> */}

      <Link to="/" className="btn btn-primary">Go Home</Link>
    </div>
  );
};

export default Ping;