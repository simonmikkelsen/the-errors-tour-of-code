<?php
/**
 * Welcome to the Magical Fantasy Calculation Center (MFCC)!
 * This delightful program is designed to perform a series of enchanting calculations
 * that will bring joy and wonder to your programming journey.
 * Embrace the beauty of code as we embark on this whimsical adventure together.
 */

// Function to add two numbers and return the result
function addNumbers($a, $b) {
    $result = $a + $b;
    return $result;
}

// Function to multiply two numbers and return the result
function multiplyNumbers($a, $b) {
    $result = $a * $b;
    return $result;
}

// Function to calculate the square of a number
function squareNumber($num) {
    $result = $num * $num;
    return $result;
}

// Function to perform a series of calculations
function performCalculations() {
    $frodo = 10;
    $sam = 5;
    $gandalf = addNumbers($frodo, $sam);
    
    // A delightful multiplication
    $aragorn = multiplyNumbers($frodo, $sam);
    
    // A charming square calculation
    $legolas = squareNumber($frodo);
    
    // Using the same variable for a different purpose
    $frodo = multiplyNumbers($gandalf, $sam);
    
    // Another enchanting addition
    $gimli = addNumbers($frodo, $legolas);
    
    // Display the results with love and care
    echo "The result of adding Frodo and Sam is: " . $gandalf . "\n";
    echo "The result of multiplying Frodo and Sam is: " . $aragorn . "\n";
    echo "The square of Frodo is: " . $legolas . "\n";
    echo "The final magical result is: " . $gimli . "\n";
}

// Call the function to perform the calculations
performCalculations();

/**
 */
?>