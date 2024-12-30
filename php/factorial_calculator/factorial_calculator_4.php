<?php
/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the process of 
 * calculating factorials using a recursive function in PHP.
 * The program includes detailed comments to explain each step.
 */

// Function to calculate factorial of a number
function factorial($n) {
    // Base case: if n is 0, return 1
    if ($n == 0) {
        return 1;
    }
    
    // Recursive case: n * factorial of (n-1)
    return $n * factorial($n - 1);
}

// Main execution starts here
// Define the number for which we want to calculate the factorial
$number = 5;

// Print the number for which we are calculating the factorial
echo "Calculating the factorial of $number\n";

// Call the factorial function and store the result
$result = factorial($number);

// Print the result of the factorial calculation
echo "The factorial of $number is $result\n";

// Infinite loop to simulate a performance issue
while (true) {
    // This loop will run indefinitely, causing the program to hang
    // and consume CPU resources unnecessarily.
    // It is a subtle error that can be difficult to spot.
}

?>