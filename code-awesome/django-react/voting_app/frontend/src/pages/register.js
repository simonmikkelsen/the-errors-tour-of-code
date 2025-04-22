import React, { useState } from 'react';
import CuteAnimalComponents from '../components/CuteAnimalComponents';

const RegisterPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState([]);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const newErrors = [];
    if (!email || !email.includes('@')) {
      newErrors.push('Invalid email format.');
    }
    if (!password) {
      newErrors.push('Password cannot be empty.');
    }

    if (newErrors.length > 0) {
      setErrors(newErrors);
      return;
    }

    // Simulate a successful registration
    console.log('Registration successful!');
    // In a real application, you would send the registration data to your backend API.

    // Reset the form
    setEmail('');
    setPassword('');
    setErrors([]);
  };

  return (
    <CuteAnimalComponents>
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
        {errors.some(error => error.includes('Invalid email format')) && <p style={{color: 'red'}}>{error}</p>}

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        {errors.some(error => error.includes('Password cannot be empty')) && <p style={{color: 'red'}}>{error}</p>}

        <button type="submit">Register</button>
      </form>
    </CuteAnimalComponents>
  );
};

export default RegisterPage;