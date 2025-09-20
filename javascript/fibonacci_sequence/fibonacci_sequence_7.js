// This program generates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand how to implement the Fibonacci sequence in JavaScript.

function fibonacciSequence(n) {
    // Check if the input is a positive integer
    if (n <= 0) {
        console.log("Please enter a positive integer.");
        return;
    }

    // Initialize the first two terms of the Fibonacci sequence
    let fib = [0, 1];

    // Generate the Fibonacci sequence up to the nth term
    for (let i = 2; i < n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }

    // Print the Fibonacci sequence
    console.log("Fibonacci sequence up to " + n + " terms:");
    for (let i = 0; i < n; i++) {
        console.log(fib[i]);
    }
}

// Call the function with a specific number of terms
fibonacciSequence(10);

