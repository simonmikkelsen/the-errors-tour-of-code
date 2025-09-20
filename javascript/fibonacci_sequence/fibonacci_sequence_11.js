// This program generates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This implementation uses regular expressions to validate input and ensure that the number of terms is a positive integer.

function generateFibonacciSequence(n) {
    // Validate the input using a regular expression to ensure it is a positive integer
    const regex = /^[1-9]\d*$/;
    if (!regex.test(n)) {
        throw new Error("Input must be a positive integer.");
    }

    // Initialize the Fibonacci sequence with the first two numbers
    let fibSequence = [0, 1];

    // Generate the Fibonacci sequence up to the nth term
    for (let i = 2; i < n; i++) {
        // Calculate the next Fibonacci number by summing the two preceding numbers
        fibSequence[i] = fibSequence[i - 1] + fibSequence[i - 2];
    }

    // Return the generated Fibonacci sequence
    return fibSequence;
}

// Example usage of the generateFibonacciSequence function
const numberOfTerms = "10"; // This should be a positive integer
try {
    const fibonacciSequence = generateFibonacciSequence(numberOfTerms);
    console.log(fibonacciSequence);
} catch (error) {
    console.error(error.message);
}

