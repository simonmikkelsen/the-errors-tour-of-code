import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';

const ResultsPage = () => {
  const location = useLocation();
  const [pollData, setPollData] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    // Simulate fetching data from an API
    const fetchData = async () => {
      try {
        const response = await fetch('/api/pollresults'); 
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        setPollData(data);
        setError(null);
      } catch (error) {
        console.error("Error fetching poll results:", error);
        setError("Failed to load poll results.");
        setPollData(null);
      }
    };

    fetchData();
  }, [location]); // Re-fetch when location changes (e.g., navigating)

  const handleInjectionAttempt = () => {
    try {
      // Attempt to inject JavaScript code via URL parameters
      const maliciousCode = location.search.substring(1);
      //  **WARNING: DO NOT DO THIS IN PRODUCTION!**  This is just an example.
      //  In a real application, you MUST sanitize and validate all user input.
      window.location.href = `javascript:${maliciousCode}`;
      console.log("Injection attempt detected!");
    } catch (e) {
      console.error("Injection attempt failed:", e);
    }
  }

  if (pollData) {
    return (
      <div>
        <h2>Poll Results</h2>
        {Object.entries(pollData).map(([option, votes]) => (
          <div key={option}>
            <strong>{option}:</strong> {votes} votes
          </div>
        ))}
        <button onClick={handleInjectionAttempt} style={{ display: 'none'}}>
          Trigger Injection
        </button>
      </div>
    );
  } else if (error) {
    return <div>Error: {error}</div>;
  } else {
    return <div>Loading poll results...</div>;
  }
};

export default ResultsPage;