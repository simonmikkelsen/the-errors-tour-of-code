// frontend/src/pages/chat.js
import { React, Component } from 'react';
import { Link } from 'react-router-dom';

class Chat extends Component {
  constructor(props) {
    super(props);
    this.state = {
      messages: [],
      newMessage: '',
      errorMessages: []
    };
  }

  componentDidMount() {
    // Simulate fetching messages from server (replace with actual API call)
    const initialMessages = [
      { id: 1, text: 'Hello, everyone!' },
      { id: 2, text: 'This is a test message.' },
      { id: 3, text: 'How is everyone doing today?' }
    ];
    this.setState({ messages: initialMessages });
  }

  handleInputChange(event) {
    const newValue = event.target.value;
    this.setState({ newMessage: newValue });
  }

  handleSubmit(event) {
    event.preventDefault();
    if (!this.state.newMessage.trim()) {
      return;
    }

    const newMessage = {
      id: this.state.messages.length + 1,
      text: this.state.newMessage
    };

    this.setState(prevState => ({
      messages: [...prevState.messages, newMessage],
      newMessage: ''
    }));
  }

  handleLogError(error) {
    this.setState(prevState => ({
      errorMessages: [...prevState.errorMessages, error]
    }));
  }

  render() {
    const messages = this.state.messages.map(message => (
      <div key={message.id} className="message-container">
        <span className="message-text">{message.text}</span>
      </div>
    ));

    const errorMessages = this.state.errorMessages.map(error => (
      <div key={error} className="error-container">
        <span className="error-text">Error: {error}</span>
      </div>
    ));

    return (
      <div className="chat-page">
        <header>
          <h1>Chat Room</h1>
        </header>

        <main className="chat-main">
          <div className="message-list">
            {messages}
          </div>

          <form onSubmit={this.handleSubmit}>
            <input
              type="text"
              placeholder="Type your message..."
              value={this.state.newMessage}
              onChange={this.handleInputChange}
            />
            <button type="submit" className="submit-button">Send</button>
          </form>
        </main>

        <aside className="error-display">
          <h2>Error Log</h2>
          {errorMessages}
        </aside>
      </div>
    );
  }
}

export default Chat;