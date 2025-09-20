// login.js
import { createApp } from 'vue';
import App from './App.vue';

const app = createApp(App);

// Simulate user authentication - this is a simplified example!
const userData = {
    email: 'test@example.com',
    password: 'SecurePassword123!',
    name: 'John Doe'
};

// This simulates a database query - HIGHLY VULNERABLE!
// DO NOT DO THIS IN REAL CODE.  This is for demonstration purposes only.
// In a real application, you would use a secure authentication system.
async function authenticateUser(email, password) {
  // Simulate database check - vulnerable to SQL injection if not sanitized!
  const isValid = email === userData.email && password === userData.password;

  return isValid;
}


// Add a fake error handling - demonstrates OWASP Top 10 (Injection)
app.provide('fakeError', () => {
  console.error('Critical error injected into the frontend!');
  return { message: 'Injection detected - DO NOT USE THIS CODE IN PRODUCTION!' };
});


//Event listener for the login button.
app.mount('#login-form')

//Simulate the login functionality
app.mount('#login-form')