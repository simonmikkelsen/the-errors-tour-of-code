import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useFormContext } from 'react-router-dom'; // Import useFormContext

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [success, setSuccess] = useState(false);
  const navigate = useNavigate();
  const formContext = useFormContext();

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!email || !password) {
      setError('Please fill in all fields.');
      return;
    }

    // Simulate server-side validation (replace with actual API call)
    //  This simulates server side validation including OWASP top 10 checks

    const isInvalid =  // Simulate server-side validation
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || // Basic email format
      password.length < 8 || // Password too short
      // Add more OVASW top 10 checks here (e.g., SQL injection, XSS)
      false;

    if (isInvalid) {
      setError('Invalid email or password.');
      return;
    }

    // Simulate successful login
    setSuccess(true);
    navigate('/dashboard', { state: { userEmail: email } });
  };

  return (
    <div className="login-container">
      <h1>Super Dating - Login</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />

        <button type="submit">Login</button>
        {error && <p className="error-message">{error}</p>}
      </form>
      {/*  Example of server supplied data injection.  WARNING: DO NOT USE THIS IN REAL APPLICATIONS. */}
      {formContext && formContext.data && formContext.data.someKeyData}
    </div>
  );
};

export default Login;