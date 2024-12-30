<?php
/**
 * Prime Number Checker
 *
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an input number and determine if it is prime.
 * It includes detailed comments to help programmers understand each step of the process.
 */

// Function to check if a number is prime
function isPrime($number) {
    // Check if the number is less than 2
    if ($number < 2) {
        return false; // Numbers less than 2 are not prime
    }

    // Loop from 2 to the square root of the number
    for ($i = 2; $i <= sqrt($number); $i++) {
        // Check if the number is divisible by any number in the loop
        if ($number % $i == 0) {
            return false; // If divisible, the number is not prime
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Get the input number from the user
$input = readline("Enter a number to check if it is prime: ");

// Convert the input to an integer
$number = (int)$input;

// Check if the number is prime
if (isPrime($number)) {
    echo "$number is a prime number.\n";
} else {
    echo "$number is not a prime number.\n";
}

?>