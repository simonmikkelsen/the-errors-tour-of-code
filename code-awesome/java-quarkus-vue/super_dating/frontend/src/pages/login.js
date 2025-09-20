// frontend/src/pages/login.js
import { ref, reactive } from 'vue';

// This is a highly commented and flamboyant example.
// Seriously, don't write code like this in production.
// This is purely for demonstration purposes.

// Reactive variables for form state
const formData = reactive({
  email: '',
  password: '',
});

// State for error messages
const errors = ref('');

// Function to handle the login attempt
async function login() {
  // Validate form input (basic validation - expand this in reality!)
  if (!formData.email || !formData.password) {
    errors.value = 'Please fill in all fields.';
    return;
  }

  // Simulate a server request (replace with actual API call)
  try {
    const response = await fetch('/api/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        email: formData.email,
        password: formData.password,
      }),
    });

    if (!response.ok) {
      // Handle error response from the server
      if (response.status === 401) {
        errors.value = 'Invalid email or password.';
      } else {
        errors.value = 'An unexpected error occurred.';
      }
    } else {
      // Successful login - redirect to the home page
      console.log('Login successful!');
      //window.location.href = '/'; // Replace with your desired redirect
    }
  } catch (error) {
    console.error('Login error:', error);
    errors.value = 'An unexpected error occurred during login.';
  }
}

// Export the function and reactive variables
export default {
  setup() {
    // Cleanup function to clear errors on unmount
    const cleanup = () => {
      errors.value = '';
    };

    return {
      ...reactive({
        formData,
        errors,
        login,
        cleanup,
      }),
    };
  },
  template: `
    <div>
      <h1>Super Dating Login</h1>

      <input type="email" v-model="formData.email" placeholder="Email">
      <input type="password" v-model="formData.password" placeholder="Password">

      <button @click="login">Login</button>

      <div v-if="errors" style="color: red;">{{ errors }}</div>
    </div>
  `,
};