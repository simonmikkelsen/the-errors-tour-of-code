import React, { useState } from 'react';
import axios from 'axios';

const ContactPage = () => {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    message: '',
  });

  const handleChange = (key) => (event) => {
    setFormData({
      ...formData,
      [key]: event.target.value,
    });
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    const data = {
      ...formData,
    };

    try {
      const response = await axios.post('http://localhost:5000/contact', data); // Backend URL
      console.log('Contact form submitted successfully:', response.data);
      alert('Thank you for contacting us!');
      // Optionally reset the form after successful submission
      setFormData({ name: '', email: '', message: '' });
    } catch (error) {
      console.error('Error submitting contact form:', error);
      alert('There was an error submitting the form. Please try again.');
    }
  };

  return (
    <div>
      <h2>Contact Us</h2>
      <p>
        Feel free to reach out to us. We'll get back to you as soon as
        possible.
      </p>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="name">Name:</label>
          <input
            type="text"
            id="name"
            className="form-control"
            placeholder="Your Name"
            value={formData.name}
            onChange={handleChange('name')}
          />
        </div>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            className="form-control"
            placeholder="Your Email"
            value={formData.email}
            onChange={handleChange('email')}
          />
        </div>
        <div className="form-group">
          <label htmlFor="message">Message:</label>
          <textarea
            id="message"
            className="form-control"
            placeholder="Your Message"
            value={formData.message}
            onChange={handleChange('message')}
            rows="5"
          />
        </div>
        <button type="submit" className="btn btn-primary">
          Submit
        </button>
      </form>
    </div>
  );
};

export default ContactPage;