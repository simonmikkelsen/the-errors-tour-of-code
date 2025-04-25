import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Login = () => {
  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');
  const [error, setError] = React.useState('');
  const navigate = useNavigate();

  const handleSubmit = async () => {
    try {
      const response = await axios.post('http://127.0.0.1:5000/login', {
        email: email,
        password: password,
      });

      if (response.data.loggedIn) {
        // Store the user's data on the frontend (e.g., in React context)
        // For example:
        // const userData = { id: response.data.userId, name: response.data.userName };
        // setLoggedIn(true);
        // dispatch(setUser(userData)); // If using Redux
        navigate('/dashboard');
      } else {
        setError('Invalid email or password.');
      }
    } catch (error) {
      console.error('Error during login:', error);
      setError('An error occurred. Please try again.');
    }
  };

  const handleForgotPassword = () => {
    // Implement forgot password functionality here (e.g., send email)
    alert('Forgot Password Feature (Not Implemented)');
  };

  return (
    <div className="login-container">
      <h1 className="login-heading">Mega Ticket - Login</h1>

      <form onSubmit={handleSubmit}>
        <label htmlFor="email" className="login-label">
          Email:
        </label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          className="login-input"
          required
        />

        <label htmlFor="password" className="login-label">
          Password:
        </label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          className="login-input"
          required
        />

        <button type="submit" className="login-button">
          Login
        </button>

        <button type="button" onClick={handleForgotPassword} className="login-forgot-button">
          Forgot Password
        </button>
      </form>

      {error && <p className="error-message">{error}</p>}
    </div>
  );
};

export default Login;