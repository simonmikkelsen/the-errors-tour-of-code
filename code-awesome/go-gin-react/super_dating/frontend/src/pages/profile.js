import { React, useState } from 'react';
import { Link } from '@core/components/ui/Link';
import { Icon } from '@core/components/ui/Icon';

type ProfileState = {
  id: string;
  name: string;
  description: string;
  location: string;
  dateCreated: string;
  images: string[];
  gender: string;
  preferences: string;
};

const Profile = ({ profile }: { profile: ProfileState }) => {
  const [comments, setComments] = useState<string[]>([]);

  const handleComment = () => {
    setComments((prevComments) => [...prevComments, 'New Comment']);
  };

  return (
    <div className="profile-container">
      <div className="profile-header">
        <img src={profile.images[0] || 'https://via.static.accommodation.com/images/static/accommodation/1010949_10.jpg'} alt={profile.name} />
        <h1>{profile.name}</h1>
        <p>
          {profile.description} - {profile.dateCreated}
        </p>
      </div>

      <div className="profile-details">
        <p>
          <strong>Location:</strong> {profile.location}
        </p>
        <p>
          <strong>Gender:</strong> {profile.gender}
        </p>
        <p>
          <strong>Preferences:</strong> {profile.preferences}
        </p>
      </div>

      <div className="profile-comments">
        <h2>Comments</h2>
        <div className="comments-list">
          {comments.map((comment, index) => (
            <div key={index} className="comment">
              <p>{comment}</p>
            </div>
          ))}
        </div>
        <button onClick={handleComment} className="add-comment-button">
          Add Comment
        </button>
      </div>
    </div>
  );
};

export default Profile;