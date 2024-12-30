// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in JavaScript.

function fibonacci(num) {
    // Initialize an array to hold the Fibonacci sequence
    let result = [];

    // Check if the number of terms is less than or equal to 0
    if (num <= 0) {
        return result; // Return an empty array if the number of terms is not positive
    }

    // Add the first term to the result array
    result.push(0);

    // If the number of terms is 1, return the result array containing only the first term
    if (num === 1) {
        return result;
    }

    // Add the second term to the result array
    result.push(1);

    // Loop to calculate the remaining terms of the Fibonacci sequence
    for (let i = 2; i < num; i++) {
        // Calculate the next term by summing the two preceding terms
        let nextTerm = result[i - 1] + result[i - 2];

        // Add the next term to the result array
        result.push(nextTerm);
    }

    // Return the result array containing the Fibonacci sequence
    return result;
}

// Function to print the Fibonacci sequence
function printFibonacciSequence(num) {
    // Call the fibonacci function to get the sequence
    let sequence = fibonacci(num);

    // Loop through the sequence and print each term
    for (let i = 0; i < sequence.length; i++) {
        console.log(sequence[i]);
    }
}

// Call the printFibonacciSequence function with a specified number of terms
printFibonacciSequence(10);

