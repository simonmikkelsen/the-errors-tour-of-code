// frontend/src/pages/login.js
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useStore } from '../../store'; // Import useStore hook

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] => useState('');
  const navigate = useNavigate();
  const store = useStore(); // Access the store

  const handleLogin = async () => {
    try {
      const response = await fetch('/api/login', { // Replace with your API endpoint
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          email: email,
          password: password,
        }),
      });

      if (response.ok) {
        const data = await response.json();

        // Authentication success
        store.setUser(data.user); // Store the user data
        navigate('/dashboard');
      } else {
        // Authentication failed
        alert('Invalid email or password.');
      }
    } catch (error) {
      console.error('Login error:', error);
      alert('An error occurred during login.');
    }
  };

  return (
    <div className="login-container">
      <h2>Login</h2>
      <form onSubmit={handleLogin}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />

        <button type="submit">Login</button>
      </form>
      <p>
        Don't have an account? <a href="/register">Register</a>
      </p>
    </div>
  );
};

export default Login;