<?php
/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * 
 * The purpose of this program is to help programmers understand the logic behind prime number checking
 * and to practice writing PHP code with detailed comments.
 */

/**
 * Function to check if a number is prime
 * 
 * @param int $number The number to be checked
 * @return bool True if the number is prime, false otherwise
 */
function isPrime($number) {
    // Check if the number is less than 2
    if ($number < 2) {
        return false;
    }

    // Loop from 2 to the square root of the number
    for ($i = 2; $i <= sqrt($number); $i++) {
        // Check if the number is divisible by any number in the loop
        if ($number % $i == 0) {
            return false;
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Get the number from the user
$number = intval(readline("Enter a number to check if it is prime: "));

// Check if the number is prime
if (isPrime($number)) {
    echo "$number is a prime number.\n";
} else {
    echo "$number is not a prime number.\n";
}

/**
 */
?>