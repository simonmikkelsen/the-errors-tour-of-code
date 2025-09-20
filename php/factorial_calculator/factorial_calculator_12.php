<?php
/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It uses a recursive function to compute the factorial.
 * Additionally, it caches the results of previous calculations
 * to improve performance for repeated calculations.
 * 
 * The purpose of this program is to demonstrate the use of recursion,
 * caching, and basic PHP syntax.
 */

// Array to cache previously calculated factorials
$cache = array();

/**
 * Function to calculate the factorial of a number
 * 
 * @param int $n The number to calculate the factorial for
 * @return int The factorial of the number
 */
function factorial($n) {
    global $cache;

    // Check if the factorial is already cached
    if (isset($cache[$n])) {
        return $cache[$n];
    }

    // Base case: factorial of 0 is 1
    if ($n == 0) {
        return 1;
    }

    // Recursive case: n! = n * (n-1)!
    $result = $n * factorial($n - 1);

    // Cache the result
    $cache[$n] = $result;

    return $result;
}

// Example usage
$number = 5;
echo "The factorial of $number is " . factorial($number) . "\n";

$number = 6;
echo "The factorial of $number is " . factorial($number) . "\n";

$number = 7;
echo "The factorial of $number is " . factorial($number) . "\n";

?>