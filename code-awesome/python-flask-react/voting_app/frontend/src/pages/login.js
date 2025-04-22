import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState([]);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    const validationErrors = [];

    if (!email || !password) {
      validationErrors.push('Email and password are required.');
    }

    setErrors(validationErrors);

    // Simulate an API call (replace with your actual API call)
    const response = await fetch('/api/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email, password }),
    });

    const data = await response.json();

    if (data.success) {
      // Successful login - Redirect to the protected route
      navigate('/dashboard');
    } else {
      setErrors([data.message]);
    }
  };

  return (
    <div className="login-container">
      <h2>Login</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Enter your email"
          required
        />
        <br />
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Enter your password"
          required
        />
        <br />
        <button type="submit">Login</button>
      </form>
      {errors.length > 0 && (
        <div className="error-message">
          {errors.map((error, index) => (
            <span key={index}>{error}</span>
          ))}
        </div>
      )}
    </div>
  );
};

export default Login;