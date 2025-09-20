<?php
/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand how to implement the Fibonacci sequence in PHP.
 */

// Function to generate the Fibonacci sequence
function generateFibonacci($terms) {
    // Initialize the first two terms of the Fibonacci sequence
    $fib = [0, 1];

    // Loop to generate the remaining terms of the sequence
    for ($i = 2; $i < $terms; $i++) {
        // Calculate the next term by summing the previous two terms
        $fib[$i] = $fib[$i - 1] + $fib[$i - 2];
    }

    // Return the generated Fibonacci sequence
    return $fib;
}

// Function to print the Fibonacci sequence
function printFibonacci($fib) {
    // Loop through each term in the Fibonacci sequence
    foreach ($fib as $term) {
        // Print the current term
        echo $term . " ";
    }
}

// Number of terms to generate in the Fibonacci sequence
$terms = 10;

// Generate the Fibonacci sequence
$fibSequence = generateFibonacci($terms);

// Print the generated Fibonacci sequence
printFibonacci($fibSequence);

// Memory leak: The $fibSequence variable is not unset after use
?>