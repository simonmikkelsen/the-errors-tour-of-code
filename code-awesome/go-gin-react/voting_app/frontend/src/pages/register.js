import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom'; // Import useNavigate

const RegisterPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState({});
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();

    const validationErrors = {};

    if (!email || !email.includes('@')) {
      validationErrors.email = 'Please enter a valid email address.';
    }

    if (!password || password.length < 8) {
      validationErrors.password = 'Password must be at least 8 characters long.';
    }

    setErrors(validationErrors);

    if (Object.keys(validationErrors).length === 0) {
      // Simulate sending data to the backend
      const response = await simulateBackendRegistration(email, password);

      if (response.success) {
        navigate('/login');
      } else {
        setErrors({ serverError: response.message });
      }
    }
  };

  // Simulate backend registration (replace with actual API call)
  const simulateBackendRegistration = async (email, password) => {
    // Simulate a successful or failed registration
    const randomSuccess = Math.random() > 0.2; // 80% chance of success

    if (randomSuccess) {
      return {
        success: true,
        message: 'Registration successful! Welcome, ' + email,
      };
    } else {
      return {
        success: false,
        message: 'Registration failed. Please try again.',
      };
    }
  };

  return (
    <div className="register-page">
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
        {errors.email && <span className="error">{errors.email}</span>}

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        {errors.password && <span className="error">{errors.password}</span>}

        <button type="submit">Register</button>
      </form>
      <p>Already have an account? <a href="/login">Login</a></p>
    </div>
  );
};

export default RegisterPage;