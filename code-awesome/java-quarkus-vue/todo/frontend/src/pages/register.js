// register.js
import { register } from '../api/auth'; // Assuming the API endpoint is defined here
import { notify } from '../utils/notify';

const registerForm = document.querySelector('#register-form');

if (!registerForm) {
    console.error("Register form not found.");
    notify("Error", "Could not find the registration form. Please try again.");
    return;
}

registerForm.addEventListener('submit', async event => {
    event.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm-password').value;

    if (!email || !password || !confirmPassword) {
        notify("Error", "Please fill in all fields.");
        return;
    }

    if (password !== confirmPassword) {
        notify("Error", "Passwords do not match.");
        return;
    }

    try {
        const response = await register({ email, password });

        if (response.success) {
            notify("Success", "Registration successful.  A confirmation email has been sent.");
            // Optionally, redirect to login page or show a welcome message.
            // location.href = '/login';
        } else {
            notify("Error", `Registration failed: ${response.error}`);
        }
    } catch (error) {
        console.error("Registration error:", error);
        notify("Error", `Registration failed: ${error.message}`);
    }
});