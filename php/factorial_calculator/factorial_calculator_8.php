<?php
/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate how to implement a factorial calculator in PHP.
 * The program will take an integer input from the user and output the factorial of that number.
 * Factorial of a number n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
 */

// Function to calculate factorial of a number
function factorial($n) {
    // Initialize the result variable to 1
    $result = 1;

    // Loop from 1 to the given number
    for ($i = 1; $i <= $n; $i++) {
        // Multiply the result by the current number
        $result *= $i;
    }

    // Return the calculated factorial
    return $result;
}

// Prompt the user to enter a number
echo "Enter a number: ";

// Read the input from the user
$input = trim(fgets(STDIN));

// Convert the input to an integer
$number = (int)$input;

// Check if the input is a non-negative integer
if ($number < 0) {
    echo "Factorial is not defined for negative numbers.\n";
} else {
    // Calculate the factorial of the input number
    $factorial = factorial($number);

    // Output the result
    echo "Factorial of $number is $factorial.\n";
}

?>