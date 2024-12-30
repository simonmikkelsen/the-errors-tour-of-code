<?php
/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It uses regular expressions to validate the input and ensure it is a non-negative integer.
 * The purpose of this program is to demonstrate the use of regular expressions in PHP.
 */

// Function to calculate factorial
function factorial($number) {
    // Base case: if the number is 0, return 1
    if ($number == 0) {
        return 1;
    }
    // Recursive case: multiply the number by the factorial of the number minus 1
    return $number * factorial($number - 1);
}

// Function to validate input using regular expressions
function validateInput($input) {
    // Regular expression to check if the input is a non-negative integer
    $pattern = '/^\d+$/';
    // Use preg_match to check if the input matches the pattern
    return preg_match($pattern, $input);
}

// Main program
// Get the input from the user
$input = readline("Enter a non-negative integer: ");

// Validate the input
if (validateInput($input)) {
    // Convert the input to an integer
    $number = intval($input);
    // Calculate the factorial
    $result = factorial($number);
    // Print the result
    echo "The factorial of $number is $result\n";
} else {
    // Print an error message if the input is not valid
    echo "Invalid input. Please enter a non-negative integer.\n";
}

?>