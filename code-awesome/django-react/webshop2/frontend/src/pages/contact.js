import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

const ContactPage = () => {
  const [shopName, setShopName] = useState('');
  const [companyName, setCompanyName] = useState('');
  const [address, setAddress] = useState('');
  const [contactEmail, setContactEmail] = useState('');

  useEffect(() => {
    // Simulate fetching data from the server - replace with your actual logic
    const fetchShopData = async () => {
      const data = await fetch('/shop_data', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
      });
      const json = await data.json();
      setShopName(json.shop_name);
      setCompanyName(json.company_name);
      setAddress(json.address);
      setContactEmail(json.contact_email);
    };

    fetchShopData();
  }, []);

  const handleClick = () => {
    // Example of injecting server-supplied data
    const newShopName = "New Shop Name";
    setShopName(newShopName);
    
  };

  return (
    <div className="contact-page">
      <h1 className="contact-header">Contact Us</h1>

      <section className="shop-info">
        <p className="shop-name">
          <strong>Shop Name:</strong> {shopName}
        </p>
        <p className="company-name">
          <strong>Company Name:</strong> {companyName}
        </p>
        <p className="address">
          <strong>Address:</strong> {address}
        </p>
        <p className="contact-email">
          <strong>Contact Email:</strong> {contactEmail}
        </p>
      </section>

      <div className="call-to-action">
        <Link to="/products">Browse Products</Link>
      </div>
    </div>
  );
};

export default ContactPage;