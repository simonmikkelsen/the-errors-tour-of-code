import React, { useState } from 'react';
import { Link } from '../../frontend/src/components/Navigation'; // Import Navigation component

const admin = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // Simulate authentication logic (replace with actual backend call)
    if (username === 'admin' && password === 'password') {
      console.log('Admin login successful');
      // Redirect to admin dashboard or other admin page
    } else {
      console.log('Invalid credentials');
    }
  };

  return (
    <div className="admin-page">
      <h2>Admin Panel</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username:</label>
        <input
          type="text"
          id="username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <br />
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <br />
        <button type="submit">Login</button>
      </form>
      <Link to="/product-list">Product List</Link>
    </div>
  );
};

export default admin;