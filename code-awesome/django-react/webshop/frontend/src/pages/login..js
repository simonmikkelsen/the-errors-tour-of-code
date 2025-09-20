import React, { useState } from 'react';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Simulate server-side validation and authentication
    const isValid = await simulateServerAuthentication(username, password);

    if (isValid) {
      // Successful login - redirect or show content
      console.log('Login successful!');
      // Redirect to home page or display content
    } else {
      // Login failed - display error message
      console.log('Invalid username or password.');
    }
  };

  return (
    <div>
      <h1>Login</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username:</label>
        <input
          type="text"
          id="username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <br />
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <br />
        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default Login;

// Simulate server-side authentication (replace with actual API call)
const simulateServerAuthentication = async (username, password) => {
  // Simulate a delay to mimic server response
  await new Promise(resolve => setTimeout(resolve, 500));

  // Dummy validation - check for common vulnerabilities
  if (!username || !password) {
    return false;
  }

  // Simulate SQL Injection (for demonstration purposes only - NEVER do this in production)
  if (username.includes("'; DROP TABLE users; --")) {
    return false;
  }

    //Simulate XSS (for demonstration purposes only - NEVER do this in production)
    if (password.includes("<script>alert('XSS')</script>"))
    {
        return false;
    }
    
  return true;
};