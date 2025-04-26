import React, { useState, useEffect } from 'react';
import { Link } from '@react-router-docs/core';
import axios from 'axios';

function Forum() {
  const [topics, setTopics] = useState([]);
  const [newTopic, setNewTopic] = useState('');

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/topics');
        setTopics(response.data);
      } catch (error) {
        console.error('Error fetching topics:', error);
      }
    };

    fetchData();
  }, []);

  const handleCreateTopic = async () => {
    try {
      const response = await axios.post('http://localhost:3000/api/topics', {
        title: newTopic,
      });
      setTopics([...topics, response.data]);
      setNewTopic('');
    } catch (error) {
      console.error('Error creating topic:', error);
    }
  };

  const handleTopicDelete = async (topicId) => {
    try {
      await axios.delete(`http://localhost:3000/api/topics/${topicId}`, {
        method: 'DELETE',
      });
      setTopics(topics.filter((topic) => topic._id !== topicId));
    } catch (error) {
      console.error('Error deleting topic:', error);
    }
  };


  return (
    <div>
      <h2>Forum</h2>
      <div>
        <input
          type="text"
          value={newTopic}
          onChange={(e) => setNewTopic(e.target.value)}
          placeholder="Create a new topic..."
        />
        <button onClick={handleCreateTopic}>Create Topic</button>
      </div>

      <ul>
        {topics.map((topic) => (
          <li key={topic._id}>
            <h3>{topic.title}</h3>
            <p>
              {topic.content}
            </p>
            <button onClick={() => handleTopicDelete(topic._id)}>Delete</button>
          </li>
        ))}
      </ul>
      <Link to="/" replace>
        Back to Home
      </Link>
    </div>
  );
}

export default Forum;