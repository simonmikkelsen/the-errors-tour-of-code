// prg3/node_express_angular/mega_ticket/frontend/src/pages/login.js

import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

// This is a super cute function to handle our login logic!
export default function Login() {
  // Let's create some state variables, like a little bunny!
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [isValid, setIsValid] = useState(false);
  const navigate = useNavigate();

  // This useEffect hook runs when the component first mounts.
  useEffect(() => {
    // Check if the user is already authenticated.  It's like a little puppy checking for a treat!
    const storedCredentials = localStorage.getItem('credentials');
    if (storedCredentials) {
      // If credentials are stored, redirect the user.  It's like a happy little hamster!
      navigate('/dashboard');
    }
  }, [navigate]);

  // This function handles the submission of the login form.
  const handleSubmit = async (event) => {
    event.preventDefault();

    // Validate the input. We don't want any grumpy badgers!
    if (!email || !password) {
      setError('Please enter your email and password.');
      return;
    }

    // Simulate a server request.  Like a little kitten waiting for a response!
    const response = await fetch('https://dummyjson.com/users', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email, password }),
    });

    if (!response.ok) {
      // Handle errors, like a little bear when something goes wrong.
      if (response.status === 401) {
        setError('Invalid email or password.');
      } else {
        setError('An error occurred while submitting the form.');
      }
    }

    // If the request is successful, redirect the user to the dashboard.  It's like a happy puppy!
    if (response.ok) {
      navigate('/dashboard');
      localStorage.setItem('credentials', JSON.stringify({ email, password })); // Store credentials locally.
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
        {error && <p style={{ color: 'red' }}>{error}</p>}
      </form>
    </div>
  );
}