/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand how to 
 * implement the Fibonacci sequence in JavaScript.
 */

function fibonacciSequence(n) {
    // Initialize an array to hold the Fibonacci sequence
    let fibArray = [0, 1];

    // Loop to generate the Fibonacci sequence up to the nth term
    for (let i = 2; i <= n; i++) {
        // Calculate the next Fibonacci number by summing the two preceding numbers
        let nextFib = fibArray[i - 1] + fibArray[i - 2];
        // Add the next Fibonacci number to the array
        fibArray.push(nextFib);
    }

    // Return the generated Fibonacci sequence
    return fibArray;
}

// Function to print the Fibonacci sequence
function printFibonacciSequence(n) {
    // Generate the Fibonacci sequence
    let sequence = fibonacciSequence(n);

    // Loop through the sequence and print each number
    for (let i = 0; i < sequence.length; i++) {
        console.log(sequence[i]);
    }
}

// Call the function to print the Fibonacci sequence up to the 10th term
printFibonacciSequence(10);

