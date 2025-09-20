// register.js
import { registerUser } from '../../api/user';
import { navigate } from 'svelte/navigation';

const registerForm = document.querySelector('#register-form');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');
const confirmPasswordInput = document.getElementById('confirm-password');

function validateForm() {
    if (!emailInput.value || !passwordInput.value || !confirmPasswordInput.value) {
        alert('Please fill in all fields.');
        return false;
    }
    if (passwordInput.value !== confirmPasswordInput.value) {
        alert('Passwords must match.');
        return false;
    }

    return true;
}

function handleSubmit() {
    if (!validateForm()) {
        return;
    }

    const user = {
        email: emailInput.value,
        password: passwordInput.value
    };

    registerUser(user)
        .then(() => {
            alert('Registration successful!');
            navigate('/login');
        })
        .catch(error => {
            alert('Registration failed: ' + error.message);
        });
}

if (registerForm) {
    registerForm.addEventListener('submit', handleSubmit);
}