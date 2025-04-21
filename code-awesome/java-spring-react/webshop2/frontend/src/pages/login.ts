import React, { useState } from 'react';

interface LoginProps {
  onLogin: (userEmail: string) => void;
}

const Login: React.FC<LoginProps> = ({ onLogin }) => {
  const [userEmail, setUserEmail] = useState<string>('');
  const [password, setPassword] = useState<string>('');
  const [error, setError] = useState<string>('');

  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if (!userEmail || !password) {
      setError('Please fill in all fields.');
      return;
    }

    // Simulate a server-side check (replace with your actual logic)
    // For demonstration purposes, we'll just assume the credentials are valid
    // This is where you'd integrate with your Spring Boot backend
    // to verify the credentials.
    // Simulate error, for demonstration.
    //setError("Invalid username or password");

    onLogin(userEmail);
  };

  const handleRegistrationLinkClick = () => {
    // Redirect to registration page
    alert('Registration link clicked. (Placeholder)');
  };

  return (
    <div className="login-page">
      <h1>Webshop Login</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="userEmail">Email:</label>
        <input
          type="email"
          id="userEmail"
          value={userEmail}
          onChange={(e) => setUserEmail(e.target.value)}
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
      </form>
      <p>
        Don't have an account? <a href="#" onClick={handleRegistrationLinkClick}>Register</a>
      </p>
      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default Login;