/**
 * This TypeScript program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in TypeScript.
 */

function fibonacciSequence(numTerms: number): number[] {
    // Initialize an array to hold the Fibonacci sequence
    let fibSequence: number[] = [];

    // Check if the number of terms is less than or equal to 0
    if (numTerms <= 0) {
        // Return an empty array if the number of terms is not positive
        return fibSequence;
    }

    // Add the first term (0) to the sequence
    fibSequence.push(0);

    // If the number of terms is greater than 1, add the second term (1) to the sequence
    if (numTerms > 1) {
        fibSequence.push(1);
    }

    // Loop to calculate the remaining terms of the Fibonacci sequence
    for (let i = 2; i < numTerms; i++) {
        // Calculate the next term by summing the two preceding terms
        let nextTerm = fibSequence[i - 1] + fibSequence[i - 2];
        // Add the next term to the sequence
        fibSequence.push(nextTerm);
    }

    // Return the complete Fibonacci sequence
    return fibSequence;
}

// Example usage of the fibonacciSequence function
let numTerms: number = 10; // Specify the number of terms to calculate
let sequence: number[] = fibonacciSequence(numTerms); // Get the Fibonacci sequence
console.log("Fibonacci sequence:", sequence); // Print the Fibonacci sequence

