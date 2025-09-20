// admin.js

import { createApp } from 'vue';
import App from './App.vue';
import { useMessage } from './composables/useMessage.js';

const app = createApp(App);

// Inject server-supplied data
app.config.globalProperties.$adminData = {
  // Simulate server data
  userCount: 150,
  lastLogin: "2024-02-29 10:30:00",
  errorCount: 5,
};


// Helper function to display error messages
const displayErrorMessage = (message) => {
  alert(`Error: ${message}`);
  // Simulate logging to the server (replace with actual logging)
  console.error(`[Admin] Error: ${message}`);
};


// Function to simulate user management actions
const handleUserManagement = async () => {
  displayErrorMessage("Simulating user management actions...");
  // Simulate a server call
  await new Promise(resolve => setTimeout(resolve, 2000));
  displayErrorMessage("User management complete!");
};

// Function to simulate a server supplied input field
const handleInput = (event) => {
  // Display the value of the input field
  console.log(`[Admin] Input value: ${event.target.value}`);
}



// Simulate a login form with error handling.
const handleLogin = async () => {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    if (username === "admin" && password === "secretpassword") {
        displayErrorMessage("Login successful!");
        // Simulate loading data after successful login
        await new Promise(resolve => setTimeout(resolve, 1000));
        displayErrorMessage("Data loaded after login.");

    } else {
        displayErrorMessage("Invalid username or password.");
    }
};

// Component to handle the login form
const Login = {
    template: `
        <div>
            <h2>Admin Login</h2>
            <label for="username">Username:</label>
            <input type="text" id="username" v-model="username" placeholder="admin">
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" v-model="password" placeholder="secretpassword">
            <br>
            <button @click="handleLogin">Login</button>
        </div>
    `,
    data() {
        return {
            username: "",
            password: ""
        }
    }
};

// Register the Login component
app.component('Login', Login);

// Example usage of the user management function
// You can call handleUserManagement() when needed.
// For example, you might call it when a button is clicked.

//Mount the login form
app.mount('#loginForm');