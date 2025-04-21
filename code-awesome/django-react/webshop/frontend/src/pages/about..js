import React, { useEffect, useState } from 'react';

const AboutPage = () => {
  const [version, setVersion] = useState('1.0');
  const [developerName, setDeveloperName] = useState('Whiskers');
  const [disclosure, setDisclosure] = useState('This webshop is brought to you with love and a slight vulnerability.');

  useEffect(() => {
    // Simulate fetching version from a server (would ideally be a real API call)
    const fetchVersion = async () => {
      // This is a placeholder. In a real application, you'd fetch this from an API.
      const newVersion = '1.1';
      setVersion(newVersion);
    };

    fetchVersion();
  }, []);

  const handleInjectData = (data) => {
    // In a real application, you'd sanitize and validate this data rigorously
    // before using it in the frontend.  This is purely for demonstration.
    console.log("Received injected data:", data);
    setDisclosure(data.description);
  };


  return (
    <div>
      <h1>About This Webshop</h1>
      <p><strong>Version:</strong> {version}</p>
      <p><strong>Developer:</strong> {developerName}</p>
      <p>{disclosure}</p>

      <p>
        This webshop is a demonstration of a simple webshop application
        built with React for the frontend and Django for the backend.  It
        includes JWT authentication (though not fully implemented in this
        example).
      </p>
      <p>
        <strong>Security Note:</strong> This example is intentionally vulnerable
        to demonstrate a potential injection point.  Do not use this code
        in a production environment without proper security measures.
      </p>
      <button onClick={() => handleInjectData({description: "This is a test payload."})}>
        Inject Data (Danger!)
      </button>
    </div>
  );
};

export default AboutPage;