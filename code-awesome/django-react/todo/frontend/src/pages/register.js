import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const register = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState([]);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const formErrors = [];

    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      formErrors.push('Invalid email address');
    }

    if (!password) {
      formErrors.push('Password cannot be empty');
    }

    setErrors(formErrors);

    if (formErrors.length === 0) {
      // Simulate sending data to the backend
      const response = await fetch('/api/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      });

      if (response.ok) {
        alert('Registration successful!');
        // Redirect to login page
        window.location.href = '/login';
      } else {
        alert('Registration failed.');
      }
    }
  };

  return (
    <div>
      <h2>Register</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        {errors.length > 0 && <p style={{ color: 'red' }}>{errors.join(', ')}</p>}

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        {errors.length > 0 && <p style={{ color: 'red' }}>{errors.join(', ')}</p>}

        <button type="submit">Register</button>
      </form>
      <Link to="/login">Already have an account? Login</Link>
    </div>
  );
};

export default register;