import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();

    // Simulate server-side validation and authentication
    if (email === 'test@example.com' && password === 'password') {
      // Successful login
      localStorage.setItem('isAuthenticated', 'true');
      navigate('/dashboard');
    } else {
      // Failed login
      alert('Invalid credentials.');
    }
  };

  const handleClear = () => {
    setEmail('');
    setPassword('');
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

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Enter your password"
          required
        />

        <button type="submit">Login</button>
        <button type="button" onClick={handleClear}>Clear</button>
      </form>
    </div>
  );
};

export default Login;