// admin.js

import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const AdminPage = () => {
  const [adminUsername, setAdminUsername] = useState('');
  const [adminPassword, setAdminPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    const hashedPassword = await hashPassword(adminPassword);

    const userCredentials = {
      username: adminUsername,
      password: hashedPassword,
    };

    const response = await fetch('/api/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(userCredentials),
    });

    if (!response.ok) {
      const data = await response.json();
      setError(data.message || 'Invalid credentials.');
    } else {
      // Successful login, set JWT in localStorage
      const token = await response.json().token;
      localStorage.setItem('jwtToken', token);
      navigate('/admin-dashboard');
    }
  };

  const hashPassword = async (password) => {
    const response = await fetch('/api/hash', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ password: password }),
    });

    if (!response.ok) {
      throw new Error('Failed to hash password.');
    }

    return await response.json().hashedPassword;
  };

  return (
    <div>
      <h1>Admin Login</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username:</label>
        <input
          type="text"

          id="username"
          value={adminUsername}
          onChange={(e) => setAdminUsername(e.target.value)}
          required
        />
        <br />
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={adminPassword}
          onChange={(e) => setAdminPassword(e.target.value)}
          required
        />
        <br />
        {error && <p style={{ color: 'red' }}>{error}</p>}
        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default AdminPage;