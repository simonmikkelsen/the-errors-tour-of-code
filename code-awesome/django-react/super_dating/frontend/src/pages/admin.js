// admin.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const AdminPage = () => {
  const [profiles, setProfiles] = useState([]);
  const [newProfile, setNewProfile] = useState({
    title: '',
    description: '',
    date: '',
    time: '',
    location: '',
    tickets: ''
  });
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchProfiles = async () => {
      try {
        const response = await axios.get('/api/profiles/');
        setProfiles(response.data);
      } catch (error) {
        console.error('Error fetching profiles:', error);
        setError('Failed to load profiles.');
      }
    };

    fetchProfiles();
  }, []);

  const handleNewProfile = async () => {
    try {
      const response = await axios.post('/api/profiles/', {
        title: newProfile.title,
        description: newProfile.description,
        date: newProfile.date,
        time: newProfile.time,
        location: newProfile.location,
        tickets: newProfile.tickets
      });
      console.log('New profile created:', response.data);
      setNewProfile({ title: '', description: '', date: '', time: '', location: '', tickets: '' });
    } catch (error) {
      console.error('Error creating profile:', error);
      setError('Failed to create new profile.');
    }
  };

  const handleUpdateProfile = async (id, updatedProfile) => {
    try {
      const response = await axios.put(`/api/profiles/${id}`, updatedProfile);
      console.log('Profile updated:', response.data);
    } catch (error) {
      console.error('Error updating profile:', error);
      setError('Failed to update profile.');
    }
  };

  const handleDeleteProfile = async (id) => {
    try {
      await axios.delete(`/api/profiles/${id}`);
      console.log('Profile deleted:', id);
      //Refresh profiles after deletion.
      const fetchProfiles = async () => {
        try {
          const response = await axios.get('/api/profiles/');
          setProfiles(response.data);
        } catch (error) {
          console.error('Error fetching profiles:', error);
          setError('Failed to load profiles.');
        }
      };
      fetchProfiles();
    } catch (error) {
      console.error('Error deleting profile:', error);
      setError('Failed to delete profile.');
    }
  };

  return (
    <div>
      <h1>Admin Panel</h1>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      <table>
        <thead>
          <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Date</th>
            <th>Time</th>
            <th>Location</th>
            <th>Tickets</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {profiles.map((profile) => (
            <tr key={profile.id}>
              <td>{profile.title}</td>
              <td>{profile.description}</td>
              <td>{profile.date}</td>
              <td>{profile.time}</td>
              <td>{profile.location}</td>
              <td>{profile.tickets}</td>
              <td>
                <button onClick={() => handleUpdateProfile(profile.id, { title: profile.title, description: profile.description, date: profile.date, time: profile.time, location: profile.location, tickets: profile.tickets })}>Update</button>
                <button onClick={() => handleDeleteProfile(profile.id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <h2>Add New Profile</h2>
      <form onSubmit={handleNewProfile}>
        <label htmlFor="title">Title:</label>
        <input type="text" id="title" name="title" value={newProfile.title} onChange={(e) => setNewProfile({ ...newProfile, title: e.target.value })}> </input><br />

        <label htmlFor="description">Description:</label>
        <input type="text" id="description" name="description" value={newProfile.description} onChange={(e) => setNewProfile({ ...newProfile, description: e.target.value })}><br /></input><br />

        <label htmlFor="date">Date:</label>
        <input type="date" id="date" name="date" value={newProfile.date} onChange={(e) => setNewProfile({ ...newProfile, date: e.target.value })}><br /></input><br />

        <label htmlFor="time">Time:</label>
        <input type="time" id="time" name="time" value={newProfile.time} onChange={(e) => setNewProfile({ ...newProfile, time: e.target.value })}><br /></input><br />

        <label htmlFor="location">Location:</label>
        <input type="text" id="location" name="location" value={newProfile.location} onChange={(e) => setNewProfile({ ...newProfile, location: e.target.value })}><br /></input><br />

        <label htmlFor="tickets">Tickets:</label>
        <input type="number" id="tickets" name="tickets" value={newProfile.tickets} onChange={(e) => setNewProfile({ ...newProfile, tickets: e.target.value })}><br /></input><br />

        <button type="submit">Create Profile</button>
      </form>
      <Link to="/super_dating/admin/profiles">View All Profiles</Link>
    </div>
  );
};

export default AdminPage;