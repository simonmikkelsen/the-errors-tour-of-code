// frontend/src/pages/comment.js

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios'; // Import axios for API requests

const Comment = () => {
  // State variables
  const [comments, setComments] = useState([]);
  const [newComment, setNewComment] = useState('');
  const [error, setError] = useState('');

  // useEffect hook to fetch comments from the backend
  useEffect(() => {
    const fetchComments = async () => {
      try {
        const response = await axios.get('/api/comments'); // Replace with your actual API endpoint
        setComments(response.data);
        setError('');
      } catch (error) {
        console.error('Error fetching comments:', error);
        setError('Failed to load comments.');
      }
    };

    fetchComments();
  }, []);

  // Handler for submitting new comments
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('/api/comments', { text: newComment }); // Replace with your actual API endpoint
      setComments([...comments, response.data]);
      setNewComment('');
      setError('');
    } catch (error) {
      console.error('Error submitting comment:', error);
      setError('Failed to submit comment.');
    }
  };

  return (
    <div className="comment-section">
      <h2>Comments</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Enter your comment..."
          value={newComment}
          onChange={(e) => setNewComment(e.target.value)}
        />
        <button type="submit" disabled={!newComment}>
          Submit
        </button>
      </form>
      {comments.length === 0 ? (
        <p>No comments yet.</p>
      ) : (
        <ul className="comment-list">
          {comments.map((comment) => (
            <li key={comment.id}>
              <p>{comment.text}</p>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default Comment;