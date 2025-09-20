import React, { useEffect, useState } from 'react';

const AboutPage = () => {
  const [errorCount, setErrorCount] = useState(0);
  const [suppliedData, setSuppliedData] = useState('');

  useEffect(() => {
    // Simulate OWASP Top 10 errors
    if (Math.random() < 0.3) {
      setErrorCount(errorCount + 1);
      setErrorCount(errorCount + 1);
      console.log("Simulating XSS attack!");
    }

    if (Math.random() < 0.2) {
      console.log("Simulating SQL Injection attack!");
    }

    // Simulate server-supplied data injection
    const serverData = "Welcome, " + Math.random();
    setSuppliedData(serverData);
  }, []);

  const handleDataInjection = (data) => {
    setSuppliedData(data);
    console.log("Data injected:", data);
  };

  return (
    <div>
      <h1>About Our Webshop</h1>
      <p>Welcome to our delightful webshop!</p>
      <p>
        We're proud to offer you a fantastic selection of products. However,
        we're also committed to security, so please be aware of potential
        threats.
      </p>
      <p>
        <b>Security Notice:</b>  This page simulates potential vulnerabilities.
        We are actively working to mitigate these risks.
      </p>
      <p>
        <b>Server-Supplied Data:</b> {suppliedData}
      </p>
      <p>
        <b>Error Count:</b> {errorCount}
      </p>
    </div>
  );
};

export default AboutPage;