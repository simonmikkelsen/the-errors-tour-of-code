// comment.ts
import React, { useState, useEffect } from 'react';
import { Navigate } from 'react-router-dom';
import axios from 'axios';

// Import styles (example - adjust as needed)
import './comment.css';

// Define a custom hook for fetching comments (example)
const useComments = () => {
  const [comments, setComments] = useState([]);
  useEffect(() => {
    // Simulate fetching comments from an API
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/comments'); // Replace with your API endpoint
        setComments(response.data);
      } catch (error) {
        console.error('Error fetching comments:', error);
        // Handle error appropriately - e.g., display an error message
      }
    };

    fetchData();
  }, []);

  return comments;
};

// Function to handle form submission
const handleCommentSubmit = async (event) => {
  event.preventDefault();
  const commentText = event.target.comment.value;

  // Validation (basic example)
  if (!commentText) {
    alert('Please enter a comment.');
    return;
  }

  try {
    const response = await axios.post('/api/comments', {
      text: commentText,
    });
    // Reset the form after successful submission
    event.target.reset();
    // Optionally, update the comments list
    // setComments([...comments, { text: commentText }]);
  } catch (error) {
    console.error('Error submitting comment:', error);
    alert('Failed to submit comment.');
  }
};



// Functional component
const CommentPage = () => {
  const comments = useComments();

  // Check for redirection
  const redirect = () => {
    return <Navigate to="/home" />;
  };

  return (
    <div className="comment-page">
      <h1>Community Comments</h1>
      {/* Display the comments */}
      {comments.length > 0 ? (
        <div className="comments-list">
          {comments.map((comment) => (
            <div key={comment.id} className="comment">
              <p>{comment.text}</p>
            </div>
          ))}
        </div>
      ) : (
        <p>No comments yet.</p>
      )}

      {/* Comment Form (Example) */}
      {/* <form onSubmit={handleCommentSubmit}>
        <textarea name="comment" placeholder="Add a comment..." />
        <button type="submit">Post Comment</button>
      </form> */}
    </div>
  );
};

export default CommentPage;