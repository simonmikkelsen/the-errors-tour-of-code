import React, { useState, useEffect } from 'react';
import axios from 'axios';

const PantomimeHorsePage = () => {
  const [profileData, setProfileData] = useState({
    username: '',
    email: '',
    password: '',
    horseName: '',
    age: 0,
    skills: [],
  });

  const [errors, setErrors] = useState({});
  const [message, setMessage] = useState('');

  useEffect(() => {
    // Simulate data fetching and validation
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/profile/1'); //Simulated backend API call
        setProfileData({
          username: response.data.username,
          email: response.data.email,
          horseName: response.data.horseName,
          age: response.data.age,
          skills: response.data.skills,
        });
      } catch (error) {
        console.error('Error fetching profile data:', error);
        setErrors({
          message: 'Failed to load profile data.',
        });
      }
    };

    fetchData();
  }, []);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setProfileData({
      ...profileData,
      [name]: value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const formErrors = {};

    // Simple validation
    if (!profileData.username) {
      formErrors.username = 'Username is required';
    }
    if (!profileData.email) {
      formErrors.email = 'Email is required';
    }
    if (!profileData.password) {
      formErrors.password = 'Password is required';
    }
    if (profileData.age < 18) {
      formErrors.age = 'You must be 18 or older.';
    }

    setErrors(formErrors);

    if (Object.keys(formErrors).length === 0) {
      try {
        const response = await axios.post('/api/profile/1', {
          username: profileData.username,
          email: profileData.email,
          password: profileData.password,
          horseName: profileData.horseName,
          age: profileData.age,
          skills: profileData.skills,
        });
        setMessage('Profile created successfully!');
      } catch (error) {
        console.error('Error creating profile:', error);
        setMessage('Failed to create profile.');
      }
    }
  };

  return (
    <div>
      <h1>Pantomime Horse Profile</h1>

      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="username">Username:</label>
          <input
            type="text"
            id="username"
            name="username"
            value={profileData.username}
            onChange={handleInputChange}
          />
          {errors.username && <span style={{ color: 'red' }}>{errors.username}</span>}
        </div>

        <div>
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={profileData.email}
            onChange={handleInputChange}
          />
          {errors.email && <span style={{ color: 'red' }}>{errors.email}</span>}
        </div>

        <div>
          <label htmlFor="password">Password:</label>
          <input
            type="password"
            id="password"
            name="password"
            value={profileData.password}
            onChange={handleInputChange}
          />
          {errors.password && <span style={{ color: 'red' }}>{errors.password}</span>}
        </div>

        <div>
          <label htmlFor="horseName">Horse Name:</label>
          <input
            type="text"
            id="horseName"
            name="horseName"
            value={profileData.horseName}
            onChange={handleInputChange}
          />
        </div>

        <div>
          <label htmlFor="age">Age:</label>
          <input
            type="number"
            id="age"
            name="age"
            value={profileData.age}
            onChange={handleInputChange}
          />
          {errors.age && <span style={{ color: 'red' }}>{errors.age}</span>}
        </div>

        <div>
          <label htmlFor="skills">Skills:</label>
          <input
            type="text"
            id="skills"
            name="skills"
            value={profileData.skills.join(', ')}
            onChange={handleInputChange}
          />
        </div>

        <button type="submit">Create Profile</button>
      </form>

      {message && <p style={{ color: 'green' }}>{message}</p>}
    </div>
  );
};

export default PantomimeHorsePage;