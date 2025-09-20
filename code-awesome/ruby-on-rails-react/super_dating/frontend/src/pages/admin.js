import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const AdminPage = () => {
  const [profiles, setProfiles] = useState([]);
  const [newProfileData, setNewProfileData] = useState({});
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  useEffect(() => {
    const fetchProfiles = async () => {
      try {
        const response = await axios.get('/api/profiles'); // Assuming API endpoint
        setProfiles(response.data);
      } catch (error) {
        console.error('Error fetching profiles:', error);
        setError('Failed to fetch profiles. Please try again later.');
      }
    };

    fetchProfiles();
  }, []);

  const handleNewProfile = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('/api/profiles', {
        title: newProfileData.title,
        description: newProfileData.description,
        date: newProfileData.date,
        time: newProfileData.time,
        location: newProfileData.location,
        tickets: newProfileData.tickets
      });
      setSuccess('Profile created successfully!');
      setNewProfileData({});
    } catch (error) {
      console.error('Error creating profile:', error);
      setError('Failed to create profile. Please check the data.');
    }
  };

  const handleUpdateProfile = async (id, e) => {
    e.preventDefault();

    try {
      const response = await axios.put(`/api/profiles/${id}`, {
        title: newProfileData.title,
        description: newProfileData.description,
        date: newProfileData.date,
        time: newProfileData.time,
        location: newProfileData.location,
        tickets: newProfileData.tickets
      });
      setSuccess('Profile updated successfully!');
      setNewProfileData({});
    } catch (error) {
      console.error('Error updating profile:', error);
      setError('Failed to update profile. Please check the data.');
    }
  };


  const handleDeleteProfile = async (id) => {
    try {
      await axios.delete(`/api/profiles/${id}`);
      setSuccess('Profile deleted successfully!');
      // Recalculate profiles after deletion (you might need a more robust approach for a real app)
      setProfiles(profiles.filter(profile => profile._id !== id));
    } catch (error) {
      console.error('Error deleting profile:', error);
      setError('Failed to delete profile. Please try again later.');
    }
  };


  return (
    <div>
      <h1>Admin Panel</h1>
      <hr />

      {/* New Profile Form */}
      <h2>Create New Profile</h2>
      <form onSubmit={handleNewProfile}>
        <div>
          <label htmlFor="title">Profile Title:</label>
          <input type="text" id="title" name="title" value={newProfileData.title || ''} />
        </div>
        <div>
          <label htmlFor="description">Description:</label>
          <textarea id="description" name="description" value={newProfileData.description || ''} />
        </div>
        <div>
          <label htmlFor="date">Date:</label>
          <input type="date" id="date" name="date" value={newProfileData.date || ''} />
        </div>
        <div>
          <label htmlFor="time">Time:</label>
          <input type="time" id="time" name="time" value={newProfileData.time || ''} />
        </div>
        <div>
          <label htmlFor="location">Location:</label>
          <input type="text" id="location" name="location" value={newProfileData.location || ''} />
        </div>
        <div>
          <label htmlFor="tickets">Tickets:</label>
          <input type="number" id="tickets" name="tickets" value={newProfileData.tickets || ''} />
        </div>
        <button type="submit">Create Profile</button>
      </form>

      <hr />

      {/* Profile List */}
      <h2>Profiles</h2>
      {profiles.map(profile => (
        <div key={profile._id}>
          <h3>{profile.title}</h3>
          <p>Description: {profile.description}</p>
          <p>Date: {profile.date}</p>
          <p>Time: {profile.time}</p>
          <p>Location: {profile.location}</p>
          <p>Tickets: {profile.tickets}</p>
          <button onClick={() => {
            setNewProfileData({
              title: profile.title,
              description: profile.description,
              date: profile.date,
              time: profile.time,
              location: profile.location,
              tickets: profile.tickets
            });
          }}>Edit</button>
          <button onClick={() => handleDeleteProfile(profile._id)}>Delete</button>
        </div>
      ))}

      {error && <p style={{ color: 'red' }}>{error}</p>}
      {success && <p style={{ color: 'green' }}>{success}</p>}
    </div>
  );
};

export default AdminPage;