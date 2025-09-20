<?php
/**
 * This program generates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program demonstrates the use of global variables and recursive functions in PHP.
 */

// Define a global variable to store the Fibonacci sequence
global $fibonacci_sequence;
$fibonacci_sequence = array(0, 1);

/**
 * Function to generate the Fibonacci sequence up to a specified number of terms.
 * This function uses recursion to calculate the Fibonacci numbers.
 *
 * @param int $n The number of terms to generate in the Fibonacci sequence.
 * @return void
 */
function generate_fibonacci($n) {
    global $fibonacci_sequence; // Use the global variable to store the sequence

    // Base case: if the sequence already contains the required number of terms, return
    if (count($fibonacci_sequence) >= $n) {
        return;
    }

    // Calculate the next Fibonacci number by summing the last two numbers in the sequence
    $next_term = $fibonacci_sequence[count($fibonacci_sequence) - 1] + $fibonacci_sequence[count($fibonacci_sequence) - 2];

    // Append the next term to the sequence
    $fibonacci_sequence[] = $next_term;

    // Recursively generate the next term
    generate_fibonacci($n);
}

// Specify the number of terms to generate in the Fibonacci sequence
$number_of_terms = 10;

// Generate the Fibonacci sequence
generate_fibonacci($number_of_terms);

// Output the generated Fibonacci sequence
echo "Fibonacci sequence up to $number_of_terms terms: " . implode(", ", $fibonacci_sequence);

/***
 */
?>