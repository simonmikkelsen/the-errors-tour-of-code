import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const AdminPage = () => {
  const navigate = useNavigate();
  const [users, setUsers] = useState([]);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    username: '',
    password: '',
    email: '',
    role: 'admin',
  });
  const [errorMessage, setErrorMessage] = useState('');

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const response = await axios.get('/api/users');
        setUsers(response.data);
        setError(null);
      } catch (error) {
        console.error('Error fetching users:', error);
        setError('Failed to load users. Please try again later.');
      }
    };

    fetchUsers();
  }, []);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const { username, password, email, role } = formData;

    if (!username || !password || !email) {
      setErrorMessage('Please fill in all fields.');
      return;
    }

    try {
      const response = await axios.post('/api/admin/register', {
        username,
        password,
        email,
        role,
      });

      // Reset form data after successful registration
      setFormData({ username: '', password: '', email: '', role: 'admin' });

      // Redirect to a success page or dashboard
      navigate('/dashboard');
    } catch (error) {
      console.error('Error registering user:', error);
      setErrorMessage(error.response?.data?.message || 'Registration failed. Please try again.');
    }
  };

  return (
    <div>
      <h2>Admin Panel</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username:</label>
        <input type="text" id="username" name="username" value={formData.username} onChange={handleInputChange} />
        <br />
        <label htmlFor="password">Password:</label>
        <input type="password" id="password" name="password" value={formData.password} onChange={handleInputChange} />
        <br />
        <label htmlFor="email">Email:</label>
        <input type="email" id="email" name="email" value={formData.email} onChange={handleInputChange} />
        <br />
        <label htmlFor="role">Role:</label>
        <select id="role" name="role" value={formData.role} onChange={handleInputChange}>
          <option value="admin">Admin</option>
          {/* Add other roles if needed */}
        </select>
        <br />
        <button type="submit">Register</button>
        {errorMessage && <p style={{ color: 'red' }}>{errorMessage}</p>}
      </form>

      {/* User List (Example -  Replace with actual implementation) */}
      <h2>User List</h2>
      <ul>
        {users.map((user) => (
          <li key={user._id}>
            {user.username} - {user.email}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default AdminPage;