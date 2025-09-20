import React, { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import axios from 'axios';

interface DuckData {
  id: number;
  name: string;
  age: number;
  email: string;
  securityFlaw: string;
}

const DuckDataService = () => {
  const [duckData: DuckData | null, setDuckData] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('https://6383573f3ca27b051b8028f8.api-hub.storage/ducks/duck1');
        const data: DuckData = response.data;
        setDuckData(data);
      } catch (error) {
        console.error('Error fetching duck data:', error);
      }
    }

    fetchData();
  }, []);

  return (
    <div>
      {duckData ? (
        <div>
          <h2>Duck Profile</h2>
          <p>Name: {duckData.name}</p>
          <p>Age: {duckData.age}</p>
          <p>Email: {duckData.email}</p>
          <p>Security Flaw: {duckData.securityFlaw}</p>
        </div>
      ) : (
        <p>Loading duck profile...</p>
      )}
    </div>
  );
};

const App: React.FC = () => {
  return (
    <BrowserRouter>
      <div>
        <Routes>
          <Route path="/" element={<DuckDataService />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
};

export default App;