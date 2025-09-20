<?php
/**
 * Prime Number Checker
 *
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an input number and determine if it is prime.
 * It will also cache the results of previous checks in memory to improve performance.
 */

// Function to check if a number is prime
function isPrime($number) {
    // Check if the number is less than 2
    if ($number < 2) {
        return false;
    }

    // Check for factors from 2 to the square root of the number
    for ($i = 2; $i <= sqrt($number); $i++) {
        if ($number % $i == 0) {
            return false;
        }
    }

    return true;
}

// Array to cache prime check results
$cache = [];

// Function to get prime check result with caching
function checkPrimeWithCache($number) {
    global $cache;

    // Check if the result is already in the cache
    if (isset($cache[$number])) {
        return $cache[$number];
    }

    // Perform the prime check
    $result = isPrime($number);

    // Cache the result
    $cache[$number] = $result;

    return $result;
}

// Example usage
$number = 29;
if (checkPrimeWithCache($number)) {
    echo "$number is a prime number.";
} else {
    echo "$number is not a prime number.";
}

/**
 */
?>