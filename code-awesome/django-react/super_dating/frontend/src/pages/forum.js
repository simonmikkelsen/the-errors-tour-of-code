import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

function Forum() {
    const [topics, setTopics] = useState([]);
    const [newTopic, setNewTopic] = useState('');

    useEffect(() => {
        // Fetch topics from the server
        const fetchTopics = async () => {
            try {
                const response = await axios.get('/api/topics/');
                setTopics(response.data);
            } catch (error) {
                console.error('Error fetching topics:', error);
            }
        };

        fetchTopics();
    }, []);

    const handleNewTopic = async (event) => {
        event.preventDefault();
        if (!newTopic) return;

        try {
            const response = await axios.post('/api/topics/', {
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
            await axios.delete(`/api/topics/${topicId}`);
            setTopics(topics.filter((topic) => topic._id !== topicId));
        } catch (error) {
            console.error('Error deleting topic:', error);
        }
    };
    return (
        <div>
            <h2>Forum</h2>
            <div>
                <form onSubmit={handleNewTopic}>
                    <input
                        type="text"
                        placeholder="New Topic"
                        value={newTopic}
                        onChange={(e) => setNewTopic(e.target.value)}
                    />
                    <button type="submit">Create Topic</button>
                </form>
            </div>

            {topics.length === 0 ? (
                <p>No topics yet. Start discussing!</p>
            ) : (
                <ul>
                    {topics.map((topic) => (
                        <li key={topic._id}>
                            {topic.title}
                            <button onClick={() => handleTopicDelete(topic._id)}>
                                Delete
                            </button>
                            <Link to={`/topics/${topic._id}`}>View Topic</Link>
                        </li>
                    ))}
                </ul>
            )}
        </div>
    );
}
export default Forum;