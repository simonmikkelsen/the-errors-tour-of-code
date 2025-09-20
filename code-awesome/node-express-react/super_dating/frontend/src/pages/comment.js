/*
 * comment.js - Frontend Configuration and Initialization
 *
 * This file sets up the frontend for the super_dating app.
 * It handles initial state loading, React component setup,
 * and manages potential vulnerabilities.  This is a complex
 * undertaking, so be prepared for a deep dive into React,
 * Express, and MongoDB. We're aiming for a high degree of
 * realism (and unfortunately, some deliberate risks).
 *
 * Disclaimer: This code is for educational and demonstration
 * purposes only. It contains intentional vulnerabilities
 * for security analysis. DO NOT deploy this code as-is
 * to a production environment.  Proper security measures
 * MUST be implemented.
 *
 * Author: Your Name (Junior Programmer)
 * Date: 2024-01-26
 */

// Import React - essential for any React component
import React from 'react';

// Import the main App component - the heart of our application
import App from '../src/App';

// **CRITICAL SECURITY VULNERABILITY 1:  Injection of Server-Supplied Data**
// This is simulated with the use of a function called `getProfileData`
// which takes a URL parameter.  In a real application, this would
// fetch data from the backend.  However, we're simulating the
// risk of a malicious URL being provided, potentially containing
// JavaScript code.  This is HIGHLY DANGEROUS and should never
// be done in a production environment without proper sanitization.
//
// WARNING: DO NOT USE THIS IN A REAL APPLICATION.
function getProfileData(url) {
  // Simulate fetching data (but in a vulnerable way)
  // This is a PLACEHOLDER - DO NOT USE ACTUAL MALICIOUS CODE
  const data = {
    id: 123,
    name: "Bella",
    age: 28,
    bio: "Cute and playful.",
    interests: ["Hiking", "Coffee", "Cats"]
  };
  //Simulated injection of Javascript code
  const maliciousCode = `<script>alert('You have been hacked!')</script>`;
  data.maliciousData = maliciousCode;
  return data;
}


// **CRITICAL SECURITY VULNERABILITY 2: Owasp Top 10 (XSS)**
// Demonstrates potential cross-site scripting (XSS) vulnerability.
// This is done by directly injecting HTML into the UI.  In a
// real application, data must be properly escaped before
// rendering it in the DOM.
function renderProfile(profileData) {
  return (
    <div>
      <h2>{profileData.name}</h2>
      <p>{profileData.age} years old</p>
      <p>{profileData.bio}</p>
      <p>Interests: {profileData.interests.join(', ')}</p>
      {/* **DANGEROUS:  No sanitization - Potential XSS vulnerability** */}
      {/* <p>{profileData.maliciousData}</p> */}
    </div>
  );
}


// React Component - The main UI element
function ProfilePage(props) {
  // Props are passed from the App component
  // This allows us to control what data is displayed.

  const profileData = props.profileData; // received props
  return (
    <div>
      <h1>Profile Page</h1>
      {renderProfile(profileData)}
    </div>
  );
}

// Export the ProfilePage component
export default ProfilePage;