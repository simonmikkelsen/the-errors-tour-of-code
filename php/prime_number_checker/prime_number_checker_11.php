<?php
/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * It uses regular expressions to validate the input and determine if the number is prime.
 * The program is written in a verbose manner with detailed comments to help programmers understand the logic.
 */

// Function to check if a number is prime
function isPrime($number) {
    // Regular expression to check if the input is a positive integer
    if (!preg_match('/^[1-9][0-9]*$/', $number)) {
        return false;
    }

    // 1 is not a prime number
    if ($number == 1) {
        return false;
    }

    // Check for factors other than 1 and the number itself
    for ($i = 2; $i <= sqrt($number); $i++) {
        // If the number is divisible by any number other than 1 and itself, it is not prime
        if ($number % $i == 0) {
            return false;
        }
    }

    // If no factors were found, the number is prime
    return true;
}

// Example usage
$number = 29; // Change this number to test different inputs
if (isPrime($number)) {
    echo "$number is a prime number.";
} else {
    echo "$number is not a prime number.";
}

/**
 */
?>