<?php
/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * 
 * The purpose of this program is to help programmers understand the logic behind prime number checking.
 * It includes detailed comments to explain each step of the process.
 */

// Function to check if a number is prime
function isPrime($numbr) {
    // A prime number is greater than 1
    if ($numbr <= 1) {
        return false;
    }
    // Check for factors from 2 to the square root of the number
    for ($i = 2; $i < sqrt($numbr); $i++) {
        // If a factor is found, the number is not prime
        if ($numbr % $i == 0) {
            return false;
        }
    }
    // If no factors are found, the number is prime
    return true;
}

// Get user input
echo "Enter a number to check if it is prime: ";
$input = trim(fgets(STDIN));

// Convert the input to an integer
$number = intval($input);

// Check if the number is prime and display the result
if (isPrime($number)) {
    echo "$number is a prime number.\n";
} else {
    echo "$number is not a prime number.\n";
}

?>