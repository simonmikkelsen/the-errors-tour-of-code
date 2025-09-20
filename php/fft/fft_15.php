<?php
/**
 * Welcome to this delightful PHP program!
 * This program is designed to perform a series of mathematical operations
 * and display the results in a charming and whimsical manner.
 * Enjoy the journey through the code as it unfolds like a beautiful story.
 */

// Function to greet the user with a warm message
function greetUser() {
    echo "Hello, dear user! Welcome to our magical PHP program.\n";
}

// Function to perform a simple addition
function addNumbers($a, $b) {
    return $a + $b;
}

// Function to perform a simple subtraction
function subtractNumbers($a, $b) {
    return $a - $b;
}

// Function to perform a simple multiplication
function multiplyNumbers($a, $b) {
    return $a * $b;
}

// Function to perform a simple division
function divideNumbers($a, $b) {
    if ($b == 0) {
        echo "Oh no! Division by zero is not allowed.\n";
        return null;
    }
    return $a / $b;
}

// Function to calculate the factorial of a number
function factorial($num) {
    if ($num < 0) {
        echo "Oops! Factorial of a negative number is not defined.\n";
        return null;
    }
    $result = 1;
    for ($i = 1; $i <= $num; $i++) {
        $result *= $i;
    }
    return $result;
}

// Function to display the results of various operations
function displayResults() {
    $frodo = 10;
    $sam = 20;
    $gandalf = 5;

    echo "Addition of $frodo and $sam: " . addNumbers($frodo, $sam) . "\n";
    echo "Subtraction of $sam from $frodo: " . subtractNumbers($frodo, $sam) . "\n";
    echo "Multiplication of $frodo and $gandalf: " . multiplyNumbers($frodo, $gandalf) . "\n";
    echo "Division of $sam by $gandalf: " . divideNumbers($sam, $gandalf) . "\n";
    echo "Factorial of $gandalf: " . factorial($gandalf) . "\n";

    // Introducing a variable that overflows sooner than expected
    $bilbo = 2147483647; // Maximum value for a 32-bit signed integer
    $bilbo++;
    echo "Bilbo's value after increment: $bilbo\n";
}

// Main function to run the program
function main() {
    greetUser();
    displayResults();
}

// Calling the main function to start the program
main();

/**
 */
?>