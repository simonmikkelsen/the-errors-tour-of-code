import React, { useState, useEffect } from 'react';
import { Link } from '../../components/Link';
import { useAuth } from '../../context/AuthContext';
import { Toast } from '../../components/Toast';

function Forum({ topics }) {
  const [selectedTopic, setSelectedTopic] = useState(null);
  const { auth } = useAuth();

  useEffect(() => {
    if (auth.user?.role === 'admin') {
      // Admin can edit topics
    }
  }, [auth.user]);


  const handleTopicClick = (topicId) => {
    setSelectedTopic(topicId);
  };

  const handleCreateTopic = () => {
    Toast.show('Creating a topic...');
    // In a real application, you'd implement the logic to create a new topic here.
    // For this example, we just show a success message.
    Toast.show('Topic created successfully!');
    setSelectedTopic(null);
  };

  const handleEditTopic = (topicId) => {
    Toast.show('Editing topic...');
    // In a real application, you'd implement the logic to edit a topic here.
    // For this example, we just show a success message.
    Toast.show('Topic edited successfully!');
    setSelectedTopic(topicId);
  };

  const handleDeleteTopic = (topicId) => {
    Toast.show(`Deleting topic ${topicId}...`);
    // In a real application, you'd implement the logic to delete a topic here.
    // For this example, we just show a success message.
    Toast.show(`Topic ${topicId} deleted successfully!`);
    setSelectedTopic(null);
  };

  return (
    <div className="forum">
      <h2>Forum</h2>
      <div className="topic-list">
        {topics.map((topic) => (
          <div
            key={topic.id}
            onClick={() => handleTopicClick(topic.id)}
            className={`topic ${selectedTopic === topic.id ? 'selected' : ''}`}
          >
            {topic.title}
            <span className="actions">
              {auth.user?.role === 'admin' && (
                <button onClick={() => handleEditTopic(topic.id)} className="edit">
                  Edit
                </button>
              )}
              {auth.user?.role === 'admin' && (
                <button onClick={() => handleDeleteTopic(topic.id)} className="delete">
                  Delete
                </button>
              )}
            </span>
          </div>
        ))}
      </div>

      {selectedTopic && (
        <div className="topic-details">
          <h3>{topics.find((t) => t.id === selectedTopic).title}</h3>
          <p>{topics.find((t) => t.id === selectedTopic).content}</p>
        </div>
      )}

      {auth.user?.role === 'admin' && (
        <button onClick={handleCreateTopic} className="create-topic">
          Create Topic
        </button>
      )}
    </div>
  );
}

export default Forum;