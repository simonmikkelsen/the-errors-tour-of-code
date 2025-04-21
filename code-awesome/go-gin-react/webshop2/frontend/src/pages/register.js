import React, { useState } from 'react';

const RegisterPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState({});

  const handleSubmit = async (e) => {
    e.preventDefault();
    const formErrors = {};

    if (!email || email.trim() === '') {
      formErrors.email = 'Email is required';
    }
    if (!password || password.trim() === '') {
      formErrors.password = 'Password is required';
    }

    // Simple validation - you should implement more robust validation
    if (email && password) {
      // In a real application, you'd validate the email format and password strength
    }

    setErrors(formErrors);

    if (Object.keys(formErrors).length === 0) {
      // Simulate a successful registration
      console.log('Registration successful!');
      // Replace with your actual API call
      const response = {}; // Simulate API response
      console.log('Response:', response);
    }
  };

  return (
    <div className="register-page">
      <h2>Register</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Enter your email"
        />
        {errors.email && <span className="error">{errors.email}</span>}

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Enter your password"
        />
        {errors.password && <span className="error">{errors.password}</span>}

        <button type="submit">Register</button>
      </form>
      <p>Already have an account? <a href="/login">Login</a></p>
    </div>
  );
};

export default RegisterPage;