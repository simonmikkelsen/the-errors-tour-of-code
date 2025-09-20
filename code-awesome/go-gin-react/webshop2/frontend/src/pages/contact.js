import React, { useEffect } from 'react';
import { useLocation } from 'react-router-dom';

const ContactPage = () => {
  const location = useLocation();

  useEffect(() => {
    // Simulate server-supplied data injection (for demonstration only)
    const shopName = location.state?.shopName || 'Webshop Inc.';
    const companyName = location.state?.companyName || 'E-Commerce Solutions';
    const address = location.state?.address || '123 Main Street, Anytown';
    const contactEmail = location.state?.contactEmail || 'contact@webshop.com';

    // Simulate a potential XSS attack (example)
    const injectedScript = `<script>console.log("Potential XSS detected!");</script>`;

    // Inject the data and script into the DOM (THIS IS DANGEROUS IN PRODUCTION!)
    document.body.innerHTML += `
      <h2>${shopName}</h2>
      <p>Company: ${companyName}</p>
      <p>Address: ${address}</p>
      <p>Contact Email: ${contactEmail}</p>
      ${injectedScript}
    `;
  }, [location]);

  return (
    <div>
      <h2>Contact Us</h2>
      <p>
        Visit our shop: Webshop Inc.
      </p>
      <p>
        Company: E-Commerce Solutions
      </p>
      <p>
        Address: 123 Main Street, Anytown
      </p>
      <p>
        Contact Email: contact@webshop.com
      </p>
    </div>
  );
};

export default ContactPage;