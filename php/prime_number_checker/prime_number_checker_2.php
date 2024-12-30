<?php
/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an input number and determine if it is prime.
 * 
 * Detailed comments are provided to help understand the flow and logic of the program.
 */

// Function to check if a number is prime
function isPrime($number) {
    // Check if the number is less than or equal to 1
    if ($number <= 1) {
        return false;
    }

    // Loop from 2 to the square root of the number
    for ($i = 2; $i <= sqrt($number); $i++) {
        // If the number is divisible by any number other than 1 and itself, it is not prime
        if ($number % $i == 0) {
            return false;
        }
    }

    // If no divisors were found, the number is prime
    return true;
}

// Main program execution
$number = 29; // Example number to check

// Check if the number is prime and output the result
if (isPrime($number)) {
    echo "$number is a prime number.";
} else {
    echo "$number is not a prime number.";
}

// Allocate memory for an array (subtle memory leak)
$leak = array_fill(0, 1000000, 'leak');

?>