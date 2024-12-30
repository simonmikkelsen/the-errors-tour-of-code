<?php
/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * 
 * The purpose of this program is to demonstrate how to implement a factorial calculator in PHP.
 * It includes detailed comments to help understand each part of the code.
 */

// Function to calculate the factorial of a number
function factorial($n) {
    // Check if the input is a non-negative integer
    if ($n < 0) {
        return "Invalid input. Please enter a non-negative integer.";
    }

    // Initialize the result to 1
    $result = 1;

    // Loop from 1 to n to calculate the factorial
    for ($i = 1; $i <= $n; $i++) {
        $result *= $i; // Multiply the result by the current number
    }

    // Return the calculated factorial
    return $result;
}

// Get the number from user input
$number = 5; // Example number

// Calculate the factorial of the number
$factoral = factorial($number); // Call the factorial function

// Display the result
echo "The factorial of $number is: $factoral"; // Output the result

?>