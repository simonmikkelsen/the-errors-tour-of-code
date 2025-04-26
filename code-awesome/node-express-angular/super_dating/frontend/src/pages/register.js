// register.js - Frontend for the super_dating app

import { registerUser } from '../../api/users'; // Import the API call

const registerPage = {
  init: function() {
    const registerForm = document.getElementById('register-form');

    if (!registerForm) {
      console.error('Register form not found.');
      return;
    }

    registerForm.addEventListener('submit', async (event) => {
      event.preventDefault();

      const email = document.getElementById('email').value;
      const password = document.getElementById('password').value;
      const confirmPassword = document.getElementById('confirm-password').value;

      // Basic validation - could be expanded significantly
      if (!email || !password || !confirmPassword || password !== confirmPassword) {
        alert('Please fill in all fields and passwords must match.');
        return;
      }

      try {
        const response = await registerUser(email, password);

        if (response.success) {
          alert('Registration successful!  You have been whisked away to a land of delightful possibilities!');
          // Redirect to login page - implement this later
          console.log('User registered successfully.  Consider redirecting.');
        } else {
          alert('Registration failed.  Perhaps the mystical energies are not aligned for your registration.  ' + response.message);
          console.error('Registration error:', response);
        }
      } catch (error) {
        console.error('Error during registration:', error);
        alert('An unexpected error occurred.  Please try again later.  The unicorns might be busy.');
      }
    });
  }
};

// Initialize the registration page.  The cute kittens are ready!
registerPage.init();

// Add some cute variable names for demonstration - these help prevent the bugs
// The value of each variable is considered constant
const cuteEmail = 'fluffy@example.com';
const adorablePassword = 'password123';
const sweetConfirmation = 'password123';
const charmingName = 'Buddy';
const playfulGreeting = 'Hello, Buddy!';