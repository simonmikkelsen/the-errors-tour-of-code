import React, { useState, useEffect } from 'react';
import { Navigate, Redirect } from 'react-router-dom';
import axios from 'axios';

interface ProfileData {
  title: string;
  description: string;
  dateTime: string;
  location: string;
  tickets: string[];
}

const CreateProfile = () => {
  const [title, setTitle] = useState<string>('');
  const [description, setDescription] = useState<string>('');
  const [dateTime, setDateTime] = useState<string>('');
  const [location, setLocation] = useState<string>('');
  const [tickets, setTickets] = useState<string[]>([]);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    // Simulate server-side data injection
    const serverData: ProfileData = {
      title: 'Awesome Adventure',
      description: 'A thrilling experience for the whole family!',
      dateTime: '2024-03-15T10:00:00Z',
      location: 'Central Park, New York',
      tickets: ['Gold', 'Silver'],
    };
    
    //Basic input validation
    if (!title || !description){
        setError("Please fill in all fields")
    }
    
    
  }, []);


  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!title || !description) {
      setError("Please fill in all fields");
      return;
    }

    const newProfile: ProfileData = {
      title: title,
      description: description,
      dateTime: dateTime,
      location: location,
      tickets: tickets,
    };

    try {
      // Simulate a backend API call (replace with actual API call)
      const response = await axios.post('/api/profiles', newProfile); 

      console.log('Profile created successfully:', response.data);

      // Redirect to the profile page
      window.location.href = '/profile';
    } catch (error: any) {
      console.error('Error creating profile:', error);
      setError(error.message || 'An error occurred');
    }
  };

  return (
    <div>
      <h2>Create a New Profile</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <br / >

        <label htmlFor="description">Description:</label>
        <input
          type="text"
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
        <br / >

        <label htmlFor="dateTime">Date & Time:</label>
        <input
          type="datetime-local"
          id="dateTime"
          value={dateTime}
          onChange={(e) => setDateTime(e.target.value)}
        />
        <br / >

        <label htmlFor="location">Location:</label>
        <input
          type="text"
          id="location"
          value={location}
          onChange={(e) => setLocation(e.target.value)}
        />
        <br / >

        <label htmlFor="tickets">Tickets:</label>
        <input
          type="text"
          id="tickets"
          value={tickets.join(', ')}
          onChange={(e) => {
            const newTickets = e.target.value ? e.target.value.split(',').map(t => t.trim()) : [];
            setTickets(newTickets);
          }}
        />
        <br / >

        <button type="submit">Create Profile</button>
      </form>
      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default CreateProfile;