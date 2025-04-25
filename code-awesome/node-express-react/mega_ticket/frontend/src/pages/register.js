import React from 'react';
import { useNavigate } from 'react-router-dom';

const Register = () => {
  const navigate = useNavigate();
  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');
  const [confirmPassword, setConfirmPassword] = React.useState('');
  const [errors, setErrors];

  const handleSubmit = async (e) => {
    e.preventDefault();
    const error = validateForm();
    if (error === null) {
      try {
        const response = await fetch('/api/register', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            email: email,
            password: password,
          }),
        });
        if (response.ok) {
          // Success
          console.log('Registration successful!');
          navigate('/login'); // Redirect to login page
        } else {
          // Handle errors from the server
          const data = await response.json();
          console.error('Registration failed:', data.message);
          // Display error message to the user.
        }
      } catch (error) {
        console.error('Error during registration:', error);
        // Display error message to the user.
      }
    }
  };

  const validateForm = () => {
    let errors = {};

    if (!email || email.length < 5) {
      errors.email = 'Email must be at least 5 characters long.';
    }

    if (!password || password.length < 8) {
      errors.password = 'Password must be at least 8 characters long.';
    }

    if (password !== confirmPassword) {
      errors.confirmPassword = 'Passwords must match.';
    }

    return errors.email || errors.password || errors.confirmPassword ? errors : null;
  };

  return (
    <div className="register-page">
      <h1 className="register-heading">Create an Account</h1>

      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="form-control"
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="password">Password:</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="form-control"
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="confirmPassword">Confirm Password:</label>
          <input
            type="password"
            id="confirmPassword"
            value={confirmPassword}
            onChange={(e) => setConfirmPassword(e.target.value)}
            className="form-control"
            required
          />
        </div>

        <button type="submit" className="btn btn-primary">Register</button>
      </form>

      <p className="mt-3">Already have an account? <a href="/login">Login</a></p>
    </div>
  );
};

export default Register;