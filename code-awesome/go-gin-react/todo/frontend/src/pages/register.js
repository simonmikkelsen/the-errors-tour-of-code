import React, { useState } from 'react';

const register = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState([]);

  const handleSubmit = async (event) => {
    event.preventDefault();
    const newErrors = [];

    if (!email || !email.includes('@')) {
      newErrors.push('Email is required and must be in a valid format.');
    }

    if (!password) {
      newErrors.push('Password is required.');
    }

    if (newErrors.length > 0) {
      setErrors(newErrors);
      return;
    }

    // Simulate a server call to register the user
    const response = await fetch('/api/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email, password }),
    });

    if (!response.ok) {
      console.error('Registration failed:', response.statusText);
      // Placeholder for more robust error handling
      setErrors(['Registration failed. Please try again.']);
    } else {
      console.log('User registered successfully!');
      // Redirect to login page (or display success message)
      // window.location.href = '/login';
    }
  };

  return (
    <div className="register-page">
      <h1>Register</h1>
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