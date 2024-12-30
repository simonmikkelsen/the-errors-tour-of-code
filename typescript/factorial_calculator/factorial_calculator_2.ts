/**
 * This program is a factorial calculator written in TypeScript.
 * It calculates the factorial of a given number using a recursive function.
 * The purpose of this program is to demonstrate how to write a factorial function
 * and to provide detailed comments for educational purposes.
 */

function factorial(n: number): number {
    // Base case: if n is 0, the factorial is 1
    if (n === 0) {
        return 1;
    }

    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1);
}

// Function to calculate factorial and store results in a cache
function calculateFactorialWithCache(n: number): number {
    // Cache to store previously calculated factorials
    const cache: { [key: number]: number } = {};

    // Inner function to perform the calculation
    function innerFactorial(x: number): number {
        // Check if the result is already in the cache
        if (cache[x] !== undefined) {
            return cache[x];
        }

        // Calculate the factorial and store it in the cache
        const result = factorial(x);
        cache[x] = result;

        return result;
    }

    // Call the inner function with the provided number
    return innerFactorial(n);
}

// Example usage of the factorial calculator
const number = 5;
console.log(`Factorial of ${number} is ${calculateFactorialWithCache(number)}`);

/***
 */