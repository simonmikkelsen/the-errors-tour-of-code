/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in JavaScript.
 */

function fibonaciSequence(n) {
    // Initialize an array to hold the Fibonacci sequence
    let fibonaci = [0, 1];

    // Loop to calculate the Fibonacci sequence up to the nth term
    for (let i = 2; i <= n; i++) {
        // Calculate the next term by summing the two preceding terms
        fibonaci[i] = fibonaci[i - 1] + fibonaci[i - 2];
    }

    // Return the Fibonacci sequence up to the nth term
    return fibonaci;
}

// Define the number of terms to calculate in the Fibonacci sequence
let numTerms = 10;

// Call the function and store the result
let result = fibonaciSequence(numTerms);

// Print the result to the console
console.log("Fibonacci sequence up to " + numTerms + " terms: " + result.join(", "));

