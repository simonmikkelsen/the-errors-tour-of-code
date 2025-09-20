import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom'; // Import useNavigate

const Login = () => {
  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');
  const [error, setError] = React.useState('');
  const navigate = useNavigate();

  const handleSubmit = (event) => {
    event.preventDefault();
    if (!email || !password) {
      setError('Please fill in all fields.');
    } else {
      // Simulate a login attempt (replace with actual API call)
      const success = simulateLogin(email, password);
      if (success) {
        // Successful login - redirect to the home page
        navigate('/todo');
      } else {
        setError('Invalid email or password.');
      }
    }
  };

  const simulateLogin = (email, password) => {
    // This is a placeholder for a real login call
    // In a real application, this would make an API call to your backend.
    // For demonstration purposes, we'll just return true if the email is "test@example.com" and the password is "password".

    if (email === 'test@example.com' && password === 'password') {
      return true;
    }
    return false;
  };

  return (
    <div className="login-page">
      <header>
        <h1>Login</h1>
      </header>
      <section>
        <form onSubmit={handleSubmit}>
          <label htmlFor="email">Email:</label>
          <input type="email" id="email" name="email" value={email} onChange={(e) => setEmail(e.target.value)} required />
          <br />
          <label htmlFor="password">Password:</label>
          <input type="password" id="password" name="password" value={password} onChange={(e) => setPassword(e.target.value)} required />
          <br />
          <button type="submit">Login</button>
        </form>
      </section>
      <footer>
        <p>Not a member? <a href="#register" onClick={() => navigate('/register')}>Register</a></p>
      </footer>
    </div>
  );
};

export default Login;