import React, { useState } from 'react';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      // Simulate a server call (replace with your actual API call)
      const response = await fetch('/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      });

      if (response.ok) {
        // Successful login - redirect to the next page or set a session
        console.log('Login successful');
        // Redirect to protected route or set session variable
        // window.location.href = '/voting';
      } else {
        console.error('Login failed', response.statusText);
        // Handle error response - display error message to the user
        alert('Invalid email or password');
      }
    } catch (error) {
      console.error('Error during login', error);
      alert('An error occurred during login.');
    }
  }

  return (
    <div className="login-page">
      <h1 className="login-heading">Login</h1>
      <form onSubmit={handleSubmit}>
        <div className="input-container">
          <input
            type="email"
            id="email"
            placeholder="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="input"
          />
        </div>
        <div className="input-container">
          <input
            type="password"
            id="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="input"
          />
        </div>
        <button type="submit" className="login-button">Login</button>
      </form>
      <p>
        Not a voter?{' '}
        <a href="#register" className="register-link">Register</a>
      </p>
    </div>
  );
};

export default Login;