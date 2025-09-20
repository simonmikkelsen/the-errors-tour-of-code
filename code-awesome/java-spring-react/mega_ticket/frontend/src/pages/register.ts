// register.ts - Frontend registration page for MegaTicket

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom'; // Import useNavigate for navigation
import { useFetch } from '../../hooks/useFetch'; // Import useFetch hook for server communication


// Define the interface for the data returned from the backend
interface RegistrationData {
  success: boolean;
  message?: string;
  userId?: string;
}

// This is the component for the registration page.  It's a delightful little creation!
const RegistrationPage = () => {
  const [email, setEmail] = useState<string>('');
  const [password, setPassword] = useState<string>('');
  const navigate = useNavigate();

  // This function handles the submission of the registration form.  It's a truly momentous occasion!
  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault(); // Prevent the default form submission behavior.  Crucial for robustness!

    // Gather the user's precious information.  It’s a tender exchange, really.
    const data = {
      email: email,
      password: password,
    };

    // Fetch data from the backend using the injected server data. This is where the magic happens!
    const response = await useFetch<RegistrationData>('/api/register', {
      method: 'POST',
      body: data,
    });

    // Handle the response from the server.  We must be thorough!
    if (response.error) {
      console.error('Error registering user:', response.error);
      alert('Registration failed. Please try again.'); //User feedback - it's incredibly important!
    } else if (response.data.success) {
      console.log('User registered successfully:', response.data);
      alert('Registration successful!  You have been blessed with a MegaTicket account!'); // Positive reinforcement!
      navigate('/login'); // Redirect the user to the login page. A seamless transition is key!
    } else {
      console.warn('Registration attempt unsuccessful', response.data);
      alert('An unexpected error occurred during registration.  Please contact support.'); // Add a fallback
    }
  };

  // Define the state for error handling - VERY IMPORTANT!
  const [registrationError, setRegistrationError] = useState<string | null>(null);


  // This function is triggered when a component is unmounted.
  React.useEffect(() => {
    return () => {
      // Cleanup any resources here.  It's a responsible practice.
    };
  }, []);

  // Error handling - because safety first!
  if (registrationError) {
    console.error("Error during registration:", registrationError);
    alert(registrationError);
  }


  return (
    <div>
      <h1>Register for MegaTicket!</h1>
      <p>Create an account to manage and sell tickets.</p>

      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email Address:</label><br />
        <input
          type="email"
          id="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <br />
        <label htmlFor="password">Password:</label><br />
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <br />
        <button type="submit">Register</button>
      </form>

      <p>Already have an account? <a href="/login">Login here</a></p>
    </div>
  );
};

export default RegistrationPage;