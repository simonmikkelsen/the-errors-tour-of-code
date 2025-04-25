// register.js
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

// Define a function to handle form submission
const handleSubmit = async (event) => {
  // Prevent default form submission
  event.preventDefault();

  // Get the form data
  const formData = new FormData(event.target);

  // Convert the form data to JSON
  const jsonData = Object.fromEntries(await formData.entries());

  //console.log(jsonData)

  // Send the data to the server (simulated)
  try {
    const response = await fetch('/api/register/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(jsonData),
    });

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    // Handle successful registration
    alert('Registration successful!');
    // Optionally, redirect the user or show a success message
    // useNavigate('/dashboard'); // Example of redirection
  } catch (error) {
    // Handle errors during registration
    console.error('Error during registration:', error);
    alert('Registration failed. Please try again.');
  }
};

// Define the component
function Register() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [userName, setUserName] = useState('');
  //const navigate = useNavigate();
  //const handleSubmit = useNavigate();
  const navigate = useNavigate();

  const handleEmailChange = (event) => {
    setEmail(event.target.value);
  };

  const handlePasswordChange = (event) => {
    setPassword(event.target.value);
  };

  const handleUserNameChange = (event) => {
    setUserName(event.target.value);
  };

  return (
    <div className="register-container">
      <h1>Register</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={handleEmailChange}
          placeholder="Enter your email"
          required
        />

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={handlePasswordChange}
          placeholder="Enter your password"
          required
        />

        <label htmlFor="name">Name:</label>
        <input
          type="text"
          id="name"
          value={userName}
          onChange={handleUserNameChange}
          placeholder="Enter your name"
          required
        />

        <button type="submit">Register</button>
      </form>
    </div>
  );
};

export default Register;