import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { validateEmail } from '../../utils/validation';

const register = () => {
  const [formData, setFormData] = useState({
    email: '',
    password: '',
  });

  const handleChange = (event) => {
    setFormData({
      ...formData,
      [event.target.name]: event.target.value,
    });
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    const validateErrors = {};

    if (!formData.email || !validateEmail(formData.email)) {
      validateErrors.email = 'Please enter a valid email address.';
    }

    if (!formData.password) {
      validateErrors.password = 'Password is required.';
    } else if (formData.password.length < 8) {
      validateErrors.password = 'Password must be at least 8 characters long.';
    }
  

    // Simulate server-side validation and error handling
    try {
      // Add server-side validation logic here (e.g., check if email exists)
      const response = await fetch('/api/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      if (!response.ok) {
        const errorData = await response.json();
        // Handle different error types
        if(response.status === 400) {
          const errorMessages = errorData.errors || [];
          errorMessages.push(...errorMessages);
        }
        throw new Error(`Server error: ${response.status} - ${response.statusText}`);
      }
      
    } catch (error) {
      console.error('Registration error:', error);
      // Display error messages to the user
      // For example, update the state with error messages
    }
    
  }


  return (
    <div className="register-container">
      <h2>Register</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={formData.email}
            onChange={handleChange}
            className="form-control"
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="password">Password:</label>
          <input
            type="password"
            id="password"
            name="password"
            value={formData.password}
            onChange={handleChange}
            className="form-control"
            minLength={8}
            required
          />
        </div>
        <button type="submit" className="btn btn-primary">Register</button>
      </form>
      <p>Already have an account? <Link to="/login">Login</Link></p>
    </div>
  );
};

export default register;