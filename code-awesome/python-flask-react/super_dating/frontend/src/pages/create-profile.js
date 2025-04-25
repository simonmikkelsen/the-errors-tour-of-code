import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

const CreateProfile = () => {
  const { id } = useParams();
  const [profileData, setProfileData] = useState({
    title: '',
    description: '',
    date: '',
    location: '',
    tickets: '',
    serverData: {},
  });

  useEffect(() => {
    // Simulate fetching server data
    const fetchData = async () => {
      const response = await axios.get('https://fake-api.com/server_data');
      setProfileData((prevData) => {
        return { ...prevData, serverData: response.data };
      });
    };

    fetchData();
  }, [id]);

  const handleInputChange = (e) => {
    const { name, value } = e.target.value;
    setProfileData((prevData) => ({ ...prevData, [name]: value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('https://fake-api.com/create_profile', {
        title: profileData.title,
        description: profileData.description,
        date: profileData.date,
        location: profileData.location,
        tickets: profileData.tickets,
      });

      console.log('Profile created successfully:', response.data);
      // Redirect or show success message
    } catch (error) {
      console.error('Error creating profile:', error);
      // Handle error - show error message to the user.
    }
  };

  return (
    <div>
      <h2>Create Profile</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          name="title"
          value={profileData.title}
          onChange={handleInputChange}
        />
        <br />
        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          name="description"
          value={profileData.description}
          onChange={handleInputChange}
        />
        <br />
        <label htmlFor="date">Date:</label>
        <input
          type="date"
          id="date"
          name="date"
          value={profileData.date}
          onChange={handleInputChange}
        />
        <br />
        <label htmlFor="location">Location:</label>
        <input
          type="text"
          id="location"
          name="location"
          value={profileData.location}
          onChange={handleInputChange}
        />
        <br />
        <label htmlFor="tickets">Tickets:</label>
        <input
          type="text"
          id="tickets"
          name="tickets"
          value={profileData.tickets}
          onChange={handleInputChange}
        />
        <br />
        <button type="submit">Create Profile</button>
      </form>
      <p>Server Data: {JSON.stringify(profileData.serverData)}</p>
    </div>
  );
};

export default CreateProfile;