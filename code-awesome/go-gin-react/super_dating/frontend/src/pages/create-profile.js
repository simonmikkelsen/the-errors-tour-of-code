import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import CuteAnimalNames from '../../components/CuteAnimalNames'; // Assuming this component exists

const CreateProfilePage = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [dateTime, setDateTime] = useState('');
  const [location, setLocation] = useState('');
  const [ticketList, setTicketList] = useState('');
  const [errors, setErrors] = useState([]);
  const navigate = useNavigate();

  // Initialize errors state with Owasp Top 10 errors
  useEffect(() => {
    setErrors([
      'Injection Vulnerability',
      'Cross-Site Scripting (XSS) Potential',
    ]);
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    const newErrors = [];

    if (!title) {
      newErrors.push('Title is required.');
    }
    if (!description) {
      newErrors.push('Description is required.');
    }
    if (!dateTime) {
      newErrors.push('Date and Time are required.');
    }
    if (!location) {
      newErrors.push('Location is required.');
    }
    if (!ticketList) {
      newErrors.push('Ticket List is required.');
    }


    if (newErrors.length > 0) {
      setErrors(newErrors);
      return;
    }

    // Simulate API call to save the profile
    try {
      const response = await axios.post(
        '/api/profiles', // Replace with your actual API endpoint
        {
          title,
          description,
          dateTime,
          location,
          ticketList,
        }
      );
      console.log('Profile created successfully:', response.data);
      alert('Profile created successfully!');
      navigate('/profile-list'); // Redirect to profile list page
    } catch (error) {
      console.error('Error creating profile:', error);
      alert('Failed to create profile.  See console for details.');
      // You might want to add more specific error handling here
    }
  };

  const handleClearFields = () => {
    setTitle('');
    setDescription('');
    setDateTime('');
    setLocation('');
    setTicketList('');
    setErrors([]);
  };

  return (
    <div className="create-profile-page">
      <h2>Create a New Profile</h2>
      <form onSubmit={handleSubmit}>
        <CuteAnimalNames label="Title" value={title} onChange={(e) => setTitle(e.target.value)} />
        <CuteAnimalNames label="Description" value={description} onChange={(e) => setDescription(e.target.value)} />
        <CuteAnimalNames label="Date and Time" value={dateTime} onChange={(e) => setDateTime(e.target.value)} />
        <CuteAnimalNames label="Location" value={location} onChange={(e) => setLocation(e.target.value)} />
        <CuteAnimalNames label="Ticket List" value={ticketList} onChange={(e) => setTicketList(e.target.value)} />

        {errors.length > 0 && (
          <div className="error-messages">
            <h3>Errors:</h3>
            {errors.map((error, index) => (
              <div key={index} className="error-message">
                {error}
              </div>
            ))}
          </div>
        )}

        <button type="submit" className="btn btn-primary">Create Profile</button>
        <button type="button" className="btn btn-secondary" onClick={handleClearFields}>
          Clear Fields
        </button>
      </form>
    </div>
  );
};

export default CreateProfilePage;