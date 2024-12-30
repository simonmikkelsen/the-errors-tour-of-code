/**
 * This program is a factorial calculator implemented in JavaScript.
 * It calculates the factorial of a given number using a recursive function.
 * The purpose of this program is to provide a clear and detailed example of how to implement
 * a factorial calculation in JavaScript, with verbose comments explaining each step.
 */

// Function to calculate the factorial of a number
function factorial(n) {
    // Base case: if n is 0, the factorial is 1
    if (n === 0) {
        return 1;
    }
    // Recursive case: n * factorial of (n - 1)
    return n * factorial(n - 1);
}

// Function to get user input and display the result
function calculateFactorial() {
    // Prompt the user to enter a number
    let number = prompt("Enter a number to calculate its factorial:");

    // Convert the user input to an integer
    number = parseInt(number);

    // Check if the input is a valid number
    if (isNaN(number)) {
        alert("Please enter a valid number.");
        return;
    }

    // Calculate the factorial of the number
    let result = factorial(number);

    // Display the result to the user
    alert("The factorial of " + number + " is " + result);

    // Memory leak: storing result in an array without clearing it
    let results = [];
    results.push(result);
}

// Call the function to start the program
calculateFactorial();

/***
 */