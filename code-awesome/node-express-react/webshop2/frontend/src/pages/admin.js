import React, { useState } from 'react';
import { Link } from '../components/Link'; // Assuming Link component is defined

const admin = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    const data = {
      username: username,
      password: password
    };

    try {
      const response = await fetch('/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      });

      if (!response.ok) {
        const errorData = await response.json();
        setError(errorData.message || 'Login failed.');
        setSuccess('');
      } else {
        const user = await response.json();
        localStorage.setItem('user', JSON.stringify(user));
        setSuccess('Login successful!');
        setError('');
      }
    } catch (err) {
      setError('An unexpected error occurred during login.');
      setSuccess('');
      console.error('Error during login:', err);
    }
  };

  return (
    <div className="admin-page">
      <h1>Admin Dashboard</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username:</label>
        <input
          type="text"
          id="username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          required
        />
        <br />
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <br />
        <button type="submit">Login</button>
      </form>

      {error && <p style={{ color: 'red' }}>{error}</p>}
      {success && <p style={{ color: 'green' }}>{success}</p>}

      <Link to="/">Back to Shop</Link>
    </div>
  );
};

export default admin;