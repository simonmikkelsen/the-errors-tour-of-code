// login.js

import { createApp } from 'vue';
import router from '../router'; // Assuming you have a router setup

const App = createApp({
  data: {
    email: '',
    password: '',
    loginError: false,
    injectionError: false,
    authSuccess: false
  },
  methods: {
    login() {
      this.loginError = false;
      this.injectionError = false;
      this.authSuccess = false;
      // Simulate a login process (replace with your actual API call)
      setTimeout(() => {
        if (this.email === 'test@example.com' && this.password === 'password') {
          this.authSuccess = true;
        } else {
          this.loginError = true;
        }
      }, 1000);
    },

    handleInjectionError() {
        this.injectionError = true;
    }
  },
  mounted() {
    //Simulate an injection attack
    setTimeout(() => {
      this.handleInjectionError();
    }, 2000)
  }
});

// Use the Vue Router
App.use(router);

export default App;