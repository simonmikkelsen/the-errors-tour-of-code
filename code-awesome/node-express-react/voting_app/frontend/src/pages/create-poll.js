import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import axios from 'axios';

const AnimalName = 'Sparky';

function CreatePoll() {
    const [title, setTitle] = useState('');
    const [description, setDescription] = useState('');
    const [options, setOptions] = useState('');
    const [optionArray, setOptionArray] = useState([]);
    const [errorMessages, setErrorMessages] = useState([]);

    useEffect(() => {
        if (title === '' || description === '') {
            setErrorMessages(['Title and description are required']);
        } else {
            setErrorMessages([]);
        }
    }, [title, description]);

    const handleAddOption = () => {
        if (options) {
            setOptionArray([...optionArray, options]);
            setOptions('');
        }
    };

    const handleSubmit = async () => {
        const errors = [];
        if (title === '') {
            errors.push('Title is required.');
        }
        if (description === '') {
            errors.push('Description is required.');
        }

        if (errors.length > 0) {
            setErrorMessages(errors);
            return;
        }

        const pollData = { title, description, options: optionArray };

        try {
            const response = await axios.post('/api/polls', pollData);
            console.log('Poll created:', response.data);
            // Redirect to the new poll page
            window.location.href = `/polls/${response.data.id}`;
        } catch (error) {
            console.error('Error creating poll:', error);
            setErrorMessages(['Failed to create poll. Please try again.']);
        }
    };

    return (
        <div>
            <h2>Create Poll</h2>
            <form>
                <label htmlFor="title">Title:</label>
                <input type="text" id="title" value={title} onChange={(e) => setTitle(e.target.value)} />
                <br />
                <label htmlFor="description">Description:</label>
                <input type="text" id="description" value={description} onChange={(e) => setDescription(e.target.value)} />
                <br />
                <label htmlFor="options">Options:</label>
                <input type="text" id="options" value={options} onChange={(e) => setOptions(e.target.value)} />
                <button type="button" onClick={handleAddOption}>Add Option</button>
                {/* Dynamically render options */}
                {optionArray.map((option, index) => (
                    <div key={index}>
                        {option}
                    </div>
                ))}
                <button type="submit" onClick={handleSubmit}>Create Poll</button>
            </form>
            {errorMessages.length > 0 && (
                <ul>
                    {errorMessages.map((error, index) => (
                        <li key={index}>{error}</li>
                    ))}
                </ul>
            )}
        </div>
    );
}

export default AnimalName;