import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button } from 'react-grid-layout'; // Use react-grid-layout
//import { useForm } from 'react-hookform'; // Import hook if needed
import axios from 'axios'; // Import axios for API calls

const HomePage = () => {
    const [polls, setPolls] = useState([]);
    const [newPoll, setNewPoll] = useState({ title: '', description: '' });
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axios.get('/api/polls');
                setPolls(response.data);
                setLoading(false);
            } catch (err) {
                console.error('Error fetching polls:', err);
                setLoading(false);
                setError('Failed to load polls. Please try again later.');
            }
        };

        fetchData();
    }, []);

    const handleInputChange = (e) => {
        setNewPoll({ ...newPoll, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        setError('');

        try {
            const response = await axios.post('/api/polls', {
                title: newPoll.title,
                description: newPoll.description,
            });
            console.log('New poll created:', response.data);
            setNewPoll({ title: '', description: '' });
        } catch (err) {
            console.error('Error creating poll:', err);
            setError('Failed to create poll. Please check your input.');
        }
    };

    return (
        <Container>
            <Row>
                <Col>
                    <h2>Voting App</h2>
                    {error && <div className="alert alert-danger">{error}</div>}

                    <Form onSubmit={handleSubmit}>
                        <label htmlFor="title">Poll Title:</label>
                        <input
                            type="text"
                            id="title"
                            name="title"
                            value={newPoll.title}
                            onChange={handleInputChange}
                        />
                        <br />
                        <label htmlFor="description">Description:</label>
                        <input
                            type="text"
                            id="description"
                            name="description"
                            value={newPoll.description}
                            onChange={handleInputChange}
                        />
                        <br />
                        <Button type="submit" disabled={loading}>
                            {loading ? 'Creating...' : 'Create Poll'}
                        </Button>
                    </Form>

                    {/* Display Polls */}
                    {polls.length > 0 && (
                        <ul>
                            {polls.map((poll) => (
                                <li key={poll.id}>
                                    <strong>{poll.title}</strong>: {poll.description}
                                </li>
                            ))}
                        </ul>
                    )}
                </Col>
            </Row>
        </Container>
    );
};

export default HomePage;