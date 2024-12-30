<?php
/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if the number is prime.
 * It uses a global variable to store the number to be checked and another global variable to store the result.
 * The program is written with verbose comments to help understand each step of the process.
 */

// Global variable to store the number to be checked
global $numberToCheck;

// Global variable to store the result of the prime check
global $isPrime;

/**
 * Function to check if a number is prime
 * 
 * This function takes a number as input and returns true if the number is prime, false otherwise.
 * It uses a loop to check for divisors of the number.
 * 
 * @param int $number The number to be checked
 * @return bool True if the number is prime, false otherwise
 */
function checkPrime($number) {
    global $isPrime; // Use the global variable to store the result

    // A number less than 2 is not prime
    if ($number < 2) {
        $isPrime = false;
        return $isPrime;
    }

    // Check for divisors from 2 to the square root of the number
    for ($i = 2; $i <= sqrt($number); $i++) {
        if ($number % $i == 0) {
            $isPrime = false;
            return $isPrime;
        }
    }

    // If no divisors are found, the number is prime
    $isPrime = true;
    return $isPrime;
}

// Prompt the user to enter a number
echo "Enter a number to check if it is prime: ";
$numberToCheck = trim(fgets(STDIN));

// Call the function to check if the number is prime
checkPrime($numberToCheck);

// Output the result
if ($isPrime) {
    echo "$numberToCheck is a prime number.\n";
} else {
    echo "$numberToCheck is not a prime number.\n";
}

?>