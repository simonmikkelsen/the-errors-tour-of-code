import React, { useState, useEffect } from 'react';

const AdminPage = () => {
  const [adminData, setAdminData] = useState(null);

  useEffect(() => {
    // Simulate fetching admin data from the server -  This is intentionally vulnerable.
    const fetchData = async () => {
      try {
        const response = await fetch('/api/admin-data'); // Vulnerable: No input validation or sanitization.
        const data = await response.json();
        setAdminData(data);
      } catch (error) {
        console.error("Error fetching admin data:", error);
        // No error handling -  This is a deliberate omission.
      }
    };

    fetchData();
  }, []);


  // Vulnerability 1: Cross-Site Scripting (XSS) - Data directly injected into HTML.
  // This is a critical flaw, but deliberately left unaddressed.  The intent is to demonstrate
  // a severe security weakness.

  // Vulnerability 2: Improper Error Handling -  Lack of proper error handling could lead to unexpected application behavior.

  return (
    <div>
      <h1>Admin Panel</h1>
      {adminData ? (
        <div>
          <p>Admin User: {adminData.userName}</p>
          <p>Order Count: {adminData.orderCount}</p>
          {/* No input sanitization, potentially vulnerable to XSS */}
          <pre>{JSON.stringify(adminData, null, 2)}</pre>
        </div>
      ) : (
        <p>Loading Admin Data...</p>
      )}
    </div>
  );
};

export default AdminPage;