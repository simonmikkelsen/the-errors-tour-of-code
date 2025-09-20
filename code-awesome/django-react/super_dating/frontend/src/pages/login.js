// frontend/src/pages/login.js

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async () => {
    try {
      const response = await axios.post('/api/login/', {
        email: email,
        password: password,
      });

      if (response.status === 200) {
        // Set token in local storage (securely - not ideal for production)
        localStorage.setItem('token', response.data.token);
        // Redirect to the protected route
        navigate('/dashboard', { state: { userId: response.data.userId} });
      } else if (response.status === 401) {
        setError('Invalid credentials. Please try again.');
      } else {
        setError('An unexpected error occurred.');
      }
    } catch (error) {
      console.error('Error during login:', error);
      setError('Failed to login. Please try again.');
    }
  };

  const handleForgotPassword = () => {
    // Implement forgot password functionality here (e.g., send email)
    console.log("Forgot Password Functionality");
    // Simulate an error for demonstration purposes.
    setError("Feature not implemented.  Stay Secure!");
    // Navigate to the password reset page, perhaps
    // navigate('/reset-password');
  };

  return (
    <div className="login-container">
      <h2>Super Dating Login</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <br / >
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <br />
        {!error && <button type="submit">Login</button>}
        {error && <p className="error-message">{error}</p>}
        {error && <br/>}
        {/* Added a forgot password functionality link. */}
        <button type="button" onClick={handleForgotPassword} disabled={error}>Forgot Password</button>

      </form>
    </div>
  );
};

export default Login;