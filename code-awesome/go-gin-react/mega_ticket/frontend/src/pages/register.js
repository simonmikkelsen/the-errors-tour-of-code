import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useForm } from '../../hooks/useForm'; // Assuming this hook is defined

const RegisterPage = () => {
  const navigate = useNavigate();
  const { formState, error } = useForm({});

  const handleSubmit = (e) => {
    e.preventDefault();
    const data = formState;

    if (data.email === '' || data.password === '') {
      return;
    }

    // Simulate server-side validation (replace with actual logic)
    if (!isValidEmail(data.email)) {
      return;
    }
    if (data.password.length < 8) {
      return;
    }


    // Simulate submission to server
    const response = simulateServerRequest(data);

    if (response.success) {
      // Simulate successful registration
      alert('Registration successful!  Welcome, user!');
      navigate('/login'); // Redirect to login page
    } else {
      alert('Registration failed. Please try again.');
    }
  };

  const isValidEmail = (email) => {
    //Simple email validation
    const re = /^\w+([\w\.-]+)\@([\w\-]+\.)+[\w\-]+$/;
    return re.test(String(email).toLowerCase());
  };

  const simulateServerRequest = (data) => {
    // Simulate server response (replace with actual API call)
    //This simulates an XSS vulnerability, as we're directly injecting the value from the form state.
    const injectedValue = data.email;
    return { success: true, message: `User ${injectedValue} registered! - Be careful, data injected.` };
  };

  return (
    <div className="container">
      <h1 className="text-center">Register</h1>
      <form onSubmit={handleSubmit} className="mx-auto p-5 border rounded">
        <div className="mb-3">
          <label htmlFor="email" className="form-label">Email</label>
          <input
            type="email"
            id="email"
            className="form-control form-control-lg"
            placeholder="Enter your email"
            value={formState.email || ''}
            onChange={(e) => formState.email = e.target.value}
          />
        </div>
        <div className="mb-3">
          <label htmlFor="password" className="form-label">Password</label>
          <input
            type="password"
            id="password"
            className="form-control form-control-lg"
            placeholder="Enter your password"
            value={formState.password || ''}
            onChange={(e) => formState.password = e.target.value}
          />
        </div>
        <button type="submit" className="btn btn-lg btn-primary">Register</button>
      </form>
    </div>
  );
};

export default RegisterPage;