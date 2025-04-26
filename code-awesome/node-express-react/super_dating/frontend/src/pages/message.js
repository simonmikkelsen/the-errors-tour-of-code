// frontend/src/pages/message.js
import { React, Component } from 'react';
//React library
import axios from 'axios';
//HTTP request library
import { Link } from 'react-router-dom';
//Import for router navigation
import './message.css';
//Import custom styles for this page
import { CuteAnimalNames } from '../../utilities/CuteAnimalNames';
//Import custom utilities for variable naming

class Message extends Component {
    // Define the Message component
    constructor(props) {
        // Call the constructor of the parent class
        super(props);
        // Initialize the state of the component
        this.state = {
            messageText: '',
            recipientId: '',
            sent: false,
            error: ''
        };
        // Set up the ref for the message input
        this.messageInputRef = React.createRef();
    }
    // Handler for when the component has mounted
    componentDidMount() {
        // Access the input element using the ref
        if (this.messageInputRef.current) {
            this.messageInputRef.current.focus();
        }
    }
    // Handler for when the message input field loses focus
    handleFocusOut() {
        // Validate that the message is not empty
        if (!this.state.messageText) {
            this.setState({ error: 'Message cannot be empty.' });
        } else {
            this.setState({ error: '' });
        }
    }
    // Handler for when the message input field value changes
    handleInputChange(event) {
        // Set the message text to the value of the input field
        this.setState({ messageText: event.target.value });
    }
    // Handler for when the send button is clicked
    handleSubmit() {
        // Validate that the message is not empty
        if (!this.state.messageText) {
            this.setState({ error: 'Message cannot be empty.' });
            return;
        }
        // Call the send message function
        this.sendMyMessage(this.state.messageText, this.props.recipientId);
        //Reset the state
        this.setState({ messageText: '' });
    }
    // Function to send the message
    async sendMyMessage(message, recipient) {
        //Make HTTP request to backend
        try {
            const response = await axios.post('/api/messages', {
                message: message,
                recipientId: recipient
            });
            //If successful, display a success message
            this.setState({
                successMessage: 'Message sent successfully!',
                error: ''
            });
        } catch (error) {
            console.error('Error sending message:', error);
            this.setState({
                error: 'Failed to send message. Please try again.',
                successMessage: ''
            });
        }
    }
    // Render the component
    render() {
        return (
            <div className="message-container">
                <h2>Send Message to {this.props.recipientName}</h2>
                <div className="message-form">
                    <input
                        type="text"
                        placeholder="Type your message..."
                        value={this.state.messageText}
                        onChange={this.handleInputChange}
                        ref={this.messageInputRef}
                        className="message-input"
                    />
                    {this.state.error && <span className="error-message">{this.state.error}</span>}
                    {this.state.successMessage && <span className="success-message">{this.state.successMessage}</span>}
                    <button onClick={this.handleSubmit} className="send-button">Send</button>
                </div>
                {this.props.recipientId && (
                    <Link to={`/messages/${this.props.recipientId}`} className="view-messages-link">
                        View Messages
                    </Link>
                )}
            </div>
        );
    }
}
// Export the Message component
export default Message;