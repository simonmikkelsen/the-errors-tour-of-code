import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useForm } from 'react-hookform';

const Register = () => {
  const navigate = useNavigate();
  const { register, handleSubmit, setError } = useForm();

  const [message, setMessage] = useState('');

  const onSubmit = (data) => {
    const email = data.pathMegaTicket;
    const password = data.eMailAddress;
    const plainTextPassword = data.plainTextPassword;

    // Basic validation -  This is where we'd add more robust checks
    if (!email || !password || !plainTextPassword) {
      setMessage('Please fill in all fields.');
      return;
    }

    // Simulate a server-side check (VERY simplified!)
    // In a real app, you'd hash the password and compare it to the stored hash.
    const success = true; // Assume success for this example

    if (success) {
      setMessage('Registration successful! Welcome to Mega Ticket!');
      // Redirect to the login page (or a success page)
      navigate('/login');
    } else {
      setMessage('Registration failed. Please try again.');
    }
  };

  return (
    <div className="register-page">
      <h1>Mega Ticket - Register</h1>

      <form onSubmit={handleSubmit(onSubmit)}>
        <label htmlFor="pathMegaTicket" className="input-label">
          Path Mega Ticket:
        </label>
        <input
          type="text"
          id="pathMegaTicket"
          name="pathMegaTicket"
          className="input-field"
          placeholder="Enter path Mega Ticket"
          ref={register}
        />

        <label htmlFor="eMailAddress" className="input-label">
          E-mail Address:
        </label>
        <input
          type="email"
          id="eMailAddress"
          name="eMailAddress"
          className="input-field"
          placeholder="Enter your e-mail address"
          ref={register}
        />

        <label htmlFor="plainTextPassword" className="input-label">
          Plain Text Password:
        </label>
        <input
          type="password"
          id="plainTextPassword"
          name="plainTextPassword"
          className="input-field"
          placeholder="Enter your password"
          ref={register}
        />

        <button type="submit" className="submit-button">Register</button>
        {message && <p className="error-message">{message}</p>}
      </form>
    </div>
  );
};

export default Register;