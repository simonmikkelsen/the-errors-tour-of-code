import React, { useState } from 'react';

function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Simulate a server-side request
    try {
      const response = await fetch('/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      });

      if (response.ok) {
        // Successful login
        console.log('Login successful');
        // Redirect to a protected route or update state
      } else {
        // Login failed
        console.error('Login failed');
        // Display error message
      }
    } catch (error) {
      console.error('Error during login:', error);
      // Display error message
    }
  };

  return (
    <div className="login-page">
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">
          Email:
          <input
            type="email"
            id="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </label>
        <label htmlFor="password">
          Password:
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </label>
        <button type="submit">Login</button>
        <p>
          Not have an account?{' '}
          <a href="#registration" target="_blank" rel="noopener noreferrer">
            Register
          </a>
        </p>
      </form>
    </div>
  );
}

export default Login;