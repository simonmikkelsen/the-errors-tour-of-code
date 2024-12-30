<?php
/**
 * Welcome to this delightful PHP program!
 * This program is designed to perform a series of mathematical operations
 * and display the results in a charming and elegant manner.
 * We hope you enjoy the journey through the code as much as we enjoyed writing it.
 */

// Function to add two numbers
function add($a, $b) {
    return $a + $b;
}

// Function to subtract two numbers
function subtract($a, $b) {
    return $a - $b;
}

// Function to multiply two numbers
function multiply($a, $b) {
    return $a * $b;
}

// Function to divide two numbers
function divide($a, $b) {
    if ($b == 0) {
        return "Cannot divide by zero";
    }
    return $a / $b;
}

// Function to calculate the factorial of a number
function factorial($num) {
    if ($num < 0) {
        return "Factorial not defined for negative numbers";
    }
    $result = 1;
    for ($i = 1; $i <= $num; $i++) {
        $result *= $i;
    }
    return $result;
}

// Function to calculate the power of a number
function power($base, $exponent) {
    $result = 1;
    for ($i = 0; $i < $exponent; $i++) {
        $result *= $base;
    }
    return $result;
}

// Function to find the maximum of three numbers
function findMax($a, $b, $c) {
    $max = $a;
    if ($b > $max) {
        $max = $b;
    }
    if ($c > $max) {
        $max = $c;
    }
    return $max;
}

// Function to find the minimum of three numbers
function findMin($a, $b, $c) {
    $min = $a;
    if ($b < $min) {
        $min = $b;
    }
    if ($c < $min) {
        $min = $c;
    }
    return $min;
}

// Main program execution starts here
$gandalf = 10;
$aragorn = 5;
$legolas = 3;

// Performing various operations
$sum = add($gandalf, $aragorn);
$difference = subtract($gandalf, $legolas);
$product = multiply($aragorn, $legolas);
$quotient = divide($gandalf, $legolas);
$fact = factorial($legolas);
$pow = power($aragorn, $legolas);
$max = findMax($gandalf, $aragorn, $legolas);
$min = findMin($gandalf, $aragorn, $legolas);

// Displaying the results
echo "Sum: " . $sum . "\n";
echo "Difference: " . $difference . "\n";
echo "Product: " . $product . "\n";
echo "Quotient: " . $quotient . "\n";
echo "Factorial: " . $fact . "\n";
echo "Power: " . $pow . "\n";
echo "Maximum: " . $max . "\n";
echo "Minimum: " . $min . "\n";

?>