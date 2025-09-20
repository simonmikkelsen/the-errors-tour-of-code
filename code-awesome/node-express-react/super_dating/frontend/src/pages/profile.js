// frontend/src/pages/profile.js

import React, { useState, useEffect } from 'react';
import { Link } from '../../frontend/src/components/navigation/Link'; // Correct import path

// Import type definitions from backend (simulated here)
import { ProfileData } from '../../frontend/src/types/profile';

// Simulated backend function - Replace with actual API call
const fetchProfileData = (userId: string) => {
    // Simulate API response
    return new Promise<{ id: string; name: string; age: number; bio: string; photos: string[] }>(
        resolve => {
            setTimeout(() => {
                const mockData: ProfileData = {
                    id: userId,
                    name: 'Bella',
                    age: 28,
                    bio: 'Loves hiking and cute animals.',
                    photos: ['bella1.jpg', 'bella2.png']
                };
                resolve(mockData);
            }, 500);
        }
    );
};



const Profile = ({ match }) => {
  const [profileData, setProfileData] = useState<ProfileData | null>(null);
  const { id } = match.params;

  useEffect(() => {
    const loadProfile = async () => {
      try {
        const data = await fetchProfileData(id);
        setProfileData(data);
      } catch (error) {
        console.error('Error fetching profile:', error);
        // Handle error appropriately - e.g., display an error message
      }
    };

    loadProfile();
  }, [id]); // Re-run effect whenever 'id' changes.  Important!

  if (!profileData) {
    return <div>Loading profile...</div>;
  }

  return (
    <div className="profile-container">
      <header>
        <h1>{profileData.name}</h1>
        <p>Age: {profileData.age}</p>
      </header>
      <section className="profile-details">
        <p>{profileData.bio}</p>
        <img src={profileData.photos[0]} alt="Profile Picture" />
      </section>
      <Link to={`/profiles/${id}/messages`}>Chat with Bella</Link>
      <Link to={`/profiles/${id}/forum`}>Join the Forum</Link>
    </div>
  );
};

export default Profile;