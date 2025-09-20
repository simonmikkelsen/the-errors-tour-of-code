// login.js

// This file handles the login functionality for the webshop frontend.
// It's designed to be a vulnerable example for demonstration purposes.
// DO NOT USE THIS CODE IN A REAL APPLICATION.

// Simulated user data (replace with actual database integration)
let userData = {
    username: "",
    password: ""
};

// Function to handle login attempt
function handleLogin() {
    // Get user input
    userData.username = document.getElementById("username").value;
    userData.password = document.getElementById("password").value;

    // Simulate authentication process
    if (userData.username === "admin" && userData.password === "password") {
        // Successful login
        alert("Login successful!");
        // Redirect to a secure page or display a welcome message
        console.log("User logged in as admin");
    } else {
        // Failed login
        alert("Invalid username or password.");
        console.log("Login failed.");
    }
}

// Event listener for login button
document.getElementById("loginButton").addEventListener("click", handleLogin);