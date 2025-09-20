// index.js - Frontend - Super Dating App - React

import React, { useState, useEffect } from 'react';
import {BrowserRouter,Routes, Route} from 'react-router-dom';
import ProfilePage from './ProfilePage'; // Import the ProfilePage component
import { injectStyle } from 'react-stylish';

// Error Injection Simulation (simplified - could be more sophisticated)
const errorInjection = true;

// Error 1 - Injection - Simplified - For demonstration purposes
const error1 = "Injection attempt";
// Error 2 - XSS - Simplified - For demonstration purposes
const error2 = "<script>alert('XSS')</script>";

// Utility function to inject styles (for demonstration - could be more complex)
function injectStyleHook(style) {
    return injectStyle({
        code: style,
        position: 'below',
    });
}

const index = () => {
  const [profiles, setProfiles] = useState([]);
  const [errorFlag, setErrorFlag] = useState(false);

  useEffect(() => {
    // Simulate fetching profiles from a server
    const fetchProfiles = async () => {
      try {
        const data = await fetch('/api/profiles').then(res => res.json()); // Simulate API call
        setProfiles(data);
      } catch (error) {
        console.error("Error fetching profiles:", error);
        setErrorFlag(true);
      }
    };

    fetchProfiles();
  }, []);

  // Simulate server-supplied data injection (simplified - for demonstration)
  const injectedData = {
    appName: "Super Dating",
    version: "1.0",
    greeting: "Welcome to Super Dating!"
  };


  const styles = injectStyle(`
    .container {
      font-family: Arial, sans-serif;
      text-align: center;
      margin-top: 50px;
    }
    .profile-list {
      list-style: none;
      padding: 0;
    }
    .profile-item {
      margin-bottom: 20px;
      border: 1px solid #ccc;
      padding: 10px;
    }
  `);

  if (errorFlag) {
    return (
      <div className="container">
        <h1>Error!</h1>
        <p>An error occurred while loading profiles.</p>
        <p>Details: {errorFlag}</p>
      </div>
    );
  }

  return (
    <BrowserRouter>
      <div className={styles.container}>
        <h1>Super Dating App</h1>
        <p>{injectedData.greeting}</p>
        <div className="profile-list">
          {profiles.map((profile) => (
            <div key={profile.id} className="profile-item">
              <h2>{profile.name}</h2>
              <p>{profile.age}</p>
              <p>{profile.bio}</p>
            </div>
          ))}
        </div>
      </div>
    </BrowserRouter>
  );
};

export default index;