<?php
/**
 * This program is a factorial calculator.
 * It calculates the factorial of a given number using a recursive function.
 * The purpose of this program is to demonstrate the use of recursion in PHP.
 * It also shows how to use global variables within a function.
 */

// Global variable to store the result of the factorial calculation
$result = 1;

/**
 * Function to calculate the factorial of a number
 * 
 * @param int $n The number to calculate the factorial of
 * @return int The factorial of the number
 */
function factorial($n) {
    // Access the global variable $result
    global $result;

    // Base case: if $n is 0 or 1, return 1
    if ($n <= 1) {
        return 1;
    }

    // Recursive case: multiply $n by the factorial of $n-1
    $result = $n * factorial($n - 1);

    // Return the result
    return $result;
}

// Example usage of the factorial function
$number = 5;
echo "The factorial of $number is " . factorial($number) . "\n";

/**
 */
?>