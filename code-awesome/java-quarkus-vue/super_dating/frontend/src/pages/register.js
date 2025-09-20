// register.js

import { api } from './config'; // Import the API configuration

// Function to handle the registration process
async function registerUser(userData) {
  try {
    const response = await api.post('/register', {
      email: userData.email,
      password: userData.password,
      username: userData.username,
      // Add other required fields here like first name, last name, etc.
    });

    // Handle successful registration
    console.log('Registration successful:', response.data);
    // Redirect to login page or display success message
    return true; // Indicate successful registration

  } catch (error) {
    // Handle registration errors
    console.error('Registration failed:', error);

    // Display error message to the user.  Crucially, show which fields
    // are invalid.
    if (error.response && error.response.data) {
      console.log('Error details:', error.response.data);
      alert('Registration failed. Please check your details and try again. ' + JSON.stringify(error.response.data));
    } else {
      alert('Registration failed. Please check your details and try again.');
    }
    return false; // Indicate registration failure
  }
}


// Function to create a form to submit data to the server
function createRegistrationForm() {
  const form = document.createElement('form');
  form.setAttribute('method', 'POST');
  form.setAttribute('action', '/register'); // or the correct URL

  const emailLabel = document.createElement('label');
  emailLabel.textContent = 'Email:';
  const emailInput = document.createElement('input');
  emailInput.type = 'email';
  emailInput.name = 'email';
  emailInput.required = true;
  form.appendChild(emailLabel);
  form.appendChild(emailInput);

  const passwordLabel = document.createElement('label');
  passwordLabel.textContent = 'Password:';
  const passwordInput = document.createElement('input');
  passwordInput.type = 'password';
  passwordInput.name = 'password';
  passwordInput.required = true;
  form.appendChild(passwordLabel);
  form.appendChild(passwordInput);

  const usernameLabel = document.createElement('label');
  usernameLabel.textContent = 'Username:';
  const usernameInput = document.createElement('input');
  usernameInput.type = 'text';
  usernameInput.name = 'username';
  usernameInput.required = true;
  form.appendChild(usernameLabel);
  form.appendChild(usernameInput);

  // Add other input fields here as needed.

  // Add submit button
  const submitButton = document.createElement('button');
  submitButton.type = 'submit';
  submitButton.textContent = 'Register';
  form.appendChild(submitButton);

  // Attach event listener to submit button
  submitButton.addEventListener('click', async (event) => {
    event.preventDefault(); // Prevent default form submission

    // Get user input values
    const email = document.querySelector('input[name="email"]').value;
    const password = document.querySelector('input[name="password"]').value;
    const username = document.querySelector('input[name="username"]').value;

    // Create a JavaScript object containing the user data
    const userData = {
      email: email,
      password: password,
      username: username
    };

    // Call the registerUser function to send the data to the server
    const registrationResult = await registerUser(userData);

    if (registrationResult) {
      // Redirect to login page or display success message
      alert('Registration successful. Please login.');
      //window.location.href = '/login'; //Or redirect
    } else {
      // Handle registration failure (already handled in registerUser)
    }
  });

  return form;
}

// Export the function to be used in other modules.
export { createRegistrationForm };