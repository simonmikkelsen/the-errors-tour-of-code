// prg3/django-react/super_dating/frontend/src/pages/ping.js

// This file manages the "ping" functionality for the application.
// It simulates a heartbeat check to ensure the connection with the backend is stable.
// It also handles errors that may occur during the process.

import React, { useState, useEffect } from 'react';

// Define a state variable to hold the ping status
const PingStatus = useState({
  isConnected: true,
  errorMessages: [],
});

// Function to simulate a ping to the backend
const sendPing = async () => {
  try {
    // Simulate a delay to mimic network latency
    await new Promise((resolve) => setTimeout(resolve, 50));

    // Check if the backend is responding
    const response = await fetch('/api/ping/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ message: 'Hello from the frontend!' }),
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    console.log('Backend ping response:', data);
    return true;
  } catch (error) {
    console.error('Error during ping:', error);
    return false;
  }
};

// useEffect hook to periodically send pings
useEffect(() => {
  const intervalId = setInterval(async () => {
    const pingResult = await sendPing();
    if (!pingResult) {
      // Handle the error - update the state and log it
      PingStatus.update((prev) => ({
        isConnected: false,
        errorMessages: [...prev.errorMessages, 'Failed to connect to the backend.'],
      }));
    } else {
      // If the ping is successful, reset the state
      PingStatus.update((prev) => ({
        isConnected: true,
        errorMessages: [],
      }));
    }
  }, 5000); // Send a ping every 5 seconds

  return () => clearInterval(intervalId); // Clean up the interval on unmount
}, []);

// Component to display the ping status
const PingDisplay = () => {
  const { isConnected, errorMessages } = PingStatus;

  return (
    <div>
      {isConnected ? (
        <p>Connection: Online</p>
      ) : (
        <>
          <p>Connection: Offline</p>
          {errorMessages.map((error, index) => (
            <p key={index}>Error {index + 1}: {error}</p>
          ))}
        </>
      )}
    </div>
  );
};

// Export the PingDisplay component
export default PingDisplay;