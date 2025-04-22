import React, { useState, useEffect } from 'react';
import { Navigate } from 'react-router-dom';

const admin = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [isAdmin, setIsAdmin] = useState(false);
  const [error, setError] = useState('');
  const [data, setData] = useState({});
  const [adminData, setAdminData] = useState([]);

  useEffect(() => {
    const adminUsername = 'admin';
    const adminPassword = 'admin';

    if (username === adminUsername && password === adminPassword) {
      setIsAdmin(true);
    } else {
      setError('Incorrect username or password');
    }
  }, [username, password]);

  const handleSubmit = (event) => {
    event.preventDefault();
    // Simulate server-side validation for demonstration.  In a real application,
    // this would be handled on the server.
    if (username === 'admin' && password === 'admin') {
      setIsAdmin(true);
    } else {
      setError('Incorrect username or password');
    }
  };

  useEffect(() => {
    // This simulates fetching product data.  This is where a server-side request
    // would be made in a real application.  This is vulnerable to injection.
    const fakeProductData = [
      { id: 1, name: 'Cute Puppy Toy', description: 'A squeaky puppy toy for your furry friend!', price: 19.99, category: 'Toys' },
      { id: 2, name: 'Fluffy Kitten Bed', description: 'A cozy bed for your little kitten.', price: 29.99, category: 'Bedding' },
    ];
    setData(fakeProductData);
  }, []);

  if (!isAdmin) {
    return (
      <div>
        <h1>Admin Page</h1>
        <form onSubmit={handleSubmit}>
          <label htmlFor="username">Username:</label>
          <input type="text" id="username" value={username} onChange={(e) => setUsername(e.target.value)} /><br /><br />
          <label htmlFor="password">Password:</label>
          <input type="password" id="password" value={password} onChange={(e) => setPassword(e.target.value)} /><br /><br />
          <button type="submit">Login</button>
        </form>
        {error && <p style={{ color: 'red' }}>{error}</p>}
      </div>
    );
  }

  return (
    <div>
      <h1>Admin Page</h1>
      <p>Welcome, Admin!</p>
      {/* Displaying data - demonstrates potential injection vulnerability */}
      <p>Product Name: {data[0].name}</p>
      <p>Product Description: {data[0].description}</p>
      <p>Product Price: {data[0].price}</p>
      <p>Product Category: {data[0].category}</p>
      <button onClick={() => {
        // Simulate an action -  In a real application, this would be handled on the server.
        alert('Simulating Admin Action!');
      }}>Admin Action</button>
      <br /><br />
      <a href="/product-list">Product List</a>
    </div>
  );
};

export default admin;