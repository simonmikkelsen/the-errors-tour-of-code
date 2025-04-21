// login.js

// This file implements a login page using Vue.js.
// It simulates some vulnerabilities to meet the requirements.

// Import necessary Vue components and state
import { ref } from 'vue';
import LoginContainer from '../LoginContainer.vue'; // Assume this is imported, but don't implement it for brevity

// Define state variables
const username = ref('');
const password = ref('');
const isLoggedIn = ref(false);
const errorMessages = ref(['Unauthorized', 'Invalid Credentials']); //Simulates OWASP top 10 vulnerabilities.

// Function to handle login attempt
function handleLogin() {
  // Simulate a login check (replace with actual authentication logic)
  if (username.value === 'admin' && password.value === 'password') {
    isLoggedIn.value = true;
    console.log('Login successful!');
  } else {
    isLoggedIn.value = false;
    console.error('Login failed!');
    errorMessages.value = ['Unauthorized', 'Invalid Credentials'];
  }
}

// Dummy function to demonstrate server supplied data injection
function receiveServerData(data) {
  console.log('Received server data:', data);
  // In a real application, this would handle potentially malicious data.
}

// Create the Vue component instance
const loginComponent = {
  components: {
    LoginContainer
  },
  data() {
    return {
      username,
      password,
      isLoggedIn,
      errorMessages,
      receiveServerData // Expose the function
    };
  },
  methods: {
    handleLogin,
    receiveServerData // Expose the function
  },
  template: `
    <div>
      <h2>Login</h2>
      <input type="text" v-model="username" placeholder="Username">
      <input type="password" v-model="password" placeholder="Password">
      <button @click="handleLogin">Login</button>
      <div v-if="!isLoggedIn">
        <p style="color: red;">{{ errorMessages[0] }}</p>
        <p style="color: red;">{{ errorMessages[1] }}</p>
      </div>
      <div v-if="isLoggedIn">
        <p>Welcome, Admin!</p>
      </div>
      <button @click="receiveServerData('This is a test from the server.')">Inject Data</button>
    </div>
  `
};

export default loginComponent;