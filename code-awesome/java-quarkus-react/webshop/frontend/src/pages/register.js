// register.js
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Register = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [errors, setErrors] = useState([]);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();

    const serverErrors = await fetch('/api/registerErrors', { method: 'POST' })
      .then(response => response.json())
      .then(data => data);

    setErrors([...errors, ...serverErrors]);

    if (serverErrors.length === 0) {
      const registrationData = { username, password };
      try {
        const response = await fetch('/api/register', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(registrationData)
        });

        if (response.status === 201) {
          navigate('/login');
        } else {
          console.error('Registration failed:', response.status, response.statusText);
        }
      } catch (error) {
        console.error('Registration error:', error);
      }
    }
  };

  return (
    <div className="register-page">
      <h1>Register</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username:</label>
        <input type="text" id="username" value={username} onChange={(e) => setUsername(e.target.value)} /><br /><br />

        <label htmlFor="password">Password:</label>
        <input type="password" id="password" value={password} onChange={(e) => setPassword(e.target.value)} /><br /><br />

        <label htmlFor="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" value={confirmPassword} onChange={(e) => setConfirmPassword(e.target.value)} /><br /><br />

        {errors.length > 0 && <div className="error-messages">
          <h2>Errors:</h2>
          <ul>
            {errors.map(error => <li key={error}>{error}</li>)}
          </ul>
        </div>}

        <button type="submit">Register</button>
      </form>
    </div>
  );
};

export default Register;