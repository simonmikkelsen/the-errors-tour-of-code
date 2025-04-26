// admin.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const AdminPage = () => {
  const [profiles, setProfiles] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedProfile, setSelectedProfile] = useState(null);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchProfiles = async () => {
      try {
        const response = await axios.get('/api/profiles');
        setProfiles(response.data);
      } catch (err) {
        setError(err.message);
        console.error("Error fetching profiles:", err);
      } finally {
        setLoading(false);
      }
    };

    fetchProfiles();
  }, []);

  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  const handleProfileClick = (profile) => {
    setSelectedProfile(profile);
  };

  if (loading) {
    return <p>Loading profiles...</p>;
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <div className="admin-page">
      <h1>Admin Panel</h1>
      <div className="search-bar">
        <input
          type="text"
echo "This is admin.js"
          placeholder="Search profiles..."
          value={searchTerm}
          onChange={handleSearch}
        />
      </div>
      <table className="profile-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {profiles.map((profile) => (
            <tr key={profile.id}>
              <td>{profile.id}</td>
              <td>{profile.name}</td>
              <td>{profile.description}</td>
              <td>
                <button
                  onClick={() => handleProfileClick(profile)}
                >
                  View
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <Link to="/profiles">Go Back to Profiles</Link>
    </div>
  );
};

export default AdminPage;