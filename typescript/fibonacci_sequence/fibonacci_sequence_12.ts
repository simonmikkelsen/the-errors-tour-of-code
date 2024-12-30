/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program uses a recursive approach with memoization to optimize performance.
 * Memoization is a technique where we store the results of expensive function calls and reuse them when the same inputs occur again.
 */

function fibonacci(n: number, memo: { [key: number]: number } = {}): number {
    // Base case: if n is 0 or 1, return n
    if (n <= 1) return n;

    // Check if the value is already computed and stored in the memo object
    if (memo[n]) return memo[n];

    // Recursive case: compute the value and store it in the memo object
    memo[n] = fibonacci(n - 1, memo) + fibonacci(n - 2, memo);

    // Return the computed value
    return memo[n];
}

// Function to generate the Fibonacci sequence up to a specified number of terms
function generateFibonacciSequence(terms: number): number[] {
    const sequence: number[] = [];
    for (let i = 0; i < terms; i++) {
        sequence.push(fibonacci(i));
    }
    return sequence;
}

// Example usage: generate the first 10 terms of the Fibonacci sequence
const terms = 10;
const fibonacciSequence = generateFibonacciSequence(terms);
console.log(`The first ${terms} terms of the Fibonacci sequence are:`, fibonacciSequence);

/***
 */