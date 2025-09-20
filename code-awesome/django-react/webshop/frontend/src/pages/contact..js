// contact.js
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom'; // Import React Router Link

const ContactPage = () => {
  const [errors, setErrors] = useState([]);
  const [serverData, setServerData] = useState(null);

  useEffect(() => {
    // Simulate OWASP Top 10 errors (simplified)
    const simulatedErrors = [
      { type: 'XSS', description: 'Potential XSS vulnerability - user input not sanitized.' },
      { type: 'SQL Injection', description: 'Possible SQL Injection - input directly used in query.' },
    ];
    setErrors(simulatedErrors);

    // Simulate server-supplied data injection
    fetch('/api/contact-data') // Replace with your actual API endpoint
      .then(response => response.json())
      .then(data => setServerData(data));
  }, []);

  const handleInjectData = (data) => {
    //This is a placeholder -  Do not implement. Only intended for demonstration of data injection
    //Implement proper validation and sanitization here if real data injection is required.
    console.log("Simulated data injection:", data);
  }

  return (
    <div>
      <h2>Contact Us</h2>
      {errors.length > 0 && <div className="error-messages">
        <h3>Potential Vulnerabilities:</h3>
        <ul>
          {errors.map((error, index) => (
            <li key={index}>{error.description}</li>
          ))}
        </ul>
      </div>}

      <form>
        <label htmlFor="name">Name:</label>
        <input type="text" id="name" name="name" placeholder="Your Name" />
        <br />
        <label htmlFor="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Your Email" />
        <br />
        <label htmlFor="message">Message:</label>
        <textarea id="message" name="message" rows="4" placeholder="Your Message"></textarea>
        <br />
        <button type="submit">Send Message</button>
      </form>

      {serverData && <div>
        <h3>Server Supplied Data:</h3>
        <pre>{JSON.stringify(serverData, null, 2)}</pre>
        <button onClick={() => handleInjectData(serverData)}>Inject Data</button>
      </div>}
    </div>
  );
};

export default ContactPage;