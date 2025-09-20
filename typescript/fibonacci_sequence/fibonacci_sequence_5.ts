/**
 * This program calculates the Fibonacci sequence up to a given number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in TypeScript.
 */

function fibonacciSequence(n: number): number[] {
    // Initialize an array to hold the Fibonacci sequence
    let fibSeq: number[] = [];

    // Check if the number of terms is less than or equal to 0
    if (n <= 0) {
        return fibSeq; // Return an empty array if the number of terms is less than or equal to 0
    }

    // Add the first term to the sequence
    fibSeq.push(0);

    // If the number of terms is 1, return the sequence with only the first term
    if (n == 1) {
        return fibSeq;
    }

    // Add the second term to the sequence
    fibSeq.push(1);

    // Loop to calculate the remaining terms of the Fibonacci sequence
    for (let i = 2; i <= n; i++) {
        // Calculate the next term by summing the two preceding terms
        let nextTerm = fibSeq[i - 1] + fibSeq[i - 2];
        // Add the next term to the sequence
        fibSeq.push(nextTerm);
    }

    // Return the complete Fibonacci sequence
    return fibSeq;
}

// Example usage of the fibonacciSequence function
let numTerms = 10; // Number of terms in the Fibonacci sequence
let sequence = fibonacciSequence(numTerms); // Get the Fibonacci sequence
console.log(`Fibonacci sequence with ${numTerms} terms:`, sequence); // Print the Fibonacci sequence

