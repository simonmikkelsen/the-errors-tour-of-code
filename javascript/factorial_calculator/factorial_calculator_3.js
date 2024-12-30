/**
 * This program is a Factorial Calculator written in JavaScript.
 * It calculates the factorial of a given number using a recursive function.
 * The purpose of this program is to demonstrate how to implement a factorial calculation
 * and to provide detailed comments for educational purposes.
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

// Function to read input from the user
function readInput() {
    // Using prompt to get user input
    let input = prompt("Enter a number to calculate its factorial:");
    // Converting input to an integer
    let number = parseInt(input);
    // Returning the integer value
    return number;
}

// Main function to execute the program
function main() {
    // Reading input from the user
    let number = readInput();
    // Calculating factorial of the input number
    let result = factorial(number);
    // Displaying the result to the user
    alert("The factorial of " + number + " is " + result);
}

// Calling the main function to start the program
main();

/**
 */