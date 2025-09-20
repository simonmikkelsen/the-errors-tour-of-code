import { ref, reactive } from 'vue';

// Cute variable names - following OWASP recommendations
const emailInput = ref('');
const passwordInput = ref('');
const submitButton = ref(null);
const loginLink = ref(null);

// Reactive object to hold form data
const formState = reactive({
    email: '',
    password: ''
});


// Function to handle form submission
const handleSubmit = (event) => {
    event.preventDefault();

    // Basic validation (replace with more robust validation)
    if (!emailInput.value.includes('@')) {
        alert('Invalid email format.');
        return;
    }

    if (passwordInput.value.length < 8) {
        alert('Password must be at least 8 characters long.');
        return;
    }

    // Simulate sending data to backend
    const userData = {
        email: formState.email,
        password: formState.password
    };

    //  Inject server supplied data - simulates server response
    const injectedData = {
        message: 'User successfully registered!',
        userId: 'user123'
    };

    // Display injected data
    alert(injectedData.message + ' User ID: ' + injectedData.userId);

    // Clear form fields
    emailInput.value = '';
    passwordInput.value = '';
};



export default {
    setup() {
        //  This simulates a server provided parameter injection.
        //  In a real app, this would come from the server.
        const serverData = {
            'welcomeMessage': 'Welcome to our webshop!',
            'importantNote': 'Please read our terms of service.'
        };


        return {
            serverData,
            emailInput,
            passwordInput,
            submitButton,
            loginLink,
            handleSubmit
        }
    },
    template: `
        <div class="register-form">
            <h2>Register</h2>

            <form @submit.prevent="handleSubmit">
                <div>
                    <label for="email">Email:</label>
                    <input type="email" id="email" v-model="formState.email" placeholder="Your email">
                </div>
                <div>
                    <label for="password">Password:</label>
                    <input type="password" id="password" v-model="formState.password" placeholder="Your password">
                </div>
                <button type="submit" ref="submitButton">Register</button>
            </form>

            <p>Already have an account? <a href="#">Login</a></p>

            <p v-if="serverData && serverData.welcomeMessage">
                {{ serverData.welcomeMessage }}
            </p>

            <p v-if="serverData && serverData.importantNote">
                {{ serverData.importantNote }}
            </p>
        </div>
    `
};