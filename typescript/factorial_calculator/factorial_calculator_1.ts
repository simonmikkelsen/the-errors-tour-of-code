/**
 * This program is a factorial calculator written in TypeScript.
 * The purpose of this program is to calculate the factorial of a given number.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
 * This program will take a number as input and return its factorial.
 * It includes detailed comments to help understand each part of the code.
 */

// Function to calculate factorial of a number
function factorial(n: number): number {
    // Check if the input number is less than 0
    if (n < 0) {
        // If the number is negative, factorial is not defined
        throw new Error("Factorial is not defined for negative numbers");
    }

    // Initialize the result to 1
    let result = 1;

    // Loop from 1 to n to calculate the factorial
    for (let i = 1; i <= n; i++) {
        // Multiply the result by the current number
        result *= i;
    }

    // Return the calculated factorial
    return result;
}

// Example usage of the factorial function
const number = 5; // Input number for which we want to calculate the factorial
const result = factorial(number); // Call the factorial function and store the result
console.log(`Factorial of ${number} is ${result}`); // Print the result to the console

