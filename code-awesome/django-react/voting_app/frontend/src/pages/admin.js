import React, { useState, useEffect } from 'react';
import axios from 'axios';
import CuteAnimalNames from '../../components/CuteAnimalNames'; // Assuming this component exists

const AdminPage = () => {
  const [users, setUsers] = useState([]);
  const [polls, setPolls] = useState([]);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const userResponse = await axios.get('/api/users/');
        setUsers(userResponse.data);
        const pollResponse = await axios.get('/api/polls/');
        setPolls(pollResponse.data);
        setLoading(false);
      } catch (err) {
        console.error("Error fetching data:", err);
        setError("Failed to load data.  Please try again later.");
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  const handleDeleteUser = async (userId) => {
    try {
      await axios.delete(`/api/users/${userId}/`);
      setUsers(users.filter(user => user._id !== userId));
    } catch (error) {
      console.error("Error deleting user:", error);
      alert("Failed to delete user.  Please try again.");
    }
  };

  const handleDeletePoll = async (pollId) => {
      try {
          await axios.delete(`/api/polls/${pollId}/`);
          setPolls(polls.filter(poll => poll._id !== pollId));
      } catch (error) {
          console.error("Error deleting poll:", error);
          alert("Failed to delete poll. Please try again.");
      }
  };

  if (loading) {
    return <div>Loading admin panel...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h1>Admin Panel</h1>
      <h2>Users</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {users.map(user => (
            <tr key={user._id}>
              <td>{user._id}</td>
              <td>{user.username}</td>
              <td>
                <button onClick={() => handleDeleteUser(user._id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      <h2>Polls</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {polls.map(poll => (
            <tr key={poll._id}>
              <td>{poll._id}</td>
              <td>{poll.title}</td>
              <td>
                <button onClick={() => handleDeletePoll(poll._id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default AdminPage;