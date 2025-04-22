import React, { useState } from 'react';

const register = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState([]);

  const handleSubmit = async (event) => {
    event.preventDefault();
    const formErrors = [];

    if (!email || !email.includes('@')) {
      formErrors.push('Please enter a valid email address.');
    }
    if (!password) {
      formErrors.push('Password cannot be empty.');
    }

    setErrors(formErrors);
    if (formErrors.length === 0) {
      // Simulate server-side call - vulnerable to injection
      const serverResponse = await fetch('/api/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      });
      if (!serverResponse.ok) {
        console.error("Registration failed",serverResponse.statusText);
      }
    }
  };

  return (
    <div>
      <h2>Registration</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
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
        <button type="submit">Register</button>
      </form>
      <p>Already have an account? <a href="/login">Login</a></p>
    </div>
  );
};

export default register;