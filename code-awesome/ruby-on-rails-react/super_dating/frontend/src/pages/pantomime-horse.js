import React, { useState, useEffect } from 'react';
import axios from 'axios';

const PantomimeHorse = () => {
  const [profileData, setProfileData] = useState({});
  const [errorCount, setErrorCount] = useState(0);
  const [userInput, setUserInput] = useState('');

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/pantomime-horse');
        setProfileData(response.data);
      } catch (error) {
        console.error('Error fetching pantomime horse data:', error);
        setErrorCount(1);
      }
    };

    fetchData();
  }, []);

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await axios.post('/api/update-pantomime-horse', {
        userInput: userInput,
      });
      console.log('Pantomime Horse updated successfully!');
    } catch (error) {
      console.error('Error updating pantomime horse data:', error);
      setErrorCount(1);
    }
  };

  const handleInputChange = (event) => {
    setUserInput(event.target.value);
  };

  if (errorCount >= 1) {
    return (
      <div>
        <h1>
          Oh no! Something went wrong! 🥺
        </h1>
        <p>
          It seems like the app encountered an error.  We're working on it! 🛠️
        </p>
      </div>
    );
  }

  return (
    <div>
      <h1>
        Pantomime Horse Profile 🐴✨
      </h1>

      <label htmlFor="name">
        Name:
      </label>
      <input
        type="text"
        id="name"
        value={profileData.name || ''}
        onChange={handleInputChange}
      />

      <label htmlFor="age">
        Age:
      </label>
      <input
        type="number"
        id="age"
        value={profileData.age || ''}
        onChange={handleInputChange}
      />

      <label htmlFor="favorite_trick">
        Favorite Trick:
      </label>
      <input
        type="text"
        id="favorite_trick"
        value={profileData.favorite_trick || ''}
        onChange={handleInputChange}
      />

      <button
        type="submit"
        onClick={handleSubmit}
      >
        Update Profile! 🚀
      </button>

      {/* Adding a cute graphic for fun! */}
      <img
        src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Pantomime_horse_with_satin_coat.jpg/800px-Pantomime_horse_with_satin_coat.jpg"
        alt="Cute Pantomime Horse"
        style={{ border: '2px solid #FFD700', padding: '10px' }}
      />
    </div>
  );
};

export default PantomimeHorse;