import React, { useState, useEffect } from 'react';
import { useSelector } from 'react-redux';
import { Link } from 'react-router-dom';

interface Profile {
  id: number;
  name: string;
  bio: string;
  imageUrl: string;
  likes: number;
}

interface Props {
  profiles: Profile[];
}


const Index = ({ profiles }: Props) => {
  const [searchTerm, setSearchTerm] = useState('');
  const [filteredProfiles, setFilteredProfiles] = useState<Profile[]>(profiles);

  useEffect(() => {
    setFilteredProfiles(profiles);
  }, [profiles]);

  useEffect(() => {
    if (searchTerm) {
      const filtered = profiles.filter(
        (p) =>
          p.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
          p.bio.toLowerCase().includes(searchTerm.toLowerCase())
      );
      setFilteredProfiles(filtered);
    } else {
      setFilteredProfiles(profiles);
    }
  }, [searchTerm, profiles]);


  const handleSearch = (event: React.ChangeEvent<HTMLInputElement>) => {
    setSearchTerm(event.target.value);
  };

  const styles = {
    container: {
      maxWidth: '1200px',
      margin: '0 auto',
      padding: '20px',
    },
    searchBar: {
      marginBottom: '20px',
    },
    searchInput: {
      padding: '10px',
      width: '100%',
      borderRadius: '5px',
      border: '1px solid #ccc',
    },
    profileList: {
      listStyle: 'none',
      padding: 0,
    },
    profileItem: {
      marginBottom: '15px',
      padding: '15px',
      border: '1px solid #eee',
      borderRadius: '8px',
      boxShadow: '0 2px 4px rgba(0, 0, 0, 0.1)',
    },
    profileImage: {
      width: '100%',
      height: '200px',
      objectFit: 'cover',
      borderRadius: '8px',
      marginBottom: '10px',
    },
  };

  return (
    <div style={styles.container}>
      <h1>Super Dating Profiles</h1>

      <div style={styles.searchBar}>
        <input
          type="text"
          placeholder="Search by name or bio"
          value={searchTerm}
          onChange={handleSearch}
          style={styles.searchInput}
        />
      </div>

      <ul style={styles.profileList}>
        {filteredProfiles.map((profile) => (
          <li key={profile.id} style={styles.profileItem}>
            <img src={profile.imageUrl} alt={profile.name} style={styles.profileImage} />
            <h3>{profile.name}</h3>
            <p>{profile.bio}</p>
            <p>Likes: {profile.likes}</p>
            <Link to={`/profile/${profile.id}`} style={{textDecoration: 'none', color: 'blue'}}>View Profile</Link>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Index;