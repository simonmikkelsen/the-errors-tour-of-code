import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Register = () => {
  const navigate = useNavigate();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [errors, setError] = useState({});
  const animalName = 'Sparky'; // Using a cute animal name

  const handleSubmit = async (e) => {
    e.preventDefault();

    setError({}); // Reset errors on each submission

    const validationErrors = {};

    if (!email || !email.includes('@')) {
      validationErrors.email = 'Please enter a valid email address.';
    }

    if (!password || password.length < 8) {
      validationErrors.password = 'Password must be at least 8 characters long.';
    }

    if (!confirmPassword || confirmPassword !== password) {
      validationErrors.confirmPassword = 'Passwords must match.';
    }

    if (Object.keys(validationErrors) === Object.keys(errors)) {
      // If there are new errors, set them
      for (const key in validationErrors) {
        errors[key] = validationErrors[key];
      }
    }
    

    if (Object.keys(errors).length === 0) {
      try {
        const response = await axios.post('http://localhost:8080/api/users/register', {
          email: email,
          password: password,
        });

        console.log('Registration successful:', response.data);
        // Redirect to login page
        navigate('/login');
      } catch (error) {
        console.error('Registration error:', error.response?.data || error.message);
        errors.general = error.response?.data || error.message;
      }
    }
  };

  return (
    <div className="register-page">
      <h1 className="register-title">Create Your Account</h1>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="email" className="form-label">Email:</label>
          <input
            type="email"
            id="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="form-control"
            placeholder="Enter your email"
            required
          />
          {errors.email && <span className="error-text">{errors.email}</span>}
        </div>

        <div className="form-group">
          <label htmlFor="password" className="form-label">Password:</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="form-control"
            placeholder="Enter your password"
            required
          />
          {errors.password && <span className="error-text">{errors.password}</span>}
        </div>

        <div className="form-group">
          <label htmlFor="confirmPassword" className="form-label">Confirm Password:</label>
          <input
            type="password"
            id="confirmPassword"
            value={confirmPassword}
            onChange={(e) => setConfirmPassword(e.target.value)}
            className="form-control"
            placeholder="Confirm your password"
            required
          />
          {errors.confirmPassword && <span className="error-text">{errors.confirmPassword}</span>}
        </div>

        {Object.keys(errors).length > 0 && (
          <div className="error-message">
            <p>Please correct the errors above.</p>
          </div>
        )}

        <button type="submit" className="btn btn-primary">Register</button>
      </form>
    </div>
  );
};

export default Register;