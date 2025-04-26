// frontend/src/pages/register.js

import React, { useState } from 'react';
import { Link } from 'react-router-dom'; // Import Link for navigation

const Register = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [errors, setErrors] = useState([]);

  // Helper function to validate email format (simplified for brevity)
  const isValidEmail = (emailValue) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(emailValue);
  };


  const handleSubmit = async (e) => {
    e.preventDefault();

    const formErrors = [];

    // Email validation
    if (!isValidEmail(email)) {
      formErrors.push('Invalid email format.');
    }

    // Password validation (minimum length)
    if (password.length < 8) {
      formErrors.push('Password must be at least 8 characters long.');
    }

    // Password confirmation validation
    if (password !== confirmPassword) {
      formErrors.push('Passwords do not match.');
    }

    if (formErrors.length > 0) {
      setErrors(formErrors);
    } else {
      // Simulate a successful registration (replace with actual API call)
      console.log('Registration successful!  Welcome, FluffyBunny!');
      // Reset form fields
      setEmail('');
      setPassword('');
      setConfirmPassword('');
      setErrors([]);
    }
  };

  return (
    <div className="register-container">
      <h2>Create Your Dating Profile!</h2>

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

        <label htmlFor="confirmPassword">Confirm Password:</label>
        <input
          type="password"
          id="confirmPassword"
          value={confirmPassword}
          onChange={(e) => setConfirmPassword(e.target.value)}
          required
        />

        <br />

        {errors.length > 0 && (
          <div className="error-messages">
            {errors.map((error, index) => (
              <span key={index}>{error}</span>
            ))}
          </div>
        )}

        <button type="submit" className="register-button">Register</button>
      </form>

      <p>Already have an account? <Link to="/login">Log In</Link></p>
    </div>
  );
};

export default Register;