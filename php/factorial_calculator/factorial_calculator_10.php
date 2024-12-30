<?php
/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the process of calculating factorials in PHP.
 * The program takes user input from the command line and computes the factorial of the input number.
 */

// Function to calculate factorial of a number
function factorial($n) {
    // Base case: factorial of 0 is 1
    if ($n == 0) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    return $n * factorial($n - 1);
}

// Check if the script is run from the command line
if (php_sapi_name() == "cli") {
    // Prompt the user to enter a number
    echo "Enter a number to calculate its factorial: ";
    // Read the user input from the command line
    $input = trim(fgets(STDIN));
    // Convert the input to an integer
    $number = (int) $input;
    // Calculate the factorial of the input number
    $result = factorial($number);
    // Display the result
    echo "The factorial of $number is $result\n";
} else {
    // If the script is not run from the command line, display an error message
    echo "This script can only be run from the command line.\n";
}

?>