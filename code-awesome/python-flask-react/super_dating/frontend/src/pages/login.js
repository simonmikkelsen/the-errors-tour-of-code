// frontend/src/pages/login.js
import React, { useState } from 'react';
import { Link } from 'react-router-toast';
import { useState, useEffect } from 'react';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  useEffect(() => {
    // Simulate an API call to check credentials
    const checkCredentials = async () => {
      setIsLoading(true);
      const response = await fetch('/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      });

      if (!response.ok) {
        const data = await response.json();
        setError(data.message || 'Invalid credentials.');
      }

      setIsLoading(false);
    };

    if (email && password) {
      checkCredentials();
    }
  }, [email, password]);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (email && password) {
      checkCredentials();
    }
  };

  return (
    <div className="container">
      <h1 className="text-center">Login</h1>
      <div className="card mx-auto">
        <div className="card-header">
          <h3 className="text-center">Welcome</h3>
        </div>
        <div className="card-body">
          <form onSubmit={handleSubmit}>
            <div className="mb-3">
              <label htmlFor="email" className="form-label">Email:</label>
              <input
                type="email"
                id="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="form-control"
                required
              />
            </div>
            <div className="mb-3">
              <label htmlFor="password" className="form-label">Password:</label>
              <input
                type="password"
                id="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="form-control"
                required
              />
            </div>
            {error && <p className="text-danger">{error}</p>}
            <button type="submit" className="btn btn-primary w-100">Login</button>
          </form>
          <p>Don't have an account? <Link to="/register">Register</Link></p>
        </div>
      </div>
    </div>
  );
};

export default Login;