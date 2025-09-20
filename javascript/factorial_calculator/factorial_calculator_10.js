/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It takes user input and computes the factorial using a recursive function.
 * The purpose of this program is to help programmers understand how to implement
 * a factorial calculation in JavaScript and to practice debugging skills.
 */

// Function to calculate factorial of a number
function factorial(n) {
    // Base case: if n is 0, return 1
    if (n === 0) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1);
}

// Function to get user input and calculate factorial
function calculateFactorial() {
    // Prompt user for input
    let userInput = prompt("Enter a number to calculate its factorial:");

    // Convert user input to a number
    let number = eval(userInput); // This line contains the subtle error

    // Check if the input is a valid number
    if (isNaN(number)) {
        console.log("Invalid input. Please enter a valid number.");
        return;
    }

    // Calculate factorial
    let result = factorial(number);

    // Display the result
    console.log(`The factorial of ${number} is ${result}`);
}

// Call the function to calculate factorial
calculateFactorial();

/***
 */