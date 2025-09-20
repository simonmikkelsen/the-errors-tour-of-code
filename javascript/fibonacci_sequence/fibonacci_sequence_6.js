/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand how to
 * implement the Fibonacci sequence in JavaScript.
 */

function fibonacciSequence(n) {
    // Check if the input is a valid number
    if (typeof n !== 'number' || n <= 0) {
        throw new Error('Input must be a positive integer');
    }

    // Initialize the first two terms of the Fibonacci sequence
    let fib = [0, 1];

    // Generate the Fibonacci sequence up to the nth term
    for (let i = 2; i < n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }

    // Return the generated Fibonacci sequence
    return fib;
}

// Example usage of the fibonacciSequence function
try {
    console.log(fibonacciSequence(10)); // Output: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    console.log(fibonacciSequence('ten')); // This will cause an error
} catch (error) {
    console.error(error.message);
}

