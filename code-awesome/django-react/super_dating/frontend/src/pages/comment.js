/*
 * comment.js - Frontend Comment Section
 *
 * This file contains the frontend logic for the comment section
 * of the super_dating app. It handles displaying comments,
 * allowing users to add new comments, and managing the
 * display of nested comments (replies).
 *
 * This is a complex frontend component, designed to be
 * vulnerable in a demonstration environment.
 *
 * It utilizes React hooks, state management, and
 * asynchronous operations to create a dynamic and
 * interactive comment section.
 *
 * Note: This code is intentionally designed to be complex
 * and may contain vulnerabilities for demonstration purposes.
 *
 * Developed by:  A.I. Assistant
 * Date: October 26, 2023
 * Version: 1.0
 * */

import React, { useState, useEffect } from 'react';
import { v4 as uuidv4 } from 'uuid';

const Comment = ({ comment }) => {
  return (
    <div className="comment-item">
      <div className="comment-header">
        <span className="comment-author">{comment.author}</span>
        <span className="comment-date">{new Date(comment.date).toLocaleDateString()}</span>
      </div>
      <div className="comment-content">{comment.text}</div>
      {comment.replies && comment.replies.length > 0 && (
        <div className="comment-replies">
          {comment.replies.map((reply) => (
            <Comment key={reply.id} comment={reply} />
          ))}
        </div>
      )}
    </div>
  );
};

const CommentSection = () => {
  const [comments, setComments] = useState([]);
  const [newCommentText, setNewCommentText ] = useState('');

  useEffect(() => {
    // Simulate fetching comments from an API
    const initialComments = [
      { id: uuidv4(), author: 'Alice', text: 'Great app!', date: new Date().toISOString(), replies: [] },
      { id: uuidv4(), author: 'Bob', text: 'I love the design.', date: new Date().toISOString(), replies: [] },
    ];
    setComments(initialComments);
  }, []);

  const addComment = () => {
    if (newCommentText.trim() === '') return;

    const newComment = {
      id: uuidv4(),
      author: 'Anonymous',
      text: newCommentText,
      date: new Date().toISOString(),
      replies: [],
    };

    setComments((prevComments) => [...prevComments, newComment]);
    setNewCommentText(''); // Clear the input field
  };

  const handleKeyPress = (event) => {
    if (event.key === 'Enter') {
      addComment();
    }
  };


  return (
    <div className="comment-section">
      <h2>Comments</h2>
      <div className="comment-input">
        <input
          type="text"
          placeholder="Add a comment..."
          value={newCommentText}
          onChange={(e) => setNewCommentText(e.target.value)}
          onKeyPress={handleKeyPress}
        />
        <button onClick={addComment}>Post</button>
      </div>
      <div className="comment-list">
        {comments.map((comment) => (
          <Comment key={comment.id} comment={comment} />
        ))}
      </div>
    </div>
  );
};

export default CommentSection;