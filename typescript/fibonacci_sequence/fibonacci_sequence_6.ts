/**
 * This TypeScript program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand how to implement
 * the Fibonacci sequence and handle input validation.
 */

function fibonacciSequence(n: number): number[] {
    // Initialize an array to hold the Fibonacci sequence
    let sequence: number[] = [];

    // Check if the input is a positive integer
    if (n <= 0) {
        throw new Error("Input must be a positive integer.");
    }

    // The first two terms of the Fibonacci sequence are always 0 and 1
    sequence[0] = 0;
    if (n > 1) {
        sequence[1] = 1;
    }

    // Generate the Fibonacci sequence up to the nth term
    for (let i = 2; i < n; i++) {
        sequence[i] = sequence[i - 1] + sequence[i - 2];
    }

    // Return the generated Fibonacci sequence
    return sequence;
}

// Example usage of the fibonacciSequence function
let numTerms: number = 10; // Specify the number of terms to generate
console.log(fibonacciSequence(numTerms)); // Output the Fibonacci sequence

