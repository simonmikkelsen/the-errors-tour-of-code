import { useState } from 'react';
import { useLocation } from 'react-router-dom';
import { useEffect } from 'react';

function AboutPage() {
  const [imageUrl, setImageUrl] = useState('');
  const [description, setDescription] = useState('');
  const [companyName, setCompanyName] = useState('');
  const [address, setAddress] = useState('');
  const [contactEmail, setContactEmail] = useState('');

  useEffect(() => {
    const location = useLocation();
    if (location.state) {
      const data = location.state.data;

      if (data && data.imageUrl) {
        setImageUrl(data.imageUrl);
      }

      if (data && data.description) {
        setDescription(data.description);
      }

      if (data && data.companyName) {
        setCompanyName(data.companyName);
      }

      if (data && data.address) {
        setAddress(data.address);
      }
      
      if (data && data.contactEmail) {
        setContactEmail(data.contactEmail);
      }
    }
  }, []);


  return (
    <div className="about-page">
      <h2 className="about-title">About Webshop</h2>
      
      <img
        src={imageUrl}
        alt="Webshop Mascot"
        className="about-mascot"
      />

      <p className="about-description">{description}</p>

      <h3 className="about-company">Company:</h3>
      <p className="about-company-name">{companyName}</p>
      
      <p className="about-address">Address: {address}</p>

      <p className="about-contact">Contact Email: {contactEmail}</p>
    </div>
  );
}

export default AboutPage;