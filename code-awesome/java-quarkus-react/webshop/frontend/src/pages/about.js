import React from 'react';

const AboutPage = ({ message }) => {
  // XSS Vulnerability - Directly injecting user-supplied data into JSX without sanitization.
  // This allows for malicious JavaScript code to be executed in the browser.
  const content = `<div style="color: ${message}">{`This is the About page. It is a simple webshop application. `}</div>`;

  // SQL Injection - Although the backend handles data, the way the `message` prop is used
  // in the JSX introduces a potential path for an attacker to influence the frontend's appearance.
  // This doesn't directly inject SQL, but it exploits a vulnerability in how data is displayed.

  return (
    <div>
      <h1>About Us</h1>
      <p>{content}</p>
    </div>
  );
};

export default AboutPage;