/**
 * This program is a factorial calculator written in TypeScript.
 * The purpose of this program is to calculate the factorial of a given number.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
 * This program includes detailed comments to help programmers understand each part of the code.
 */

// Function to calculate the factorial of a number
function factorial(n: number): number {
    // Check if the input number is less than 0
    if (n < 0) {
        // If the number is negative, return -1 as factorial is not defined for negative numbers
        return -1;
    }

    // Initialize the result to 1
    let result = 1;

    // Loop from 1 to n (inclusive) to calculate the factorial
    for (let i = 1; i <= n; i++) {
        // Multiply the result by the current number
        result *= i;
    }

    // Return the calculated factorial
    return result;
}

// Test the factorial function with a sample input
const number = 5; // Change this value to test with different numbers
const fact = factorial(number); // Call the factorial function
console.log(`Factorial of ${number} is ${fact}`); // Print the result

