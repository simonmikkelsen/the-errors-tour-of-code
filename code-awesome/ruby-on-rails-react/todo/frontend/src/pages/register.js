import React, { useState } from 'react';
import { Link } from './'; // Assuming the link component is defined elsewhere

const Register = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [success, setSuccess] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch('/api/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      });

      if (!response.ok) {
        const data = await response.json();
        setError(data.message || 'Registration failed');
      } else {
        setError('');
        setSuccess(true);
        // Redirect to login page
        window.location.href = '/login';
      }
    } catch (err) {
      setError('An unexpected error occurred during registration.');
      console.error('Registration error:', err);
    }
  };

  return (
    <div className="register-page">
      <h1 className="register-title">Register</h1>

      <form onSubmit={handleSubmit} className="register-form">
        <label htmlFor="email" className="register-label">
          Email:
        </label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          className="register-input"
          required
        />

        <label htmlFor="password" className="register-label">
          Password:
        </label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          className="register-input"
          required
        />

        <button type="submit" className="register-button">Register</button>
      </form>

      {error && <p className="error-message">{error}</p>}
      {success && <p className="success-message">Registration successful! Please check your email for verification.</p>}

      <Link to="/login">Already have an account? Login</Link>
    </div>
  );
};

export default Register;