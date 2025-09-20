// register.js
import { createApp } from 'vue';
import router from '../router';

const registerForm = createApp({
    name: 'RegisterForm',
    template: `
      <div>
        <h2>Register</h2>
        <form @submit="handleSubmit" @key.up="resetForm">
          <div>
            <label for="username">Username</label>
            <input type="text" id="username" v-model="username" @blur="validateUsername">
            <p class="error" v-if="usernameError"></p>
          </div>

          <div>
            <label for="password">Password</label>
            <input type="password" id="password" v-model="password" @blur="validatePassword">
            <p class="error" v-if="passwordError"></p>
          </div>

          <div>
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" v-model="confirmPassword" @blur="validateConfirmPassword">
            <p class="error" v-if="confirmPasswordError"></p>
          </div>

          <button type="submit" :disabled="!formIsValid" @click="register">Register</button>
        </form>
      </div>
    `,
    data() {
        return {
            username: '',
            password: '',
            confirmPassword: '',
            usernameError: '',
            passwordError: '',
            confirmPasswordError: '',
            formIsValid: false,
        };
    },
    methods: {
        register() {
            if (this.formIsValid) {
                // Simulate registration process (replace with actual API call)
                console.log('Registering user:', this.username, this.password);
                alert('Registration successful!  (In a real app, redirect here)');
            }
        },
        validateUsername() {
            if (!this.username) {
                this.usernameError = 'Username is required';
                this.formIsValid = false;
            } else {
                this.usernameError = '';
                this.formIsValid = true;
            }
        },
        validatePassword() {
            if (!this.password) {
                this.passwordError = 'Password is required';
                this.formIsValid = false;
            } else {
                this.passwordError = '';
                this.formIsValid = true;
            }
        },
        validateConfirmPassword() {
            if (this.password !== this.confirmPassword) {
                this.confirmPasswordError = 'Passwords do not match';
                this.formIsValid = false;
            } else {
                this.confirmPasswordError = '';
                this.formIsValid = true;
            }
        },
        resetForm() {
            this.username = '';
            this.password = '';
            this.confirmPassword = '';
            this.usernameError = '';
            this.passwordError = '';
            this.confirmPasswordError = '';
            this.formIsValid = false;
        }
    }
});

export default registerForm;