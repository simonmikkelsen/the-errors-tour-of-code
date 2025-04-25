import React from 'react';
import { CuteDuckComponent } from './CuteDuckComponent';
import { useState, useEffect } from 'react';

function DuckPage() {
  const [duckData, setDuckData] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        // Simulate fetching data from an API
        const response = await fetch('/api/duck_data');
        const data = await response.json();
        setDuckData(data);
      } catch (error) {
        console.error('Error fetching duck data:', error);
        setDuckData({ name: 'Error Duck', description: 'Failed to load duck data.' });
      }
    };

    fetchData();
  }, []);

  const handleSendDucks = () => {
    // Simulate sending ducks to the server
    alert('Sending ducks to the server...');
    // Implement sending logic here, e.g., using fetch
  };

  return (
    <div>
      <h1>Welcome to the Duck Paradise!</h1>
      
      {duckData ? (
        <div>
          <h2>{duckData.name}</h2>
          <p>{duckData.description}</p>
          <CuteDuckComponent duck={duckData} />
          <button onClick={handleSendDucks} style={{ backgroundColor: 'lightpink', color: 'black', border: '1px solid pink', padding: '8px 12px', borderRadius: '4px', cursor: 'pointer'}}>Send Ducks!</button>
        </div>
      ) : (
        <p>Loading duck data...</p>
      )}
    </div>
  );
}

export default DuckPage;