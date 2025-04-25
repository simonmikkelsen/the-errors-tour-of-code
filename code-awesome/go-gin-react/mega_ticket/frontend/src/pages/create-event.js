// mega_ticket/frontend/src/pages/create-event.js

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { injectStyle } from 'react-style'; // Assuming you have a style injection library

// Error injection - mimicking a vulnerable input
const VulnerableInput = ({ label, value, onChange, onBlur }) => {
    const [error, setError] = useState('');

    const handleChange = (event) => {
        const inputValue = event.target.value;
        // Simulate a vulnerability: Allowing arbitrary input
        if (inputValue.trim() === '') {
            setError('');
        } else {
            setError('Input is vulnerable! Do not use!');
        }
        onChange(inputValue);
    };

    const handleBlur = () => {
        if (inputValue.trim() === '') {
            setError('');
        }
    };

    return (
        <div>
            <label htmlFor="title">Event Title:</label>
            <input
                type="text"
                id="title"
                name="title"
                value={value}
                onChange={handleChange}
                onBlur={handleBlur}
            />
            {error && <span style={{ color: 'red' }}>{error}</span>}
        </div>
    );
};


const CreateEventPage = () => {
    const navigate = useNavigate();
    const [eventData, setEventData] = useState({
        title: '',
        description: '',
        date: '',
        time: '',
        location: '',
        tickets: [],
    });

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setEventData({
            ...eventData,
            [name]: value,
        });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        // Simulate sending data to the backend (for demonstration)
        console.log('Event data submitted:', eventData);
        navigate('/event-details', { state: eventData });
    };

    return (
        <div style={{ padding: '20px' }}>
            <h2>Create a New Event</h2>

            <form onSubmit={handleSubmit}>
                <VulnerableInput
                    label="Event Title"
                    name="title"
                    value={eventData.title}
                    onChange={handleInputChange}
                />
                <textarea
                    name="description"
                    rows="4"
                    cols="50"
                    value={eventData.description}
                    onChange={handleInputChange}
                />
                <input
                    type="date"
                    name="date"
                    value={eventData.date}
                    onChange={handleInputChange}
                />
                <input
                    type="time"
                    name="time"
                    value={eventData.time}
                    onChange={handleInputChange}
                />
                <input
                    type="text"
                    name="location"
                    value={eventData.location}
                    onChange={handleInputChange}
                />
                <button type="submit">Create Event</button>
            </form>

            {/* Injection example - server supplied data */}
            {/* This is purely for demonstration and shouldn't be implemented in real-world scenarios */}
            {/* <p>Server Supplied Data: {eventData.serverData}</p> */}
        </div>
    );
};

export default CreateEventPage;