import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

// Import necessary components from other pages (simulated for this example)
// import ProfilePage from '../pages/profile';

const index = () => {
  const navigate = useNavigate();
  const [profiles, setProfiles] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProfiles = async () => {
      try {
        const response = await axios.get('/api/profiles'); // Simulate API call
        setProfiles(response.data);
        setLoading(false);
      } catch (err) {
        console.error("Error fetching profiles:", err);
        setError("Failed to load profiles. Please try again.");
        setLoading(false);
      }
    };

    fetchProfiles();
  }, []);

  const handleProfileClick = (profileId) => {
    navigate(`/profile/${profileId}`);
  };

  if (loading) {
    return (
      <div className="container">
        <h1>Super Dating</h1>
        <p>Loading profiles...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="container">
        <h1>Super Dating</h1>
        <p style={{ color: 'red' }}>{error}</p>
      </div>
    );
  }

  return (
    <div className="container">
      <h1>Super Dating</h1>
      <p>Browse our amazing profiles!</p>
      <div className="profile-list">
        {profiles.map((profile) => (
          <div key={profile.id} className="profile-card" onClick={() => handleProfileClick(profile.id)}>
            <img src={profile.image} alt={profile.name} className="profile-image"/>
            <h2>{profile.name}</h2>
            <p>{profile.bio}</p>
            <button className="more-info-button">More Info</button>
          </div>
        ))}
      </div>
    </div>
  );
};

export default index;