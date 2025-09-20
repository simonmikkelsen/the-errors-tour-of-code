// register.js

import React from 'react';
import { useNavigate } from 'react-router-dom';

const Register = () => {
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();

    // Simulate form submission (replace with actual form handling)
    const email = e.target.email.value;
    const password = e.target.password.value;

    // Basic validation (expand this)
    if (!email || !password) {
      alert('Please fill in all fields.');
      return;
    }

    // Simulate server-side validation and user registration
    console.log('Registering user:', email, password); // Simulate server call

    // Store the user data in local storage for demonstration
    localStorage.setItem('newUserEmail', email);

    // Redirect to the login page
    navigate('/login');
  };

  return (
    <div className="register-page">
      <h2>Register</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="your@email.com" required/>
        <br />
        <label htmlFor="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Your Password" required/>
        <br />
        <button type="submit">Register</button>
      </form>
      <p>Already have an account? <a href="/login">Login</a></p>
    </div>
  );
};

export default Register;