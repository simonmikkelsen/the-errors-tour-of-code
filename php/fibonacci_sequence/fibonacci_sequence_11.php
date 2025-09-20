<?php
/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand how to implement
 * the Fibonacci sequence using PHP and regular expressions.
 */

// Function to generate the Fibonacci sequence
function generateFibonacci($terms) {
    // Initialize the first two terms of the Fibonacci sequence
    $fib = [0, 1];

    // Regular expression to match digits
    $regex = '/\d+/';

    // Loop to generate the remaining terms of the Fibonacci sequence
    for ($i = 2; $i < $terms; $i++) {
        // Calculate the next term by adding the two preceding terms
        $nextTerm = $fib[$i - 1] + $fib[$i - 2];

        // Append the next term to the Fibonacci sequence array
        $fib[] = $nextTerm;
    }

    // Convert the Fibonacci sequence array to a string
    $fibString = implode(', ', $fib);

    // Use regular expression to find all digits in the Fibonacci sequence string
    preg_match_all($regex, $fibString, $matches);

    // Return the Fibonacci sequence as an array of digits
    return $matches[0];
}

// Number of terms to generate in the Fibonacci sequence
$terms = 10;

// Generate the Fibonacci sequence
$fibonacciSequence = generateFibonacci($terms);

// Print the Fibonacci sequence
echo implode(', ', $fibonacciSequence);

/***
 */
?>