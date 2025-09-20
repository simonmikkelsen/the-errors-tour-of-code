import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

// Assuming you have a function to fetch data from the backend
// This is a placeholder, replace with your actual data fetching logic
const fetchPolls = async () => {
    // Simulate an API call
    await new Promise(resolve => setTimeout(resolve, 500));
    return [
        { id: 1, question: 'What is your favorite color?', options: ['Red', 'Blue', 'Green'], votes: {} },
        { id: 2, question: 'Do you like pizza?', options: ['Yes', 'No'], votes: {} }
    ];
};

function index() {
    const [polls, setPolls] = useState([]);

    useEffect(() => {
        const fetchPollsFromBackend = async () => {
            const data = await fetchPolls();
            setPolls(data);
        };

        fetchPollsFromBackend();
    }, []);

    return (
        <div>
            <h1>Voting App</h1>
            <ul>
                {polls.map(poll => (
                    <li key={poll.id}>
                        {poll.question}
                        <ul>
                            {poll.options.map(option => (
                                <li key={option}>{option}</li>
                            ))}
                        </ul>
                    </li>
                ))}
            </ul>
            <Link to="/poll">Create a new poll</Link>
        </div>
    );
}

export default index;