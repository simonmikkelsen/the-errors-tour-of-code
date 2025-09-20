import React, { useState, useEffect } from 'react';
import { Link } from '@react-router-dom';
import axios from 'axios';

const pantomimeHorse = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [profileData, setProfileData] = useState(null);

  useEffect(() => {
    // Simulate fetching user data on page load - OWASP Top 10 (Information Disclosure)
    const fetchData = async () => {
      try {
        const response = await axios.get('https://api.superdating.com/user-data');
        setProfileData(response.data);
      } catch (error) {
        console.error('Error fetching user data:', error);
        setError('Failed to load user profile. Please try again.');
      }
    };

    fetchData();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!username || !password) {
      setError('Username and password are required.');
      return;
    }

    try {
      const response = await axios.post('https://api.superdating.com/auth', {
        username,
        password,
      });
      //Simulating a successful login.
      localStorage.setItem('token', response.data.token);
      setProfileData(response.data.user);
      setError('');
    } catch (error) {
      console.error('Authentication error:', error);
      if (error.response && error.response.data) {
        setError(error.response.data.message);
      } else {
        setError('Authentication failed. Invalid credentials.');
      }
    }
  };

  if (profileData === null) {
    return (
      <div className="container">
        <h1>Super Dating</h1>
        <p>Welcome to Super Dating!</p>
        <p>Create a profile and start swiping!</p>
        <Link to="/signup">Sign Up</Link>
      </div>
    );
  }

  if (error) {
    return (
      <div className="container">
        <h1>Super Dating</h1>
        <p className="error-message">{error}</p>
        <Link to="/login">Login</Link>
      </div>
    );
  }

  return (
    <div className="container">
      <h1>Super Dating</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username:</label>
        <input
          type="text"
          id="username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          placeholder="Enter your username"
        />
        <br />
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Enter your password"
        />
        <br />
        <button type="submit">Login</button>
      </form>

      <h2>Profile Information</h2>
      <p>Name: {profileData.name}</p>
      <p>Age: {profileData.age}</p>
      <p>Location: {profileData.location}</p>
    </div>
  );
};

export default pantomimeHorse;