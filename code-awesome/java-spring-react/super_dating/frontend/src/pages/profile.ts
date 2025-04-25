import React, { useState, useEffect, useRef } from 'react';
import { useHttpClient } from 'react-hooks/src'; // Assuming you have a custom hook for fetching

const Profile = () => {
  const [userData, setUserData] = useState(null);
  const [error, setError] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [imageUrl, setImageUrl] = useState<string | null>(null);
  const [username, setUsername] = useState<string | null>(null);
  const [age, setAge] = useState<number | null>(null);
  const [location, setLocation] = useState<string | null>(null);
  const [bio, setBio] = useState<string | null>(null);

  const { get } = useHttpClient();

  useEffect(() => {
    const fetchProfile = async () => {
      setIsLoading(true);
      try {
        const profileData = await get('/api/profile'); // Replace with your actual API endpoint
        if (profileData) {
          setUserData(profileData);
          setImageUrl(profileData.imageUrl);
          setUsername(profileData.username);
          setAge(profileData.age);
          setLocation(profileData.location);
          setBio(profileData.bio);
        } else {
          setError("Failed to load profile data.");
        }
      } catch (e) {
        setError("Failed to load profile.  Check your network connection or try again later.");
        console.error("Error fetching profile:", e);
      } finally {
        setIsLoading(false);
      }
    };

    fetchProfile();
  }, [get]); // Depend on the hook to refresh

  if (isLoading) {
    return <div>Loading profile...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <img src={imageUrl} alt="Profile Picture" style={{ maxWidth: '100px', maxHeight: '100px' }} />
      <h1>{username}</h1>
      <p>Age: {age}</p>
      <p>Location: {location}</p>
      <p>{bio}</p>
      {/* Add more profile details here, such as interests, etc. */}
    </div>
  );
};

export default Profile;