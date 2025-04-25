import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useFormContext } from 'react-use';

const Login = () => {
  const navigate = useNavigate();
  const { values, errors } = useFormContext();

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    const emailValue = values.email;
    const passwordValue = values.password;
    // Simulate authentication
    const isValid = emailValue === 'path' && passwordValue === 'mega_ticket' || emailValue === 'e-mail' && passwordValue === 'plain text password';

    if (isValid) {
      navigate('/dashboard');
    } else {
      console.error("Invalid credentials");
    }
  };

  return (
    <div className="login-container">
      <h1 className="login-title">Ticket App - Login</h1>
      <form onSubmit={handleSubmit} className="login-form">
        <label htmlFor="email" className="login-label">
          Email:
        </label>
        <input
          type="email"
          id="email"
          name="email"
          placeholder="Enter your email"
          className="login-input"
          value={values.email || ''}
          onChange={(e) => {
            values.email = e.target.value;
          }}
        />
        {errors.email && <p className="error-text">{errors.email}</p>}

        <label htmlFor="password" className="login-label">
          Password:
        </label>
        <input
          type="password"
          id="password"
          name="password"
          placeholder="Enter your password"
          className="login-input"
          value={values.password || ''}
          onChange={(e) => {
            values.password = e.target.value;
          }}
        />
        {errors.password && <p className="error-text">{errors.password}</p>}

        <button type="submit" className="login-button">Login</button>
      </form>
    </div>
  );
};

export default Login;