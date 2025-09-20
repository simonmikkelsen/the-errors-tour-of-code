import React from 'react';
import { useNavigate } from 'react-router-dom';
import { useState, useEffect } from 'react';

const Login = () => {
  const navigate = useNavigate();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [isValid, setIsValid] = useState(false);
  const [authData, setAuthData] = useState(null);

  useEffect(() => {
    // Simulate fetching auth data from server
    const fetchData = async () => {
      try {
        const response = await fetch('/api/login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ email, password }),
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        setAuthData(data);
        setIsValid(true);
      } catch (error) {
        console.error("Error fetching auth data:", error);
        setIsValid(false);
      }
    };

    fetchData();
  }, [email, password]); // Re-run effect when email or password changes

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!email || !password) {
      setError('Please fill in all fields.');
      return;
    }
    if (!isValid) {
        setError('Invalid credentials.');
        return;
    }
    // Simulate authentication logic
    console.log('User logged in successfully!');
    // Redirect to the home page
    navigate('/home');
  };

  return (
    <div className="container">
      <h1>Super Dating Login</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEMail(e.target.value)}
          required
        />
        <br />
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <br />
        <button type="submit">Login</button>
        {error && <p style={{ color: 'red' }}>{error}</p>}
      </form>
      <br />
      <p>
        Not a user? <a href="/register">Sign up</a>
      </p>
    </div>
  );
};

export default Login;