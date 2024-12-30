/**
 * This program is a factorial calculator written in TypeScript.
 * It calculates the factorial of a given number using a recursive approach.
 * The program also demonstrates the use of caching to store previously calculated results.
 * This can help in optimizing the performance of the factorial calculation.
 * 
 * The purpose of this program is to provide a detailed example with verbose comments
 * to help programmers understand the implementation of a factorial calculator.
 */

function factorial(n: number, cache: { [key: number]: number } = {}): number {
    // Base case: if n is 0 or 1, the factorial is 1
    if (n === 0 || n === 1) {
        return 1;
    }

    // Check if the result is already in the cache
    if (cache[n]) {
        return cache[n];
    }

    // Recursive case: calculate the factorial of n
    const result = n * factorial(n - 1, cache);

    // Store the result in the cache
    cache[n] = result;

    // Return the result
    return result;
}

// Example usage of the factorial function
const number = 5;
console.log(`Factorial of ${number} is ${factorial(number)}`);

/**
 */