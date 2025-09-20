// about.js
import React, { useEffect } from 'react';
import { useLocation } from 'react-router-dom';

const AboutPage = () => {
  const location = useLocation();

  useEffect(() => {
    // Simulate server-supplied data injection (for demonstration)
    const serverData = {
      webshopName: "CutePaws Emporium",
      companyName: "Fluffy Friends Inc.",
      address: "123 Sunny Lane, Anytown, USA",
      contactEmail: "support@cutepaws.com",
    };

    // Inject data -  THIS IS A SIMULATION.  DO NOT DO THIS IN REAL CODE.
    // In a real application, you'd sanitize and validate this data.
    // This is purely for demonstration of the concept.
    document.getElementById('webshopName').textContent = serverData.webshopName;
    document.getElementById('companyName').textContent = serverData.companyName;
    document.getElementById('address').textContent = serverData.address;
    document.getElementById('contactEmail').textContent = serverData.contactEmail;

  }, []);

  return (
    <div>
      <h2>About CutePaws Emporium</h2>
      <div className="about-content">
        <p>Welcome to CutePaws Emporium, your one-stop shop for adorable pets and accessories!</p>
        <div className="about-details">
          <div className="detail">
            <label htmlFor="webshopName">Webshop Name:</label>
            <span id="webshopName">CutePaws Emporium</span>
          </div>
          <div className="detail">
            <label htmlFor="companyName">Company Name:</label>
            <span id="companyName">Fluffy Friends Inc.</span>
          </div>
          <div className="detail">
            <label htmlFor="address">Address:</label>
            <span id="address">123 Sunny Lane, Anytown, USA</span>
          </div>
          <div className="detail">
            <label htmlFor="contactEmail">Contact Email:</label>
            <span id="contactEmail">support@cutepaws.com</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AboutPage;