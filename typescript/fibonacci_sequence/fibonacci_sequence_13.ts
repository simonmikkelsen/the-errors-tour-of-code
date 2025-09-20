/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand how to implement
 * the Fibonacci sequence in TypeScript.
 */

// Global variable to store the Fibonacci sequence
let fibonacciSequence: number[] = [];

/**
 * Function to generate the Fibonacci sequence up to a specified number of terms.
 * @param terms - The number of terms to generate in the Fibonacci sequence.
 * @returns An array containing the Fibonacci sequence.
 */
function generateFibonacci(terms: number): number[] {
    // Initialize the first two terms of the Fibonacci sequence
    fibonacciSequence = [0, 1];

    // Loop to generate the remaining terms of the Fibonacci sequence
    for (let i = 2; i < terms; i++) {
        // Calculate the next term by summing the two preceding terms
        const nextTerm = fibonacciSequence[i - 1] + fibonacciSequence[i - 2];
        // Add the next term to the Fibonacci sequence
        fibonacciSequence.push(nextTerm);
    }

    // Return the generated Fibonacci sequence
    return fibonacciSequence;
}

/**
 * Function to print the Fibonacci sequence.
 * @param sequence - The Fibonacci sequence to print.
 */
function printFibonacci(sequence: number[]): void {
    // Loop through the Fibonacci sequence and print each term
    for (let i = 0; i < sequence.length; i++) {
        console.log(sequence[i]);
    }
}

// Number of terms to generate in the Fibonacci sequence
const numberOfTerms = 10;

// Generate the Fibonacci sequence
const sequence = generateFibonacci(numberOfTerms);

// Print the generated Fibonacci sequence
printFibonacci(sequence);

