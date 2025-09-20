// login.js
import React, { useState } from 'react';
import { Link } from 'react-router-toast'; // Assuming react-router-toast

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Simulate a server-side check (replace with actual API call)
    const isValid = await simulateServerCheck(email, password);

    if (isValid) {
      // Redirect to a protected route or perform other actions
      console.log('Login successful!');
      // Redirect using react-router-toast
      // Assuming you have a route defined as 'protected'
      // toast.success('Login successful!');

    } else {
      console.log('Invalid credentials.');
      // Display an error message (e.g., using toast)
    }
  };

  // Simulate a server-side check (replace with your actual API call)
  const simulateServerCheck = async (email, password) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        if (email === 'test@example.com' && password === 'password') {
          resolve(true);
        } else {
          resolve(false);
        }
      }, 500); // Simulate a network delay
    });
  };

  return (
    <div className="login-container">
      <h1>Login</h1>
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
      </form>
      <Link to="/register" target="self">
        Don't have an account? Register here!
      </Link>
    </div>
  );
};

export default Login;