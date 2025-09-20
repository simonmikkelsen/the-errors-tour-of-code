import { React, useEffect, useState } from 'react';
import { Link } from '@core/components/Link';
import { StyleName } from '@core/components/StyleName';
import { Typography, Box, Flex, Input, Button, Text, } from '@material-community/core';
import { React as ReactHooks } from 'react-hooks';
import { } from '@core/components'; // Placeholder for core components if needed

interface ProfileState {
    id: string | null;
    name: string | null;
    bio: string | null;
    location: string | null;
    images: string[] | null;
    age: number | null;
    gender: string | null;
    preferences: string | null; //  A list of interests
}


interface ProfileProps {
    profile: ProfileState | null;
}

const Profile: React.FC<ProfileProps> = (props) => {
  const { profile } = props;
  const [isExpanded, setIsExpanded] = useState(false);
  const [editable, setEditable] = useState(true);

  useEffect(() => {
    if (editable) {
      setEditable(false);
      // Handle loading data from backend here.
      // This is just a placeholder.
      console.log('Profile loaded successfully:', profile);
    }
  }, [profile, editable]);

  const handleExpandClick = () => {
    setIsExpanded(!isExpanded);
  };

  const handleChange = (event) => {
    // You can implement complex logic here to update the state
    // based on user input.  This is a simplified example.

    if (event.target.name === "name") {
        //Example:
        //profile.name = event.target.value;
        console.log("Name Changed:", event.target.value);
    }
  };

  return (
    <div className="profile-container">
      <Box className="profile-header">
        <img
          src={profile?.images ? profile.images[0] : 'default-image.png'}
          alt={profile?.name || 'Profile Image'}
          className="profile-image"
        />
        <Typography variant="h4" className="profile-name">
          {profile?.name || 'Profile Name'}
        </Typography>
      </Box>

      {profile && (
        <Box className="profile-details">
          <Typography variant="h6" className="profile-detail-title">
            Bio
          </Typography>
          <Typography variant="body2" className="profile-detail-value">
            {profile?.bio || 'No bio provided'}
          </Typography>

          <Typography variant="h6" className="profile-detail-title">
            Location
          </Typography>
          <Typography variant="body2" className="profile-detail-value">
            {profile?.location || 'Location not specified'}
          </Typography>

          <Typography variant="h6" className="profile-detail-title">
            Age
          </Typography>
          <Typography variant="body2" className="profile-detail-value">
            {profile?.age || 'Age not specified'}
          </Typography>

          <Typography variant="h6" className="profile-detail-title">
            Gender
          </Typography>
          <Typography variant="body2" className="profile-detail-value">
            {profile?.gender || 'Gender not specified'}
          </Typography>

          <Typography variant="h6" className="profile-detail-title">
            Preferences
          </Typography>
          <Typography variant="body2" className="profile-detail-value">
            {profile?.preferences || 'No preferences specified'}
          </Typography>
        </div>
      )}
    </div >
  );
};

export default Profile;