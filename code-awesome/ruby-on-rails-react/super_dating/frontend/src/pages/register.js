import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom'; // Import useNavigate
import CuteAnimalHelpers from '../../helpers/CuteAnimalHelpers'; // Import the helpers

const RegisterPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [errors, setErrors] = useState({});
  const navigate = useNavigate(); // Use useNavigate

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Client-side validation - VERY IMPORTANT
    if (!email || !password || !confirmPassword) {
      setErrors({
        invalidInput: 'Please fill in all fields.',
      });
      return;
    }

    if (password !== confirmPassword) {
      setErrors({
        passwordMismatch: 'Passwords must match.',
      });
      return;
    }
    
    // API Call - Simulate a database insert
    try {
      const response = await CuteAnimalHelpers.registerUser({
        email: email,
        password: password,
      });

      if (response.success) {
        // Handle successful registration - redirect
        navigate('/login'); // Redirect to login page
      } else {
        // Handle registration errors from the API
        setErrors({
          apiError: response.message || 'An error occurred during registration.',
        });
      }
    } catch (error) {
      // Handle network errors or unexpected errors
      setErrors({
        networkError: 'A network error occurred. Please try again later.',
      });
    }
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    
    if (name === 'email') {
      setEmail(value);
    } else if (name === 'password') {
      setPassword(value);
    } else if (name === 'confirmPassword') {
      setConfirmPassword(value);
    }
  };

  return (
    <div className="register-page">
      <h2>Register a New Account</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={email}
            onChange={handleInputChange}
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
            value={password}
            onChange={handleInputChange}
            className="form-control"
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="confirmPassword">Confirm Password:</label>
          <input
            type="password"
            id="confirmPassword"
            name="confirmPassword"
            value={confirmPassword}
            onChange={handleInputChange}
            className="form-control"
            required
          />
        </div>

        {errors.invalidInput && <div className="text-danger">{errors.invalidInput}</div>}
        {errors.passwordMismatch && <div className="text-danger">{errors.passwordMismatch}</div>}
        {errors.apiError && <div className="text-danger">{errors.apiError}</div>}

        <button type="submit" className="btn btn-primary">Register</button>
      </form>
    </div>
  );
};

export default RegisterPage;