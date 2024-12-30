<?php
/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in PHP.
 */

// Function to generate the Fibonacci sequence
function generateFibonacci($n) {
    // Initialize the first two terms of the Fibonacci sequence
    $fib = [0, 1];

    // Loop to generate the remaining terms of the sequence
    for ($i = 2; $i < $n; $i++) {
        // Calculate the next term by summing the two preceding terms
        $fib[$i] = $fib[$i - 1] + $fib[$i - 2];
    }

    // Return the generated Fibonacci sequence
    return $fib;
}

// Number of terms to generate in the Fibonacci sequence
$n = 10;

// Generate the Fibonacci sequence
$fibonacciSequence = generateFibonacci($n);

// Print the generated Fibonacci sequence
foreach ($fibonacciSequence as $term) {
    echo $term . " ";
}

?>