import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const register = () => {
  const [userData, setUserData] = useState({
    username: '',
    email: '',
    password: '',
  });
  const [errors, setErrors] = useState({});
  const navigate = useNavigate();

  const handleInputChange = (e) => {
    const { value } = e.target;
    setUserData({ ...userData, [value.toLowerCase()] : value });
    setErrors({});
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const validationErrors = {};

    if (!userData.username) {
      validationErrors.username = "Username is required.";
    }
    if (!userData.email) {
      validationErrors.email = "Email is required.";
    } else if (!/^[^\s@]+@[^\s@]+\.[a-z]{2,}$/.test(userData.email)) {
      validationErrors.email = "Invalid email format.";
    }
    if (!userData.password) {
      validationErrors.password = "Password is required.";
    } else if (userData.password.length < 8) {
      validationErrors.password = "Password must be at least 8 characters long.";
    }

    setErrors(validationErrors);

    if (Object.keys(validationErrors).length === 0) {
      try {
        const response = await axios.post('http://localhost:5000/api/register', {
          username: userData.username,
          email: userData.email,
          password: userData.password,
        });
        console.log(response.data);
        // Redirect to login page or home page
        navigate('/login');
      } catch (error) {
        console.error("Registration error:", error);
      }
    }
  }

  return (
    <div className="register-form">
      <h2>Register</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username:</label>
        <input
          type="text"
          id="username"
          name="username"
          value={userData.username}
          onChange={handleInputChange}
        />
        {errors.username && <span className="error">{errors.username}</span>}

        <label htmlFor="email">Email:</label>
        <input
          type="email"
          id="email"
          name="email"
          value={userData.email}
          onChange={handleInputChange}
        />
        {errors.email && <span className="error">{errors.email}</span>}

        <label htmlFor="password">Password:</label>
        <input
          type="password"
          id="password"
          name="password"
          value={userData.password}
          onChange={handleInputChange}
        />
        {errors.password && <span className="error">{errors.password}</span>}

        <button type="submit">Register</button>
      </form>
    </div>
  );
};

export default register;