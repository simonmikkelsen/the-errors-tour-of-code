<?php
/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the process of calculating factorials
 * and to practice writing and debugging PHP code.
 * 
 * The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * It is denoted by n! and is defined as:
 * 
 * n! = n * (n - 1) * (n - 2) * ... * 1
 * 
 * For example:
 * 5! = 5 * 4 * 3 * 2 * 1 = 120
 * 
 * This program includes detailed comments to explain each step of the process.
 */

// Function to calculate the factorial of a number
function factorial($number) {
    // Check if the number is a non-negative integer
    if ($number < 0) {
        return "Invalid input. Please enter a non-negative integer.";
    }

    // Initialize the result to 1
    $result = 1;

    // Loop through each number from 1 to the given number
    for ($i = 1; $i <= $number; $i++) {
        // Multiply the result by the current number
        $result *= $i;
    }

    // Return the final result
    return $result;
}

// Get the number from the user input
$number = intval(readline("Enter a non-negative integer: "));

// Calculate the factorial of the given number
$factorial = factorial($number);

// Display the result
echo "The factorial of $number is: $factorial\n";

?>