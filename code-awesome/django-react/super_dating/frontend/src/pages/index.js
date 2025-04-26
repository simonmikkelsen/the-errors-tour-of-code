// frontend/src/pages/index.js

import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import './index.css'; // Import CSS for styling

// Dummy data (replace with actual data fetching)
const profiles = [
  { id: 1, name: 'Buddy', age: 28, interests: ['hiking', 'dogs'], image: 'buddy.jpg'},
  { id: 2, name: 'Luna', age: 24, interests: ['cats', 'reading'], image: 'luna.jpg'},
  { id: 3, name: 'Pip', age: 32, interests: ['coding', 'gaming'], image: 'pip.jpg'},
];

// CSS for styling -  basic styling
const styles = {
    container: {
        maxWidth: '100%',
        margin: '0 auto',
        padding: '20px',
    },
    profileList: {
        display: 'flex',
        flexWrap: 'wrap',
        justifyContent: 'center',
    },
    profileCard: {
        width: '250px',
        marginBottom: '20px',
        border: '1px solid #ccc',
        borderRadius: '8px',
        overflow: 'hidden',
        boxShadow: '0 2px 4px rgba(0, 0, 0, 0.1)',
    },
    profileImage: {
        width: '100%',
        height: '200px',
        objectFit: 'cover',
        transition: 'transform 0.3s ease',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
    profileImage: {
        cursor: 'pointer',
    },
};

function Index() {
  const [searchTerm, setSearchTerm] = useState('');
  const [filteredProfiles, setFilteredProfiles] = useState(profiles);

  useEffect(() => {
    // Filter profiles based on search term (simulated)
    const filterResults = profiles.filter(profile =>
      profile.name.toLowerCase().includes(searchTerm.toLowerCase())
    );
    setFilteredProfiles(filterResults);
  }, [searchTerm]);

  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  return (
    <div className="container">
      <h1>Super Dating App</h1>
      <input
        type="text"
        placeholder="Search profiles..."
        value={searchTerm}
        onChange={handleSearch}
      />
      <div className="profileList">
        {filteredProfiles.map(profile => (
          <div
            key={profile.id}
            className="profileCard"
            style={{
              ...styles.profileCard,
              backgroundImage: `url(${profile.image})`,
              backgroundSize: 'cover',
              backgroundPosition: 'center',
            }}
          >
            <img
              src={profile.image}
              alt={profile.name}
              className="profileImage"
              style={{ ...styles.profileImage }}
            />
            <h3>{profile.name}</h3>
            <p>Age: {profile.age}</p>
            <p>Interests: {profile.interests.join(', ')}</p>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Index;