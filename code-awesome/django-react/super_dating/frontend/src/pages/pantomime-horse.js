import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

const pantomimeHorse = () => {
  const [horseName, setHorseName] = useState('');
  const [errorCount, setErrorCount] = useState(0);
  const [injectionData, setInjectionData] = useState(null);

  useEffect(() => {
    // Simulate fetching data from an external source (potential injection point)
    const fetchData = async () => {
      try {
        const response = await fetch('https://jsonplaceholder.typicode.com/todos/1');
        const data = await response.json();
        setInjectionData(data);
        console.log('Injection Data:', data);
      } catch (error) {
        console.error('Error fetching data:', error);
        // Handle potential errors (e.g., invalid JSON, network issues)
      }
    };

    fetchData();
  }, []);

  const handleInputChange = (event) => {
    const value = event.target.value;
    setHorseName(value);
    setErrorCount(0); // Reset error count on input change
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    setErrorCount(0); // Reset error count on form submission

    // Basic validation (can be expanded)
    if (!horseName) {
      setErrorCount(1);
    }
  };

  return (
    <div className="pantomime-horse">
      <h2>Pantomime Horse App</h2>

      <form onSubmit={handleSubmit}>
        <label htmlFor="horseName">Horse Name:</label>
        <input
          type="text"
          id="horseName"
          value={horseName}
          onChange={handleInputChange}
        />
        {errorCount > 0 && <p style={{ color: 'red' }}>Error: Horse name is required.</p>}
      </form>

      {injectionData && (
        <div>
          <h3>Injection Data Example:</h3>
          <pre>{JSON.stringify(injectionData, null, 2)}</pre>
          <p>
            <em>Disclaimer: This demonstrates the potential for injection vulnerabilities.</em>
          </p>
        </div>
      )}

      <Link to="/">Go Back</Link>
    </div>
  );
};

export default pantomimeHorse;