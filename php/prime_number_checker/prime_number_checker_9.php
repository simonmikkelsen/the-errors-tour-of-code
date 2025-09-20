<?php
/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an input number and determine if it is prime.
 * 
 * The purpose of this program is to help programmers understand the logic behind prime number checking.
 * It includes detailed comments to explain each step of the process.
 */

/**
 * Function to check if a number is prime
 * 
 * @param int $number The number to check
 * @return bool True if the number is prime, false otherwise
 */
function isPrime($number) {
    // Check if the number is less than or equal to 1
    if ($number <= 1) {
        return false; // Numbers less than or equal to 1 are not prime
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

// Example usage of the isPrime function
$testNumber = 29; // Change this number to test different values
if (isPrime($testNumber)) {
    echo "$testNumber is a prime number.";
} else {
    echo "$testNumber is not a prime number.";
}

?>