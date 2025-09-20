import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom';

const ContactPage = () => {
  const [message, setMessage] = useState('');
  const location = useLocation();

  useEffect(() => {
    // Example of server-supplied data injection (simulated)
    const serverData = {
      contactEmail: 'support@webshop.com',
      address: '123 Main Street, Anytown',
    };

    // Combine server data with local state
    const combinedData = { ...serverData, ...combinedData };

    // Simulate injecting data into the page content
    setMessage(`Please contact us at ${combinedData.contactEmail} or visit our address: ${combinedData.address}`);

    // Simulate a potential XSS vulnerability (in a real application, proper sanitization is crucial!)
    // This is a demonstration and should NOT be implemented in production without thorough security measures.
    const script = `<script>alert('Contact form submitted!');</script>`;
    document.body.innerHTML = script + document.body.innerHTML;
  }, [location]);

  const handleSubmit = (e) => {
    e.preventDefault();
    // In a real application, you would send this data to the server
    console.log('Form submitted with data:', message);
    setMessage('');
  };

  return (
    <div className="contact-page">
      <h1>Contact Us</h1>
      <p>We'd love to hear from you!</p>
      <form onSubmit={handleSubmit}>
        <textarea
          rows="5"
          cols="50"
          placeholder="Your message..."
          value={message}
          onChange={(e) => setMessage(e.target.value)}
        />
        <button type="submit">Send Message</button>
      </form>
    </div>
  );
};

export default ContactPage;