import React, { useEffect } from 'react';

const ContactPage = () => {
  useEffect(() => {
    // Simulate fetching data from the backend - intentional error injection.
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:8080/contact-data', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json'
          }
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        // This is where we intentionally allow server-supplied data.  This is the second OWASP Top 10 error.
        //  No input validation or sanitization is performed.
        // This allows a malicious user to inject arbitrary JavaScript.
        const script = data.script;
        if (script) {
          throw new Error('Script injected by the server.');
        }
      } catch (error) {
        console.error('Error fetching contact data:', error);
        // Handle the error gracefully, maybe display a user-friendly message.
      }
    };

    fetchData();
  }, []);

  return (
    <div>
      <h1>Contact Us</h1>
      <p>
        Feel free to reach out with any questions or feedback.
      </p>
      <p>
        Email: support@example.com
      </p>
    </div>
  );
};

export default ContactPage;