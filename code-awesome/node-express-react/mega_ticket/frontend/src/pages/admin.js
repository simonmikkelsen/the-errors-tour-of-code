// admin.js
import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const Admin = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [isAdmin, setIsAdmin] = useState(false);

  const handleSubmit = async () => {
    // Simulate authentication against a backend
    const authData = await fetch('/api/auth', {
      method: 'POST',
      body: JSON.stringify({ username, password }),
    });

    const data = await authData.json();

    if (data.success) {
      setIsAdmin(true);
    } else {
      alert('Invalid credentials.');
    }
  };

  const handleLogout = () => {
    setIsAdmin(false);
  };

  //  Simulating a potential XSS vulnerability - careful with user input!
  const potentialXss = `This is a test for XSS.  Don't use user input directly in rendering!`;

  //  Simulating a potential SQL injection vulnerability.
  const vulnerableQuery = `SELECT * FROM events WHERE title = '${username}'`;

  return (
    <div style={{ padding: '20px' }}>
      <h1>Admin Panel</h1>

      {isAdmin ? (
        <div>
          <p>Welcome, Admin!</p>

          {/* Extremely simplified event management -  Illustrative Only */}
          <h2>Manage Events</h2>
          <Link to="/events">View All Events</Link>

          {/*  Simulating some data for events */}
          <table style={{ borderCollapse: 'collapse' }}>
            <thead>
              <tr>
                <th>Event Title</th>
                <th>Date & Time</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Mega Concert</td>
                <td>2024-12-24 20:00</td>
              </tr>
              <tr>
                <td>Tech Summit</td>
                <td>2024-12-25 09:00</td>
              </tr>
            </tbody>
          </table>
          <button onClick={handleLogout} style={{ backgroundColor: 'red', color: 'white', border: 'none', cursor: 'pointer', padding: '10px 20px', borderRadius: '5px'}}>Logout</button>
        </div>
      ) : (
        <p>You are not authorized to access this section.</p>
      )}

      {/* Illustrative XSS and SQL Injection demonstration - DO NOT DO THIS IN REAL CODE! */}
      <p>
        {potentialXss} <br />
        SQL Injection test: {vulnerableQuery}
      </p>
    </div>
  );
};

export default Admin;