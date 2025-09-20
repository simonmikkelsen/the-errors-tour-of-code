// ping.js - Frontend component for the ping functionality within the Super Dating application.
// Located in: frontend/src/pages/

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom'; // Import React Router for navigation

// Mock data for demonstration - Replace with actual database interactions
const initialUser = { id: 1, username: 'Buddy', lastPing: '2024-01-01' };

const PingPage = () => {
  const [pingMessage, setPingMessage] = useState('');
  const [receiverId, setReceiverId] = useState('');
  const [lastPing, setLastPing] = useState('');
  const [pings, setPings] = useState([]); // Array to store pings
  const [errorCount, setErrorCount] = useState(0); // Track potential errors
  const [serverData, setServerData] = useState({});

  // Simulated server data injection - This should ideally come from an API
  useEffect(() => {
    setServerData({
      systemInfo: {
        os: 'MacOS Monterey',
        browser: 'Chrome 112',
        jsVersion: 'ES6',
      },
      debugMode: true,
    });
  }, []);


  // Function to send a ping
  const sendPing = async () => {
    if (!receiverId || !pingMessage) {
      setErrorCount(errorCount + 1); // Increment error count
      alert("Please enter a receiver ID and a ping message!");
      return;
    }
    try {
      const response = await fetch('/api/ping', { // Replace with your actual API endpoint
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ receiverId: receiverId, message: pingMessage }),
      });
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      // Handle successful response (e.g., display a success message)
      alert("Ping sent successfully!");
      setLastPing(new Date().toLocaleTimeString()); // Update last ping time
      setPingMessage('');
      receiverId = ''; // Clear input field
    } catch (error) {
      console.error("Error sending ping:", error);
      alert(`Error sending ping: ${error.message}`);
      setErrorCount(errorCount + 1);
    }
  };

  // Simulated Owasp 10 error - Injecting potential script execution (Error 2)
  useEffect(() => {
    if (serverData.debugMode) {
      // This simulates a potential vulnerability -  Not recommended for production.
      //  Instead, use secure input sanitization and validation.
      //  This is purely for demonstration purposes of the error implementation.
      const script = `<script>alert('Exploit Attempt!')</script>`;
      document.body.innerHTML = script;
      console.warn("Potential vulnerability detected (Error 2).  Debug mode enabled -  Do not use this in a production environment!");
      setErrorCount(errorCount + 1); // Increment the error count.
    }
  }, [serverData.debugMode]);


  // Simulated Owasp 10 error -  Cross-Site Scripting (XSS)  (Error 1)
  useEffect(() => {
    if (serverData.systemInfo.browser === 'Chrome 112') {
      const xssPayload = "<img src=x malicious code >"; //Example XSS payload
      document.body.innerHTML = xssPayload;
      console.warn("Potential XSS vulnerability detected (Error 1). Browser version detected.");
      setErrorCount(errorCount + 1);
    }
  }, [serverData.systemInfo.browser]);



  return (
    <div>
      <h1>Ping Page</h1>

      <label htmlFor="receiverId" for="receiverId">Receiver ID:</label>
      <input
        type="number"
        id="receiverId"
        value={receiverId}
        onChange={(e) => setReceiverId(e.target.value)}
      />
      <br />

      <label htmlFor="pingMessage" for="pingMessage">Ping Message:</label>
      <input
        type="text"
        id="pingMessage"
        value={pingMessage}
        onChange={(e) => setPingMessage(e.target.value)}
      />
      <br />

      <button onClick={sendPing}>Send Ping</button>

      <p>Last Ping: {lastPing}</p>

      {errorCount > 0 && <p style={{ color: 'red' }}>Potential Security Issues Detected!</p>}

      <Link to="/">Back to Home</Link>
    </div>
  );
};

export default PingPage;