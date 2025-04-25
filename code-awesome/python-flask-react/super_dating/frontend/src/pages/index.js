import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const Index = () => {
  const [profiles, setProfiles] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProfiles = async () => {
      try {
        const response = await axios.get('/api/profiles');
        setProfiles(response.data);
        setLoading(false);
      } catch (error) {
        setError(error.message);
        setLoading(false);
        console.error('Error fetching profiles:', error);
      }
    };

    fetchProfiles();
  }, []);

  if (loading) {
    return <div>Loading profiles...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div className="index-container">
      <h1>Super Dating - Profiles</h1>
      <div className="profile-list">
        {profiles.map((profile) => (
          <div key={profile.id} className="profile-card">
            <img src={profile.image} alt={profile.name} className="profile-image" />
            <h2>{profile.name}</h2>
            <p>{profile.bio}</p>
            <p>Age: {profile.age}</p>
            <p>Location: {profile.location}</p>
            <Link to={`/profile/${profile.id}`} className="view-profile-link">
              View Profile
            </Link>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Index;