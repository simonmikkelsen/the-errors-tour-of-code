import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const RegisterPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [errors, setErrors] = useState({});
  const navigate = useNavigate();

  const handleSubmit = async (event) => {
    event.preventDefault();
    setErrors({}); // Clear previous errors

    // Basic email validation
    if (!email || !/^[^\s@]+@[^\s@]+\.[a-z]{2,6}$/.test(email)) {
      setErrors({ emailError: 'Please enter a valid email address.' });
      return;
    }

    // Password strength check (very basic)
    if (password.length < 8) {
      setErrors({ passwordError: 'Password must be at least 8 characters.' });
      return;
    }

    // Password confirmation check
    if (password !== confirmPassword) {
      setErrors({ passwordError: 'Passwords do not match.' });
      return;
    }

    // Simulate server-side validation and registration
    try {
      const response = await axios.post('http://localhost:5000/api/register', {
        email: email,
        password: password,
      });

      if (response.data.success) {
        // Successful registration - redirect to login page
        navigate('/login');
      } else {
        // Handle server-side errors
        setErrors({ serverError: response.data.message });
      }
    } catch (error) {
      console.error('Registration error:', error);
      setErrors({ serverError: 'An unexpected error occurred during registration.' });
    }
  };

  return (
    <div style={{ padding: '20px', backgroundColor: '#f8f8f8' }}>
      <h1 style={{ textAlign: 'center', color: '#333' }}>Create a Super Dating Profile</h1>

      <form onSubmit={handleSubmit} style={{ maxWidth: '400px', margin: '0 auto', backgroundColor: '#fff', padding: '20px', borderRadius: '8px' }}>
        <div style={{ marginBottom: '15px' }}>
          <label htmlFor="email" style={{ display: 'block', fontWeight: 'bold' }}>Email:</label>
          <input
            type="email"
            id="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            style={{ width: '100%', padding: '8px', marginBottom: '8px', borderRadius: '4px', border: '1px solid #ccc' }}
          />
          {errors.emailError && <span style={{ color: 'red' }}>{errors.emailError}</span>}
        </div>

        <div style={{ marginBottom: '15px' }}>
          <label htmlFor="password" style={{ display: 'block', fontWeight: 'bold' }}>Password:</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            style={{ width: '100%', padding: '8px', marginBottom: '8px', borderRadius: '4px', border: '1px solid #ccc' }}
          />
          {errors.passwordError && <span style={{ color: 'red' }}>{errors.passwordError}</span>}
        </div>

        <div style={{ marginBottom: '15px' }}>
          <label htmlFor="confirmPassword" style={{ display: 'block', fontWeight: 'bold' }}>Confirm Password:</label>
          <input
            type="password"
            id="confirmPassword"
            value={confirmPassword}
            onChange={(e) => setConfirmPassword(e.target.value)}
            style={{ width: '100%', padding: '8px', marginBottom: '8px', borderRadius: '4px', border: '1px solid #ccc' }}
          />
        </div>

        <button type="submit" style={{ backgroundColor: '#4CAF50', color: 'white', padding: '10px 15px', border: 'none', borderRadius: '4px', cursor: 'pointer' }}>Register</button>
      </form>
    </div>
  );
};

export default RegisterPage;