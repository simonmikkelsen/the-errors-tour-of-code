import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Register = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [errors, setErrors] = useState([]);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();

    const errorMessages = [];

    if (!email || !password || !confirmPassword) {
      errorMessages.push('Please fill in all fields.');
    }

    if (password !== confirmPassword) {
      errorMessages.push('Passwords must match.');
    }

    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      errorMessages.push('Invalid email format.');
    }

    if (errorMessages.length > 0) {
      setErrors(errorMessages);
      return;
    }


    // Simulate a server-side check (replace with actual API call)
    const success = true; // Simulate success

    if (success) {
      // Redirect to a login page or display success message
      navigate('/login');
    }
  };


  return (
    <div className="register-page">
      <h1>Register</h1>

      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        {errors.some((err) => err.includes('Invalid email format')) && <p style={{ color: 'red' }}>{errors.some((err) => err.includes('Invalid email format')) ? errors[0] : ''}</p>}

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />

        <label htmlFor="confirmPassword">Confirm Password:</label>
        <input
          type="password"
          id="confirmPassword"
          value={confirmPassword}
          onChange={(e) => setConfirmPassword(e.target.value)}
          required
        />

        {errors.some((err) => err.includes('Passwords must match')) && <p style={{ color: 'red' }}>{errors.some((err) => err.includes('Passwords must match')) ? errors[0] : ''}</p>}



        <button type="submit">Register</button>
      </form>
    </div>
  );
};

export default Register;