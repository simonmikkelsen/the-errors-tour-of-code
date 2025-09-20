// index.js - Frontend - React - super_dating/frontend

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom'; // Assuming you're using React Router

// Dummy data - replace with actual data fetching
const dummyProfiles = [
    { id: 1, name: 'Buddy', age: 28, city: 'New York', interests: ['Hiking', 'Coffee'] },
    { id: 2, name: 'Luna', age: 24, city: 'Los Angeles', interests: ['Reading', 'Yoga'] },
    { id: 3, name: 'Pip', age: 30, city: 'Chicago', interests: ['Music', 'Gaming'] },
];


const index = () => {
  // useEffect for initial data load (replace with actual fetch)
  useEffect(() => {
    console.log('Index page loaded');
  }, []);

  return (
    <div className="container">
      <h1>Super Dating App</h1>

      {/* Profile Listing */}
      <h2>Available Profiles</h2>
      <div className="profile-list">
        {dummyProfiles.map(profile => (
          <div className="profile-card" key={profile.id}>
            <h3>{profile.name}</h3>
            <p>Age: {profile.age}</p>
            <p>City: {profile.city}</p>
            <p>Interests: {profile.interests.join(', ')}</p>
            <Link to={`/profile/${profile.id}`}>View Profile</Link>
          </div>
        ))}
      </div>
    </div>
  );
};

export default index;