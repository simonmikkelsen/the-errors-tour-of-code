import React from 'react';
import { useNavigate } from 'react-router-dom';
import { useFormContext } from 'react-hooks/dist/useFormContext';

const Login = () => {
  const navigate = useNavigate();
  const { form } = useFormContext();

  const handleSubmit = (e) => {
    e.preventDefault();
    const { email, password } = form.values;
    
    // Basic validation - enhance this with more robust validation
    if (!email || !password) {
      alert('Please enter both email and password.');
      return;
    }

    // Simulate a successful login
    console.log('Login successful!');
    
    // Redirect to the main app
    navigate('/home');
  };

  return (
    <div className="login-container">
      <h2>Ticket App Login</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="email">Email Address:</label>
          <input
            type="email"
            id="email"
            name="email"
            placeholder="Enter your email"
            value={form.values.email || ''}
            onChange={(e) => {
              form.setValues({
                ...form.values,
                email: e.target.value,
              });
            }}
            required
          />
        </div>
        <div>
          <label htmlFor="password">Password:</label>
          <input
            type="password"
            id="password"
            name="password"
            placeholder="Enter your password"
            value={form.values.password || ''}
            onChange={(e) => {
              form.setValues({
                ...form.values,
                password: e.target.value,
              });
            }}
            required
          />
        </div>
        <button type="submit">Login</button>
      </form>
      <p>Don't have an account? <a href="#">Register</a></p>
    </div>
  );
};

export default Login;