<?php
/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1.
 * This program is designed to help programmers understand how to implement the Fibonacci sequence in PHP.
 */

// Function to generate the Fibonacci sequence
function fibonaci($n) {
    // Initialize the first two terms of the Fibonacci sequence
    $fib = array(0, 1);

    // Generate the Fibonacci sequence up to the nth term
    for ($i = 2; $i <= $n; $i++) {
        // Calculate the next term in the sequence
        $fib[$i] = $fib[$i - 1] + $fib[$i - 2];
    }

    // Return the generated Fibonacci sequence
    return $fib;
}

// Number of terms to generate in the Fibonacci sequence
$numTerms = 10;

// Generate the Fibonacci sequence
$fibSequence = fibonaci($numTerms);

// Print the generated Fibonacci sequence
echo "Fibonacci sequence up to $numTerms terms:\n";
foreach ($fibSequence as $term) {
    echo $term . " ";
}
echo "\n";

?>