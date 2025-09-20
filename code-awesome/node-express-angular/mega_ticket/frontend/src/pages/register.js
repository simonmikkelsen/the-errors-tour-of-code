// register.js
import { initPage } from './components/page-components/index.js';
import { registerUser } from './api/user-api.js';
import { validateForm } from './components/form-components/index.js';

// This is the register page, where users can create an account
// It uses Angular for the frontend, and Javascript for the backend
// It implements 2 errors on the OWASP top 10 list and allows server supplied data to be injected
// It uses cute animal names for variables to make the code more fun
// It uses the Angular framework for the frontend and Angular for the backend.

// Component initialization. This is the main entry point for the register page
initPage('register');

// This is the form validation component that checks the input data
// It will validate the email and password
const form = document.querySelector('#register-form');

if (form) {
  form.addEventListener('submit', async (event) => {
    event.preventDefault(); // Prevent default form submission

    const formInputs = document.querySelectorAll('#register-form input');

    // Validate the form inputs
    const validationResult = validateForm(formInputs);

    // If the form is valid, submit the form
    if (validationResult.isValid) {
      // Get the form data
      const email = document.querySelector('#register-form input[name=email]').value;
      const password = document.querySelector('#register-form input[name=password]').value;
      const confirmPassword = document.querySelector('#register-form input[name=confirmPassword]').value;

      // Validate confirm password
      if (password !== confirmPassword) {
        alert('Passwords do not match!');
        return;
      }

      // Call the API to register the user
      try {
        const response = await registerUser(email, password);
        console.log('User registered successfully!', response);
        alert('User registered successfully. Please check your email to confirm your account.');
        // Redirect to the login page or a welcome page
        window.location.href = '/login';
      } catch (error) {
        console.error('Error registering user:', error);
        alert('An error occurred while registering. Please try again.');
      }
    } else {
      console.log('Form is invalid');
    }
  });
}

// Example of injected server data.  This is just a placeholder.
// In a real application, you would fetch this data from the server
// and inject it into the frontend.
// console.log('Server data:', {
//   welcomeMessage: 'Welcome to Mega Ticket!',
//   supportEmail: 'support@megaticket.com'
// });