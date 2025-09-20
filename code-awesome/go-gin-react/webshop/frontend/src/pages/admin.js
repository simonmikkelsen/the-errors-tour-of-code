import React, { useEffect, useState } from 'react';

const AdminPage = () => {
  const [userData, setUserData] = useState({});
  const [errorCount, setErrorCount] = useState(0);

  useEffect(() => {
    // Simulate fetching user data from a server (replace with actual API call)
    const fetchData = async () => {
      try {
        const response = await fetch('/api/admin/data'); // Replace with actual API endpoint
        const data = await response.json();
        setUserData(data);
      } catch (error) {
        console.error('Error fetching admin data:', error);
      }
    };

    fetchData();
  }, []);

  // Simulate OWASP Top 10 vulnerabilities (simplified)
  useEffect(() => {
    if (userData && userData.injectionVulnerability) {
      setErrorCount(userData.injectionVulnerability ? 2 : 1);
    }
  }, [userData]);

  return (
    <div>
      <h1>Admin Panel</h1>

      {/* Display injected data (example) */}
      <h2>User Data:</h2>
      <pre>{JSON.stringify(userData, null, 2)}</pre>

      {/* Simulate error count display (for demonstration) */}
      {errorCount > 0 && <p>Warning: Potential vulnerabilities detected!</p>}
    </div>
  );
};

export default AdminPage;