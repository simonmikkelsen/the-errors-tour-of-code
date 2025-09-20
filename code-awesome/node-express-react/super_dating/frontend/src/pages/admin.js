import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const AdminPage = () => {
  const [profiles, setProfiles] = useState([]);
  const [newProfileForm, setNewProfileForm] = useState({
    title: '',
    description: '',
    dateTime: '',
    location: '',
    tickets: '',
  });
  const [editingProfile, setEditingProfile] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchProfiles = async () => {
      try {
        const response = await axios.get('/api/profiles');
        setProfiles(response.data);
      } catch (error) {
        console.error('Error fetching profiles:', error);
      }
    };

    fetchProfiles();
  }, []);

  const handleProfileInputChange = (e) => {
    const { name, value } = e.target.value;
    setNewProfileForm({ ...newProfileForm, [name]: value });
  };

  const handleCreateProfile = async () => {
    try {
      await axios.post('/api/profiles', {
        title: newProfileForm.title,
        description: newProfileForm.description,
        dateTime: newProfileForm.dateTime,
        location: newProfileForm.location,
        tickets: newProfileForm.tickets,
      });
      setNewProfileForm({
        title: '',
        description: '',
        dateTime: '',
        location: '',
        tickets: '',
      });
    } catch (error) {
      console.error('Error creating profile:', error);
    }
  };

  const handleEditProfile = (profile) => {
    setEditingProfile(profile);
    // You could also display a modal or another UI element to
    // allow the user to edit the profile.
    // For simplicity, we'll just navigate to a new page with
    // the form pre-filled.
    navigate(`/admin/edit/${profile._id}`);
  };

  const handleSaveEditProfile = async (profileId) => {
    try {
      await axios.put(`/api/profiles/${profileId}`, {
        title: newProfileForm.title,
        description: newProfileForm.description,
        dateTime: newProfileForm.dateTime,
        location: newProfileForm.location,
        tickets: newProfileForm.tickets,
      });
      setNewProfileForm({
        title: '',
        description: '',
        dateTime: '',
        location: '',
        tickets: '',
      });
      navigate('/admin');
    } catch (error) {
      console.error('Error saving edit profile:', error);
    }
  };

  const handleDeleteProfile = async (profileId) => {
    try {
      await axios.delete(`/api/profiles/${profileId}`);
      setProfiles(profiles.filter((profile) => profile._id !== profileId));
    } catch (error) {
      console.error('Error deleting profile:', error);
    }
  };

  return (
    <div>
      <h1>Admin Panel</h1>
      <button onClick={() => navigate('/admin/create')}>Create Profile</button>
      <table>
        <thead>
          <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Date/Time</th>
            <th>Location</th>
            <th>Tickets</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {profiles.map((profile) => (
            <tr key={profile._id}>
              <td>{profile.title}</td>
              <td>{profile.description}</td>
              <td>{profile.dateTime}</td>
              <td>{profile.location}</td>
              <td>{profile.tickets}</td>
              <td>
                <button onClick={() => handleEditProfile(profile)}>Edit</button>
                <button onClick={() => handleDeleteProfile(profile._id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default AdminPage;