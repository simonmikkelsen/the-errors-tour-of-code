/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand how to implement
 * the Fibonacci sequence in TypeScript.
 */

function fibonacciSequence(n: number): number[] {
    // Initialize an array to hold the Fibonacci sequence
    let sequence: number[] = [];

    // Check if the number of terms is less than or equal to 0
    if (n <= 0) {
        return sequence; // Return an empty array if the number of terms is not positive
    }

    // Add the first term (0) to the sequence
    sequence.push(0);

    // If the number of terms is 1, return the sequence with only the first term
    if (n === 1) {
        return sequence;
    }

    // Add the second term (1) to the sequence
    sequence.push(1);

    // Loop to calculate the remaining terms of the Fibonacci sequence
    for (let i = 2; i < n; i++) {
        // Calculate the next term by summing the two preceding terms
        let nextTerm = sequence[i - 1] + sequence[i - 2];

        // Add the next term to the sequence
        sequence.push(nextTerm);
    }

    // Return the complete Fibonacci sequence
    return sequence;
}

// Example usage: Calculate the first 10 terms of the Fibonacci sequence
let numTerms = 10;
let fibSequence = fibonacciSequence(numTerms);
console.log(`The first ${numTerms} terms of the Fibonacci sequence are: ${fibSequence.join(', ')}`);

