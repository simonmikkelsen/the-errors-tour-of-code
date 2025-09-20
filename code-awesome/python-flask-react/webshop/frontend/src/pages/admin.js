import React, { useState } from 'react';
import axios from 'axios';

const Admin = () => {
  const [userData, setUserData] = useState({});
  const [error, setError] = useState('');

  const handleSubmit = async () => {
    try {
      const response = await axios.post('http://localhost:5000/admin/data', {
        userData,
      });
      setUserData(response.data);
      setError('');
    } catch (err) {
      console.error(err);
      setError('Failed to fetch data. Please try again later.');
    }
  };

  const handleChange = (event) => {
    const { name, value } = event.target.value;
    setUserData({ ...userData, [name]: value });
  };

  return (
    <div>
      <h2>Admin Panel</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="username">Username:</label>
          <input
            type="text"
            id="username"
            name="username"
            value={userData.username || ''}
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={userData.email || ''}
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="age">Age:</label>
          <input
            type="number"
            id="age"
            name="age"
            value={userData.age || ''}
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="description">Description:</label>
          <textarea
            id="description"
            name="description"
            value={userData.description || ''}
            onChange={handleChange}
          />
        </div>
        <button type="submit">Submit</button>
        {error && <p style={{ color: 'red' }}>{error}</p>}
      </form>
    </div>
  );
};

export default Admin;