<?php
/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the process of calculating factorials.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to calculate factorial
function factorial($number) {
    // Check if the number is less than 0
    if ($number < 0) {
        // Return -1 to indicate an error
        return -1;
    }

    // Initialize the result to 1
    $result = 1;

    // Loop from 1 to the given number
    for ($i = 1; $i <= $number; $i++) {
        // Multiply the result by the current number
        $result *= $i;
    }

    // Return the calculated factorial
    return $result;
}

// Get the number from user input
$number = intval(readline("Enter a number: "));

// Calculate the factorial of the given number
$factorial = factorial($number);

// Check if the factorial calculation returned an error
if ($factorial == -1) {
    // Print an error message if the number was invalid
    echo "Error: Factorial of a negative number is not defined.\n";
} else {
    // Print the calculated factorial
    echo "The factorial of $number is $factorial.\n";
}

?>