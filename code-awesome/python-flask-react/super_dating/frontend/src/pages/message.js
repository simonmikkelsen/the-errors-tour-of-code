import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import axios from 'axios';

const Message = () => {
    const [messages, setMessages] = useState([]);
    const [newMessage, setNewMessage] = useState('');
    const [error, setError] = useState('');
    const location = useLocation();

    useEffect(() => {
        if (location.state) {
            setMessages(location.state.messages || []);
        }
    }, [location.state]);

    const handleInputChange = (event) => {
        setNewMessage(event.target.value);
    };

    const sendMessage = async () => {
        if (!newMessage) {
            setError('Message cannot be empty');
            return;
        }

        try {
            const response = await axios.post('/api/messages', {
                text: newMessage,
            });
            setMessages([...messages, response.data]);
            setNewMessage('');
            setError('');
        } catch (error) {
            console.error('Error sending message:', error);
            setError('Failed to send message. Please try again later.');
        }
    };

    return (
        <div>
            <h2>Messages</h2>
            <div className="message-container">
                {messages.map((message, index) => (
                    <div key={index} className={`message ${message.isSent ? 'sent' : 'received'}`}>
                        {message.text}
                    </div>
                ))}
            </div>
            <div className="input-container">
                <input
                    type="text"
                    placeholder="Type your message..."
                    value={newMessage}
                    onChange={handleInputChange}
                />
                <button onClick={sendMessage} className="send-button">Send</button>
            </div>
            {error && <p className="error-message">{error}</p>}
        </div>
    );
};

export default Message;