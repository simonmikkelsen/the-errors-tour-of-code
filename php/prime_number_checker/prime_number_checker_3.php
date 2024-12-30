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
    // Check if the number is less than 2
    if ($number < 2) {
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
$handle = fopen("php://stdin", "r"); // Open a handle to read from standard input
echo "Enter a number: ";
$number = intval(fgets($handle)); // Read the input number from the user

// Check if the number is prime and output the result
if (isPrime($number)) {
    echo "$number is a prime number.\n";
} else {
    echo "$number is not a prime number.\n";
}

?>