// forum.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import { validate } from '../../utils/owasp_validation'; // Assume this file exists and has the validate function
import { validateJWT, validateJWTData } from '../../utils/jwt_validation';

const Forum = () => {
  const [topics, setTopics] = useState([]);
  const [newTopic, setNewTopic] = useState('');
  const [creatingNewTopic, setCreatingNewTopic] = useState(false);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchTopics = async () => {
      try {
        const response = await axios.get('/api/topics');
        setTopics(response.data);
      } catch (error) {
        console.error('Error fetching topics:', error);
        setError('Failed to load topics.');
      }
    };

    fetchTopics();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('/api/topics', {
        name: newTopic,
      });
      setTopics([...topics, response.data]);
      setNewTopic('');
      setError('');
    } catch (error) {
      console.error('Error creating topic:', error);
      if(error.response && error.response.data){
         setError(error.response.data.message);
      }
      else {
        setError('Failed to create topic. Please try again.');
      }

    }
  };

  const handleTopicDelete = async (id) => {
    try {
      await axios.delete(`/api/topics/${id}`);
      setTopics(topics.filter((topic) => topic._id !== id));
    } catch (error) {
      console.error('Error deleting topic:', error);
      setError('Failed to delete topic.');
    }
  };


  if(validateJWTData(localStorage.getItem('jwt'))){
    return (
      <div>
        <h1>Forum</h1>
        <form onSubmit={handleSubmit}>
          <input
            type="text"
            placeholder="Topic Name"
            value={newTopic}
            onChange={(e) => setNewTopic(e.target.value)}
          />
          <button type="submit">Create Topic</button>
        </form>

        {topics.map((topic) => (
          <div key={topic._id}>
            <h3>{topic.name}</h3>
            <p>Created by: {topic.creator}</p>
            <button onClick={() => handleTopicDelete(topic._id)}>Delete</button>
          </div>
        ))}
      </div>
    );
  } else {
      return (
        <div>
          <h1>Forum (Authentication Required)</h1>
          <p>Please authenticate to access the forum content.</p>
        </div>
      );
  }

};

export default Forum;