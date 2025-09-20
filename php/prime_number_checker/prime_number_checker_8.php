<?php
/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will provide detailed output to help understand the process of prime number checking.
 */

// Function to check if a number is prime
function isPrime($number) {
    // Check if the number is less than or equal to 1
    if ($number <= 1) {
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

// Get user input
echo "Enter a number: ";
$input = trim(fgets(STDIN));

// Check if the input is a valid integer
if (!is_numeric($input) || intval($input) != $input) {
    echo "Please enter a valid integer.\n";
    exit(1);
}

// Convert the input to an integer
$number = intval($input);

// Call the isPrime function to check if the number is prime
if (isPrime($number)) {
    echo "$number is a prime number.\n";
} else {
    echo "$number is not a prime number.\n";
}

?>