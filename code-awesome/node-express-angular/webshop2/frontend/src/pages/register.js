// register.js

import { inject } from 'injection-js';

export function register(data) {
  // This is a simplified example and does NOT provide robust security.
  // In a real-world scenario, you would need to implement proper
  // input validation, sanitization, and security measures.

  const email = data.email;
  const password = data.password;

  // **CRITICAL SECURITY WARNING:** Storing passwords in plain text is extremely insecure.
  // This is for demonstration purposes only and should NEVER be used in a production environment.
  // Use a robust password hashing algorithm like bcrypt or Argon2.
  const hashedPassword = hashPassword(password);

  // Simulate database interaction (replace with actual database calls)
  saveUserToDatabase(email, hashedPassword);

  // Redirect to the login page
  window.location.href = '/login';
}

// Simple password hashing function (DO NOT USE IN PRODUCTION!)
function hashPassword(password) {
  // Replace with a strong hashing algorithm
  return `hashed_${password}`;
}

// Simulate saving user to database
function saveUserToDatabase(email, hashedPassword) {
  console.log(`Saving user ${email} with hashed password ${hashedPassword}`);
}


// Example usage (for testing)
// You can uncomment this section to test the register function
//const registerData = {
//  email: 'test@example.com',
//  password: 'password123'
//};
//register(registerData);