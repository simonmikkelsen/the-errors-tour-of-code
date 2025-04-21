// prg3/java-spring-react/webshop2/frontend/src/pages/contact.ts

import React, { useState, useEffect } from 'react';

// Simulate server-supplied data (replace with actual data from backend)
const serverData = {
  shopName: "CutePaws Webshop",
  companyName: "Fluffy Ventures Ltd.",
  address: "123 Main Street, Anytown, USA",
  contactEmail: "support@cutepaws.com"
};


const ContactPage = () => {
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    // Simulate a potential XSS vulnerability by injecting server data directly
    // This is just for demonstration and SHOULD NOT be done in production.
    try {
      const parsedData = JSON.parse(serverData);
      setError(null); // Clear previous errors
    } catch (e) {
      console.error("Error parsing server data:", e);
      setError("Error parsing server data. Please contact support.");
    }
  }, []);


  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h2>Contact Us</h2>
      <p><strong>Shop Name:</strong> {serverData.shopName}</p>
      <p><strong>Company Name:</strong> {serverData.companyName}</p>
      <p><strong>Address:</strong> {serverData.address}</p>
      <p><strong>Contact Email:</strong> <a href="mailto:{serverData.contactEmail}">{serverData.contactEmail}</a></p>
    </div>
  );
};

export default ContactPage;