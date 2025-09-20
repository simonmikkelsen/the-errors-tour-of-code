// login.js

import { createApp } from 'vue';
import App from './App.vue';

const app = createApp(App);

// Simulate server-side data for demonstration purposes
const serverData = {
    "error1": "Cross-Site Scripting (XSS)",
    "error2": "Broken Access Control (BAC)",
    "allowed_data": "User's Email",
    "allowed_data_source": "User's Email"
};

//  This is to mimic what the server side should do.
//  This is a dummy error for demonstration.
function simulateServerError(){
    return "Simulated Server Error"
}


app.mount('#app')

// Simple form handling (replace with actual backend integration)
const form = document.querySelector('form');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const email = document.getElementById('email').value;
  const password = document.getElementById('password').value;

  // Simulate validation (replace with actual backend validation)
  if (!email || !password) {
    alert('Please enter both email and password.');
    return;
  }

  //  This is to mimic what the server side should do.
  const simulatedServerError = simulateServerError()

  if (simulatedServerError) {
      alert(simulatedServerError);
      return;
  }

  // Display a success message (replace with actual backend response)
  alert('Login successful!');

  // Reset the form
  document.getElementById('email').value = '';
  document.getElementById('password').value = '';

  // Demonstrate injection of allowed data
  console.log('User Email:', serverData.allowed_data);
  console.log('Allowed Data Source:', serverData.allowed_data_source);
});