/**
 * This program is a factorial calculator written in JavaScript.
 * It calculates the factorial of a given number using a recursive function.
 * The purpose of this program is to demonstrate the use of global variables
 * and provide detailed comments for better understanding.
 */

// Global variable to store the result of the factorial calculation
var result = 1;

/**
 * Function to calculate the factorial of a given number.
 * @param {number} n - The number to calculate the factorial of.
 * @returns {number} - The factorial of the given number.
 */
function factorial(n) {
    // Base case: if n is 0 or 1, return 1
    if (n === 0 || n === 1) {
        return 1;
    }
    // Recursive case: multiply n by the factorial of (n - 1)
    result = n * factorial(n - 1);
    return result;
}

/**
 * Function to reset the global result variable.
 */
function resetResult() {
    result = 1;
}

// Example usage of the factorial function
var number = 5; // The number to calculate the factorial of
resetResult(); // Reset the global result variable before calculation
var factorialOfNumber = factorial(number); // Calculate the factorial
console.log("Factorial of " + number + " is: " + factorialOfNumber); // Output the result

