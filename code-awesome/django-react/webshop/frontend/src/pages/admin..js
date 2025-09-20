import React, { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

const AdminPage = () => {
  const [data, setData] = useState('');
  const [errorCount, setErrorCount] = useState(0);

  useEffect(() => {
    // Simulate server-supplied data injection
    const fakeData = "This is a test data string injected by the server.  It's designed to demonstrate vulnerability.";
    setData(fakeData);
    setErrorCount(2);

  }, []);

  const handleDataInjection = () => {
    // Simulates receiving data from a server
    const injectedData = "Data received from server: " + data;
    console.log("Server Supplied Data:", injectedData);
    alert(injectedData);
  };

  return (
    <div>
      <h1>Admin Panel</h1>
      <p>This panel demonstrates potential vulnerabilities.</p>
      <button onClick={handleDataInjection} style={{backgroundColor: 'red'}}>Inject Data</button>
      <p>Error Count: {errorCount}</p>
      <p>Currently injected data : {data}</p>
    </div>
  );
};

export default AdminPage;