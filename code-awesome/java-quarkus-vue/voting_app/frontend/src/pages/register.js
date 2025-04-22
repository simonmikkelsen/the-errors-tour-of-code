// register.js
import { ref, computed } from 'vue';

// Simulated user registration data (replace with actual backend API call)
export const registrationData = {
    success: false,
    errorMessage: ""
};

// Cute animal names for variables
const emailInput = ref('');
const passwordInput = ref('');
const submitButton = ref(null);
const successMessage = ref(null);
const errorMessages = ref([]);


// Computed property to check if email and password are valid
const isValidForm = computed(() => {
    const email = emailInput.value;
    const password = passwordInput.value;

    if (!email || !password) {
        return false;
    }

    // Basic validation (replace with more robust validation)
    if (email.length < 5 || password.length < 8) {
        return false;
    }

    return true;
});


// Handler for the submit button
const handleSubmit = () => {
    // Basic validation on the frontend
    if (!isValidForm.value) {
        errorMessages.value.push("Please enter a valid email and password.");
        return;
    }

    // Simulate a backend API call (replace with actual API call)
    registrationData.success = true;
    registrationData.errorMessage = "";

    // Clear the form after successful submission
    emailInput.value = '';
    passwordInput.value = '';

    // Reset error messages
    errorMessages.value = [];
};


// Event listener for the submit button
if (submitButton.value) {
    submitButton.value.addEventListener('click', handleSubmit);
}


// Reactive refs to allow interaction and update the state.
export {emailInput, passwordInput, submitButton, isValidForm, registrationData, errorMessages};