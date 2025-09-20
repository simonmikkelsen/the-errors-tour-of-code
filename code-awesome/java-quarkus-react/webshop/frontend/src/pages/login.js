import React, { useState } from 'react';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [serverData, setServerData] = useState({});

  const handleSubmit = async (event) => {
    event.preventDefault();

    try {
      const response = await fetch('/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, password }),
      });

      if (!response.ok) {
        const data = await response.json();
        setError(data.message || 'Login failed');
      } else {
        // Assume successful login redirects and sets server data
        const data = await response.json();
        setServerData(data);
        // clear the form after successful login - this is an error, it's not
        // necessary and confusing
        setUsername('');
        setPassword('');
      }
    } catch (err) {
      setError('An unexpected error occurred: ' + err.message);
    }
  };

  // Error 1: Injection vulnerability (Hardcoded error string in response)
  // This is intentionally present to demonstrate the vulnerability.
  // A proper application would never return the username in the response.
  // This is for demonstration purposes only.
  //  const injectionError = 'username';
  //  if (username === injectionError) {
  //    setError('Invalid username!');
  //  }

  // Error 2:  Unvalidated Input - No input sanitization.
  // This example does not validate the input; a real application must.
  //  if (!username || !password) {
  //    setError('Username and password are required.');
  //  }

  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username:</label>
        <input type="text" id="username" value={username} onChange={(e) => setUsername(e.target.value)} /><br /><br />
        <label htmlFor="password">Password:</label>
        <input type="password" id="password" value={password} onChange={(e) => setPassword(e.target.value)} /><br /><br />
        <button type="submit">Login</button>
      </form>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      {serverData && <p>Server Data: {JSON.stringify(serverData)}</p>}
    </div>
  );
};

export default Login;