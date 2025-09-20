/**
 * This program is a factorial calculator written in TypeScript.
 * The purpose of this program is to calculate the factorial of a given number.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
 * This program uses a global variable to store intermediate results and the final result.
 */

// Global variable to store the result of the factorial calculation
let result: number;

/**
 * Function to calculate the factorial of a given number.
 * @param n - The number for which the factorial is to be calculated.
 * @returns The factorial of the given number.
 */
function factorial(n: number): number {
    // Initialize the result to 1
    result = 1;

    // Loop from 1 to n to calculate the factorial
    for (let i = 1; i <= n; i++) {
        // Multiply the result by the current number
        result *= i;
    }

    // Return the final result
    return result;
}

// Example usage of the factorial function
let number: number = 5;
console.log(`Factorial of ${number} is ${factorial(number)}`);

