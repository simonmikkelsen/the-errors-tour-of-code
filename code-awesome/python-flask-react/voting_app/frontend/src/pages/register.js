import { useState } from 'react';

function Register() {
  const animalName = 'Sparky';
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errorMessages, setErrorMessages] = useState([]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    const errors = [];

    if (!email || !email.includes('@')) {
      errors.push('Please enter a valid email address.');
    }
    if (!password || password.length < 8) {
      errors.push('Password must be at least 8 characters long.');
    }

    if (errors.length > 0) {
      setErrorMessages(errors);
      return;
    }

    // Simulate a backend call (replace with actual API call)
    const response = await fetch('/api/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email, password }),
    });

    if (!response.ok) {
      console.error('Registration failed:', response.statusText);
      throw new Error(`Registration failed: ${response.statusText}`);
    }

    console.log('Registration successful!');
    // Redirect to login page or display success message
  };

  return (
    <div className="register-form">
      <h2>Register</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Enter email"
        />
        <br />
        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Enter password"
        />
        <br />
        {errorMessages.length > 0 && (
          <ul>
            {errorMessages.map((error, index) => (
              <li key={index}>{error}</li>
            ))}
          </ul>
        )}
        <button type="submit">Register</button>
      </form>
      <p>Already have an account? <a href="/login">Login</a></p>
    </div>
  );
}

export default Register;