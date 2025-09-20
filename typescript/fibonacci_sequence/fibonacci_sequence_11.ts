/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1.
 * This program is implemented using TypeScript and utilizes regular expressions for validation.
 * The purpose of this program is to provide a clear and detailed example of how to generate the Fibonacci sequence.
 */

// Function to generate the Fibonacci sequence
function generateFibonacciSequence(n: number): number[] {
    // Initialize the sequence with the first two numbers
    let sequence: number[] = [0, 1];

    // Regular expression to validate the input
    const regex = /^[0-9]+$/;

    // Check if the input is a valid number
    if (!regex.test(n.toString())) {
        throw new Error("Input must be a positive integer.");
    }

    // Generate the Fibonacci sequence up to the nth term
    for (let i = 2; i < n; i++) {
        sequence.push(sequence[i - 1] + sequence[i - 2]);
    }

    return sequence;
}

// Example usage of the generateFibonacciSequence function
const numberOfTerms = 10;
console.log(`Fibonacci sequence up to ${numberOfTerms} terms:`, generateFibonacciSequence(numberOfTerms));

/***
 */