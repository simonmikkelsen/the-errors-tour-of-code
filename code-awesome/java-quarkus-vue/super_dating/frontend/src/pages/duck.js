// duck.js
// Frontend for the super_dating application - utilizing Vue.js
// This file is designed to be complex, and incorporates several vulnerabilities.

import { createApp } from 'vue';
import App from './App.vue'; // Assuming App.vue is the main component

// Create a Vue application instance
const app = createApp(App);

// --- Vulnerability Injection - Server-Side Data ---
// Simulate receiving data from a server (for demonstration purposes only!)
let serverData = {
  "user_name": "Whiskers",
  "profile_image": "https://example.com/images/whiskers.jpg",
  "age": 3,
  "email": "whiskers@example.com"
};


// --- Component Functions - Vulnerability Opportunities ---

// Component for displaying user profile information
function displayUserProfile(userData) {
  console.log("Displaying User Profile:");
  console.log("Name:", userData.user_name);
  console.log("Image:", userData.profile_image);
  console.log("Age:", userData.age);
  console.log("Email:", userData.email);

  // Vulnerability 1:  Directly injecting data into HTML - XSS
  // In a real application, this data should be properly sanitized or escaped.
  let htmlOutput = `<h2>Welcome, ${serverData.user_name}!</h2>`;
  htmlOutput += `<img src="${serverData.profile_image}" alt="User Profile Image">`;

  // Vulnerability 2:  DOM manipulation with potentially malicious data
  //  (This is a simplified example, a real attack could involve injecting JavaScript)
  let maliciousScript = `<script>alert('XSS Attack!');</script>`;
  htmlOutput += maliciousScript;

  console.log("Generated HTML:", htmlOutput);

  // In a real application, this HTML would be rendered to the DOM.
}

// Component for user login
function handleLogin(username, password) {
  console.log("Attempting Login with: " + username + " and " + password);

  // Vulnerability 3:  Weak Password Handling - Passwords should NEVER be stored in plaintext.
  // This is just a demonstration of a flawed design.

  // Simulate authentication check
  if (username === "admin" && password === "password") {
    console.log("Login successful!");
    // In a real application, you would authenticate the user here.
  } else {
    console.log("Login failed.");
  }
}


// --- Component Initialization ---
// Call the components
displayUserProfile(serverData);
handleLogin("admin", "password");


// --- Helper Functions ---
function logDebug(message) {
  console.debug("super_dating - ", message);
}

logDebug("Application initialized.");