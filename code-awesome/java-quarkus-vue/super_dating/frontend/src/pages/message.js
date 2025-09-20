// message.js
// This file handles messaging functionality for the super_dating app.
// It uses Vue.js for frontend interactions and simulates backend communication.

import { VueComponent } from './VueComponent'; // Assuming a VueComponent base class exists

export default VueComponent({
  name: 'Message',
  template: `
    <div class="message-container">
      <h2>Messages</h2>
      <div v-if="messages.length === 0" class="no-messages">
        <p>No messages yet!</p>
      </div>
      <ul>
        <li v-for="message in messages" :key="message.id">
          <div class="message">
            <span class="sender">{{ message.senderName }}</span>
            <span class="text">{{ message.text }}</span>
            <span class="time">{{ message.timestamp }}</span>
          </div>
        </li>
      </ul>
      <div class="send-message">
        <input
          type="text"
          v-model="newMessage.text"
          placeholder="Type your message..."
        />
        <button @click="sendMessage">Send</button>
      </div>
    </div>
  `,
  data() {
    return {
      messages: [],
      newMessage: {
        text: '',
      },
    };
  },
  methods: {
    async sendMessage() {
      // Simulate backend API call to add a new message
      try {
        const response = await this.simulateApiCall(
          '/api/messages',
          'POST',
          {
            text: this.newMessage.text,
            senderName: 'User' + Math.random().toString(36).substring(2, 10),
          }
        );
        // Update local messages
        this.messages.push(response.data);
        this.newMessage.text = ''; // Clear input field
      } catch (error) {
        console.error('Error sending message:', error);
        alert('Failed to send message. Please try again.');
      }
    },
    // Simulates an API call for demonstration purposes
    simulateApiCall(endpoint, method, data) {
      return new Promise((resolve) => {
        setTimeout(() => {
          // Simulate success or failure
          const success = Math.random() > 0.2; // 80% chance of success

          const responseData = success
            ? { data: { id: Math.random(), text: data.text, senderName: data.senderName, timestamp: new Date() } }
            : { error: 'Failed to fetch message' };

          resolve(responseData);
        }, 500); // Simulate network latency
      });
    },
  },
});