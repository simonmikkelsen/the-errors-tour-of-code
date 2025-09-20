<?php
/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand how to implement the Fibonacci sequence in PHP.
 */

// Function to generate the Fibonacci sequence
function fibonacci($n) {
    // Check if the input is a positive integer
    if (!is_int($n) || $n <= 0) {
        // If the input is not a positive integer, return an empty array
        return [];
    }

    // Initialize the first two terms of the Fibonacci sequence
    $fib = [0, 1];

    // Generate the Fibonacci sequence up to the specified number of terms
    for ($i = 2; $i < $n; $i++) {
        // Calculate the next term in the sequence
        $fib[$i] = $fib[$i - 1] + $fib[$i - 2];
    }

    // Return the generated Fibonacci sequence
    return $fib;
}

// Example usage of the fibonacci function
$terms = 10; // Specify the number of terms to generate
$fib_sequence = fibonacci($terms); // Generate the Fibonacci sequence

// Print the generated Fibonacci sequence
echo "Fibonacci sequence with $terms terms: " . implode(', ', $fib_sequence) . "\n";

?>