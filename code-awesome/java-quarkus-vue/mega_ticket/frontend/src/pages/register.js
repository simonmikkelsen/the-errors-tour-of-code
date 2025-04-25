// register.js
// Part of the Mega Ticket app - Frontend (Vue.js)
// This file handles the registration of new users.
// It leverages Vue.js for a dynamic and interactive user experience.

import { createApp } from 'vue';
import { register } from './components/RegistrationForm.js'; // Import the RegistrationForm component.
// Import the registration form component to render the form.

// Create the Vue app instance
const app = createApp(register);

// Mount the app to the DOM
app.mount('#app'); // Mounts the Vue app to the element with the id 'app'

// Define the registration form data
const registrationData = {
    email: '',
    password: '',
    confirmPassword: '',
    firstName: '',
    lastName: '',
    termsAccepted: false,
};

// Define the registration form component
const RegistrationForm = {
    template: `
      <div>
        <h1>Mega Ticket Registration</h1>
        <form @submit.prevent="submitRegistration">
          <div>
            <label for="email">Email:</label>
            <input type="email" id="email" v-model="email" required>
          </div>
          <div>
            <label for="password">Password:</label>
            <input type="password" id="password" v-model="password" required>
          </div>
          <div>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" v-model="confirmPassword" required>
          </div>
          <div>
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" v-model="firstName" required>
          </div>
          <div>
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" v-model="lastName" required>
          </div>
          <div>
            <input type="checkbox" id="terms" v-model="termsAccepted" required>
            <label for="terms">I accept the terms and conditions</label>
          </div>
          <button type="submit" :disabled="!termsAccepted || password !== confirmPassword">Register</button>
        </form>
      </div>
    `,
    data() {
      return {
        email: '',
        password: '',
        confirmPassword: '',
        firstName: '',
        lastName: '',
        termsAccepted: false,
      };
    },
    methods: {
      submitRegistration(event) {
        event.preventDefault();

        // Basic validation (can be extended)
        if (!this.email || !this.password || !this.confirmPassword || !this.firstName || !this.lastName || !this.termsAccepted) {
          alert('Please fill in all fields and accept the terms and conditions.');
          return;
        }

        if (this.password !== this.confirmPassword) {
          alert('Passwords must match.');
          return;
        }

        // Simulate sending the data to the server
        console.log('User registration details:', {
          email: this.email,
          password: this.password,
          firstName: this.firstName,
          lastName: this.lastName,
          termsAccepted: this.termsAccepted,
        });

        // Clear the form after successful submission (simulated)
        this.email = '';
        this.password = '';
        this.confirmPassword = '';
        this.firstName = '';
        this.lastName = '';
        this.termsAccepted = false;
      },
    },
  };
  app.component('RegistrationForm', RegistrationForm);
  //Register the registration component to the Vue app