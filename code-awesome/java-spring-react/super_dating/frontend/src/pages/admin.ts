import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import axios from 'axios';

// Assuming you have a backend API endpoint
const API_URL = 'http://localhost:8080/admin'; // Replace with your actual API URL

const AdminPage = () => {
  const location = useLocation();
  const [userData, setUserData] = useState(null);
  const [errors, setErrors] = useState([]);
  const [formErrors, setFormErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    // Redirect if not authenticated (example)
    if (location.pathname === '/admin') {
        // Check for authentication tokens, etc.
        // If not authenticated, redirect to login page
    }
  }, [location.pathname]);



  const handleSubmit = async (e) => {
    e.preventDefault();
    setErrors([]);
    setIsSubmitting(true);

    try {
      const response = await axios.post(API_URL, {
        firstName: formValues.firstName,
        lastName: formValues.lastName,
        email: formValues.email,
        password: formValues.password,
        role: 'admin', // or whatever role you want
      });

      setUserData(response.data);
      // Reset form values
      setFormValues({
        firstName: '',
        lastName: '',
        email: '',
        password: '',
      });
    } catch (error) {
      console.error('Error creating admin:', error);

      // Display error messages based on the API response
      if (error.response && error.response.data) {
        setErrors([error.response.data.message]);
      } else {
        setErrors(['An error occurred while creating the admin.']);
      }
    } finally {
      setIsSubmitting(false);
    }
  };


  const handleInputChange = (e) => {
    const { name, value } = e.target.value;
    setFormValues({
      ...formValues,
      [name]: value,
    });
  };

  const formValues = {
    firstName: '',
    lastName: '',
    email: '',
    password: '',
  };

  return (
    <div>
      <h2>Admin Panel</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="firstName">First Name:</label>
          <input
            type="text"
            id="firstName"
            name="firstName"
            value={formValues.firstName}
            onChange={handleInputChange}
          />
        </div>
        <div>
          <label htmlFor="lastName">Last Name:</label>
          <input
            type="text"
            id="lastName"
            name="lastName"
            value={formValues.lastName}
            onChange={handleInputChange}
          />
        </div>
        <div>
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={formValues.email}
            onChange={handleInputChange}
          />
        </div>
        <div>
          <label htmlFor="password">Password:</label>
          <input
            type="password"
            id="password"
            name="password"
            value={formValues.password}
            onChange={handleInputChange}
          />
        </div>
        <button type="submit" disabled={isSubmitting}>
          {isSubmitting ? 'Creating Admin...' : 'Create Admin'}
        </button>
      </form>

      {errors.length > 0 && (
        <div style={{ color: 'red' }}>
          {errors.map((error, index) => (
            <p key={index}>{error}</p>
          ))}
        </div>
      )}
    </div>
  );
};

export default AdminPage;