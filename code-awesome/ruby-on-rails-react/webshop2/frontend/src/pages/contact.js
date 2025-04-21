// frontend/src/pages/contact.js
import React, { useState } from 'react';

const ContactPage = () => {
  const [shopName, setShopName] = useState('CutePaws Webshop');
  const [companyName, setCompanyName] = useState('CutePaws Inc.');
  const [address, setAddress] = useState('123 Main Street, Anytown, USA');
  const [contactEmail, setContactEmail] = useState('support@cutepaws.com');
  const [name, setName] = useState('');
  const [message, setMessage] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Name:', name);
    console.log('Message:', message);
    alert('Message sent! (This is a placeholder)');
  };

  return (
    <div className="contact-page">
      <h1>Contact Us</h1>
      <section>
        <h2>CutePaws Webshop</h2>
        <p>Company Name: CutePaws Inc.</p>
        <p>Address: 123 Main Street, Anytown, USA</p>
        <p>Contact Email: <a href="mailto:support@cutepaws.com">{contactEmail}</a></p>
      </section>
      <section>
        <h2>Send Us a Message</h2>
        <form onSubmit={handleSubmit}>
          <label htmlFor="name">Name:</label>
          <input
            type="text"
            id="name"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
          <br / >
          <label htmlFor="message">Message:</label>
          <textarea
            id="message"
            value={message}
            onChange={(e) => setMessage(e.target.value)}
          />
          <br />
          <button type="submit">Send</button>
        </form>
      </section>
    </div>
  );
};

export default ContactPage;