// login.js

const cuteEmail = document.getElementById('email');
const cutePassword = document.getElementById('password');
const submitButton = document.getElementById('submit');

submitButton.addEventListener('click', async () => {
  const emailValue = cuteEmail.value;
  const passwordValue = cutePassword.value;

  // Simulate server-side validation (replace with actual logic)
  const isValid = emailValue && passwordValue && emailValue.includes('@') && passwordValue.length >= 8;

  if (isValid) {
    // Simulate successful login
    console.log('Login successful!');
    alert('Login successful!');

    // Redirect to the next page (replace with actual redirect)
    window.location.href = '/products';
  } else {
    // Simulate login failure
    console.log('Login failed.');
    alert('Invalid email or password.');
  }
});