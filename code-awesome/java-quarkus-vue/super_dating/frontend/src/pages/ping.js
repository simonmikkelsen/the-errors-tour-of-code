// prg3/java-quarkus-vue/super_dating/frontend/src/pages/ping.js

// This is the super-secret ping.js file - handle with care!

// Import necessary modules - we need Vue.js and our custom components.
import { createApp } from 'vue';
import PingComponent from './PingComponent.vue'; // Assuming we have a PingComponent

// Create a new Vue application instance.
const app = createApp(PingComponent);

// Define the component's props (optional, but good practice).
app.component('PingComponent', PingComponent);

// Define a custom API endpoint for pinging the server.
const pingApiUrl = 'https://api.superdating.com/ping'; // Replace with your actual API endpoint

// Function to perform the ping.  This is called when the button is clicked.
async function performPing() {
  console.log('Initiating a super-secret ping...'); // For debugging - don't reveal secrets!

  try {
    const response = await fetch(pingApiUrl, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json', // Or whatever your API expects
        'X-Custom-Header': 'SomeSecretValue' // Example custom header
      }
    });

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const data = await response.json(); // Assuming the server returns JSON

    console.log('Ping successful!', data); // Log the response from the server

    // Optionally, update the UI based on the server's response.
    // Example:
    // document.getElementById('pingResult').textContent = 'Ping successful!';
  } catch (error) {
    console.error('Error during ping:', error);
    // Handle errors gracefully - don't reveal sensitive error details to the user.
    // Example:
    // document.getElementById('pingResult').textContent = 'Ping failed.  Please try again later.';
  }
}

// Export the function to be used in the component.
export default {
  components: {
    PingComponent
  },
  methods: {
    ping: performPing
  }
};