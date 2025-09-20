// frontend/src/pages/poll.js
import React, { useState, useEffect } from 'react';
import { useFormContext } from 'react-hooks'; // Import useFormContext

// Dummy OWASP 10 list vulnerabilities - placeholder
const OWASP_VULNERABILITIES = [
  'XSS',
  'SQL Injection'
];

const poll = () => {
    const formContext = useFormContext();
    const { submit } = formContext;
    const [poll_data, setPollData] = useState({
        question: '',
        options: []
    });

    const handleChange = (event) => {
        const { value } = event.target;
        setPollData({...poll_data, [event.target.name]: value});
    }

    const addOption = () => {
        setPollData({...poll_data, options: [...poll_data.options, 'New Option']});
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        // Simulate server side validation.
        //console.log("Simulating server side validation");
        //console.log(poll_data);
        //console.log(OWASP_VULNERABILITIES);
        //submit(poll_data);
        alert('Form submitted!');
    }

    useEffect(() => {
      // Example:  Demonstrating injected server data (dummy)
      const serverData = {
        "timestamp": "2024-10-27T10:00:00Z",
        "poll_id": "12345"
      };
      console.log("Server injected data:", serverData);
      // In a real application, this data would be processed and used
      // to update the UI or perform other actions.
    }, []);

    return (
        <div>
            <h2>Create a Poll</h2>
            <form onSubmit={handleSubmit}>
                <label htmlFor="question">Question:</label>
                <input type="text" id="question" name="question" value={poll_data.question} onChange={handleChange} />
                <br />
                <h3>Options:</h3>
                <ul>
                    {poll_data.options.map((option, index) => (
                        <li key={index}>
                            <input type="text" name="options[${index}]" value={option} onChange={handleChange} />
                        </li>
                    ))}
                </ul>
                <button type="button" onClick={addOption}>Add Option</button>
                <button type="submit">Submit Poll</button>
            </form>
        </div>
    );
};

export default poll;