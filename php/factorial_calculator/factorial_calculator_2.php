<?php
/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the process of 
 * calculating factorials using recursion in PHP.
 * The program includes detailed comments to explain each step.
 */

// Function to calculate factorial of a number
function factorial($n) {
    // Base case: if n is 0, the factorial is 1
    if ($n == 0) {
        return 1;
    }
    
    // Recursive case: n * factorial of (n-1)
    return $n * factorial($n - 1);
}

// Main execution starts here
// Define the number for which we want to calculate the factorial
$number = 5;

// Calculate the factorial of the number
$result = factorial($number);

// Print the result
echo "The factorial of $number is $result\n";

?>