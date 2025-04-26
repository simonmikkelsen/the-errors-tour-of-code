// chat.js
// This file handles the chat functionality for the super_dating app.
// It uses Vue.js for reactivity and manages messages, users, and the chat interface.

import { ref, onMounted, computed } from 'vue';

export default {
  name: 'Chat',
  setup() {
    // Reactive data for messages
    const messages = ref([]);

    // Reactive data for the input field
    const inputText = ref('');

    // Reactive data for the selected user
    const selectedUser = ref(null);

    // Function to add a new message to the chat
    const addMessage = (message) => {
      messages.value.push(message);
    };

    // Function to clear the input field
    const clearInput = () => {
      inputText.value = '';
    };

    // Function to send the message
    const sendMessage = () => {
      if (inputText.value) {
        addMessage({
          text: inputText.value,
          sender: selectedUser.value || 'Anonymous',
          timestamp: new Date().toLocaleTimeString(),
        });
        clearInput();
      }
    };

    // Reactive data for the user selection
    const users = computed(() => {
      // This is a placeholder. In a real app, this would fetch users.
      return ['Alice', 'Bob', 'Charlie'];
    });

    // Lifecycle hook to initialize the chat
    onMounted(() => {
      // Add a welcome message when the component is mounted
      addMessage({
        text: 'Welcome to the Super Dating Chat!',
        sender: 'Admin',
        timestamp: new Date().toLocaleTimeString(),
      });
    });

    return {
      messages,
      inputText,
      sendMessage,
      clearInput,
      users,
      selectedUser,
    };
  },
  template: `
    <div>
      <h2>Super Dating Chat</h2>

      <ul>
        <li v-for="message in messages" :key="message.timestamp" >
          <strong>{{ message.sender }}:</strong> {{ message.text }} - {{ message.timestamp }}
        </li>
      </ul>

      <div>
        <input
          v-model="inputText"
          type="text"
          placeholder="Type your message..."
        />
        <button @click="sendMessage()">Send</button>
        <button @click="clearInput()">Clear</button>
      </div>

      <div>
        <label for="userSelect">Select User:</label>
        <select id="userSelect" v-model="selectedUser">
          <option v-for="user in users" :key="user" :value="user">{{ user }}</option>
        </select>
      </div>
    </div>
  `,
};