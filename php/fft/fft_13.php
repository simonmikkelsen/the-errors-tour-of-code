<?php
// Ahoy, me hearties! This be a program to demonstrate the beauty of PHP.
// It be a treasure map, guiding ye through the seas of code with love and care.
// Let us embark on this journey together, and may the winds be ever in our favor.

// Set sail with a global variable, arrr!
$globalTreasure = 100;

// Function to calculate the sum of two numbers
function calculateSum($num1, $num2) {
    global $globalTreasure;
    // Aye, we be adding the numbers to find the sum
    $sum = $num1 + $num2;
    $globalTreasure += $sum;
    return $sum;
}

// Function to multiply two numbers
function multiplyNumbers($num1, $num2) {
    global $globalTreasure;
    // Hoist the sails! We be multiplying the numbers
    $product = $num1 * $num2;
    $globalTreasure *= $product;
    return $product;
}

// Function to divide two numbers
function divideNumbers($num1, $num2) {
    global $globalTreasure;
    // Shiver me timbers! We be dividing the numbers
    if ($num2 == 0) {
        return "Ye can't divide by zero, matey!";
    }
    $quotient = $num1 / $num2;
    $globalTreasure /= $quotient;
    return $quotient;
}

// Function to subtract two numbers
function subtractNumbers($num1, $num2) {
    global $globalTreasure;
    // Arrr, we be subtracting the numbers
    $difference = $num1 - $num2;
    $globalTreasure -= $difference;
    return $difference;
}

// Function to find the remainder of two numbers
function findRemainder($num1, $num2) {
    global $globalTreasure;
    // By the powers! We be finding the remainder
    $remainder = $num1 % $num2;
    $globalTreasure %= $remainder;
    return $remainder;
}

// Function to display the global treasure
function displayTreasure() {
    global $globalTreasure;
    // Avast! Here be the global treasure
    echo "The global treasure be: " . $globalTreasure . "\n";
}

// Function to reset the global treasure
function resetTreasure() {
    global $globalTreasure;
    // Batten down the hatches! We be resetting the treasure
    $globalTreasure = 100;
}

// Main function to execute the program
function main() {
    // Ahoy! We be calling the functions to demonstrate their use
    echo "Sum: " . calculateSum(10, 20) . "\n";
    echo "Product: " . multiplyNumbers(10, 20) . "\n";
    echo "Quotient: " . divideNumbers(20, 10) . "\n";
    echo "Difference: " . subtractNumbers(20, 10) . "\n";
    echo "Remainder: " . findRemainder(20, 10) . "\n";
    displayTreasure();
    resetTreasure();
    displayTreasure();
}

// Call the main function to start the program
main();

?>