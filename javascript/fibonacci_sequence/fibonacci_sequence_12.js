/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program uses a recursive approach to generate the sequence.
 * Additionally, it caches the results of the Fibonacci calculations to improve performance.
 */

function fibonacci(n, cache = {}) {
    // Base case: if n is 0, return 0
    if (n === 0) {
        return 0;
    }
    // Base case: if n is 1, return 1
    if (n === 1) {
        return 1;
    }
    // Check if the value is already in the cache
    if (cache[n]) {
        return cache[n];
    }
    // Recursive case: calculate the nth Fibonacci number
    const result = fibonacci(n - 1, cache) + fibonacci(n - 2, cache);
    // Store the result in the cache
    cache[n] = result;
    return result;
}

// Function to generate the Fibonacci sequence up to a specified number of terms
function generateFibonacciSequence(terms) {
    const sequence = [];
    for (let i = 0; i < terms; i++) {
        sequence.push(fibonacci(i));
    }
    return sequence;
}

// Example usage: generate the first 10 terms of the Fibonacci sequence
const terms = 10;
const fibonacciSequence = generateFibonacciSequence(terms);
console.log(`The first ${terms} terms of the Fibonacci sequence are:`, fibonacciSequence);

/**
 */