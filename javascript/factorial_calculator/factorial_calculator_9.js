// This program is a factorial calculator written in JavaScript.
// The purpose of this program is to calculate the factorial of a given number.
// Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

function factorial(n) {
    // Check if the input is a non-negative integer
    if (n < 0) {
        return "Error: Negative numbers do not have a factorial.";
    }
    // Initialize the result to 1
    let result = 1;
    // Loop from 1 to n to calculate the factorial
    for (let i = 1; i <= n; i++) {
        result *= i; // Multiply the result by the current number
    }
    // Return the calculated factorial
    return result;
}

// Test the factorial function with a sample input
let number = 5; // Change this value to test with different numbers
console.log("The factorial of " + number + " is: " + factorial(number));

