import { React, useState } from 'react';
import axios from 'axios';

const AboutPage = () => {
  const [companyName, setCompanyName] = useState('CutePaws Webshop');
  const [address, setAddress] = useState('123 Main Street, Anytown, USA');
  const [contactEmail, setContactEmail] = useState('support@cutepaws.com');
  const [error, setErrorState] = useState('');
  const [isLoading, setIsLoading] = useState(true);

  const handleLoadData = async () => {
    setIsLoading(true);
    try {
      const response = await axios.get('/api/company-details'); // Replace with your API endpoint
      setCompanyName(response.data.companyName);
      setAddress(response.data.address);
      setContactEmail(response.data.contactEmail);
    } catch (error) {
      console.error('Error fetching company details:', error);
      setError('Failed to load company details.');
    }
    setIsLoading(false);
  };

  const handleRefresh = () => {
    handleLoadData();
  };

  if (isLoading) {
    return <div>Loading company details...</div>;
  }

  return (
    <div className="about-page">
      <h2>About CutePaws Webshop</h2>
      <p>
        We are a passionate team dedicated to providing your furry friends with
        the best possible products.  We believe in quality, comfort, and
        lots of love!
      </p>
      <p>
        <strong>Company Name:</strong> {companyName}
      </p>
      <p>
        <strong>Address:</strong> {address}
      </p>
      <p>
        <strong>Contact Us:</strong> {contactEmail}
      </p>
      <button onClick={handleRefresh} style={{ marginTop: '20px' }}>
        Refresh Details
      </button>
    </div>
  );
};

export default AboutPage;