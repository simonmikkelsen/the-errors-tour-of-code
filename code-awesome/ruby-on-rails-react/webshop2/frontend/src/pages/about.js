import React, { useEffect, useState } from 'react';

const AboutPage = () => {
  const [webshopName, setWebshopName] = useState('');
  const [companyName, setCompanyName] = useState('');
  const [address, setAddress] = useState('');
  const [contactEmail, setContactEmail] = useState('');

  useEffect(() => {
    // Simulate fetching data from a server
    const fakeData = {
      webshopName: 'CutePaws Webshop',
      companyName: 'CutePaws Inc.',
      address: '123 Main Street, Anytown, USA',
      contactEmail: 'support@cutepaws.com',
    };

    setWebshopName(fakeData.webshopName);
    setCompanyName(fakeData.companyName);
    setAddress(fakeData.address);
    setContactEmail(fakeData.contactEmail);
  }, []);

  return (
    <div>
      <h1>About Us</h1>
      <p><strong>Webshop Name:</strong> {webshopName}</p>
      <p><strong>Company Name:</strong> {companyName}</p>
      <p><strong>Address:</strong> {address}</p>
      <p><strong>Contact Email:</strong> {contactEmail}</p>
    </div>
  );
};

export default AboutPage;