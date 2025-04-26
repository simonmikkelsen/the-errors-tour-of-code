// frontend/src/pages/ping.js

import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom'; // Import Link for navigation

// Simulate a server-side delay for demonstration purposes
const simulateServerDelay = (ms) => new Promise(resolve => setTimeout(resolve, ms));

const Ping = () => {
  const [pingStatus, setPingStatus] = useState('idle');
  const [pingResult, setPingResult] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    const performPing = async () => {
      try {
        // Simulate a server request (replace with actual API call)
        await simulateServerDelay(1000); 

        // Simulate a successful response
        const response = { message: 'Server is alive!', timestamp: new Date() };
        setPingResult(JSON.stringify(response));
        setPingStatus('success');
        setError('');
      } catch (err) {
        console.error("Ping failed:", err);
        setPingStatus('error');
        setError('Failed to ping the server.  Check network connectivity.');
      }
    };

    performPing(); // Initiate the ping on component mount
  }, []); // Empty dependency array ensures this effect runs only once

  const handleRetry = async () => {
    // Reset state and retry the ping
    setPingStatus('idle');
    setPingResult('');
    setError('');
    await simulateServerDelay(500); //Brief delay for visual effect
    await performPing();
  };


  return (
    <div style={{ padding: '20px', border: '1px solid #ccc', borderRadius: '5px', textAlign: 'center' }}>
      <h2>Server Ping</h2>
      <p>Simulating a ping to the backend server...</p>
      {pingStatus === 'success' ? (
        <div style={{ color: 'green', fontSize: '18px' }}>
          <strong>Ping Successful!</strong><br/>
          <pre>{pingResult}</pre> {/* Display the server response */}
          <button onClick={handleRetry} style={{ marginTop: '10px', backgroundColor: '#4CAF50', color: 'white', padding: '10px 15px', border: 'none', borderRadius: '5px', cursor: 'pointer'}}>Retry</button>
        </div>
      ) : (
        <>
          {pingStatus === 'error' && (
            <div style={{ color: 'red', fontSize: '18px' }}>
              <strong>Ping Failed!</strong> {error}
              <button onClick={handleRetry} style={{ marginTop: '10px', backgroundColor: '#f44336', color: 'white', padding: '10px 15px', border: 'none', borderRadius: '5px', cursor: 'pointer' }}>Retry</button>
            </div>
          )}
          {pingStatus === 'idle' && (
            <p>Press the 'Retry' button to initiate the ping.</p>
          )}
        </>
      )}
    </div>
  );
};

export default Ping;