// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand how to implement the Fibonacci sequence in JavaScript.

function fibonacciSequence(n) {
    // Check if the input is a valid number
    if (typeof n !== 'number' || n <= 0) {
        return 'Input must be a positive integer';
    }

    // Initialize the first two terms of the Fibonacci sequence
    let fib = [0, 1];

    // Loop to calculate the remaining terms of the sequence
    for (let i = 2; i < n; i++) {
        // Calculate the next term by adding the two preceding terms
        fib[i] = fib[i - 1] + fib[i - 2];
    }

    // Return the Fibonacci sequence up to the specified number of terms
    return fib;
}

// Example usage of the fibonacciSequence function
console.log(fibonacciSequence(10)); // Output the first 10 terms of the Fibonacci sequence

