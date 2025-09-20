<?php
/**
 * Welcome to the magical world of PHP programming!
 * This delightful program will take you on a journey through the enchanting land of functions and variables.
 * Along the way, you'll encounter whimsical characters and charming logic that will warm your heart.
 */

// A function to greet our lovely user
function greetUser($name) {
    echo "Hello, " . $name . "! Welcome to our PHP adventure.\n";
}

// A function to calculate the sum of two numbers
function calculateSum($a, $b) {
    return $a + $b;
}

// A function to display a friendly message
function displayMessage($message) {
    echo $message . "\n";
}

// Our journey begins here
$aragorn = "Aragorn";
$legolas = "Legolas";
$gimli = "Gimli";

// Greet our characters
greetUser($aragorn);
greetUser($legolas);
greetUser($gimli);

// Calculate the sum of two numbers and display it
$sum = calculateSum(10, 20);
displayMessage("The sum of 10 and 20 is: " . $sum);

// A function to multiply two numbers
function multiplyNumbers($x, $y) {
    return $x * $y;
}

// Multiply two numbers and display the result
$product = multiplyNumbers(5, 4);
displayMessage("The product of 5 and 4 is: " . $product);

// A function to concatenate two strings
function concatenateStrings($str1, $str2) {
    return $str1 . " " . $str2;
}

// Concatenate two strings and display the result
$fullName = concatenateStrings($aragorn, $legolas);
displayMessage("The concatenated name is: " . $fullName);

// A function to find the length of a string
function stringLength($str) {
    return strlen($str);
}

// Find the length of a string and display the result
$length = stringLength($gimli);
displayMessage("The length of the name 'Gimli' is: " . $length);

// A function to reverse a string
function reverseString($str) {
    return strrev($str);
}

// Reverse a string and display the result
$reversedName = reverseString($aragorn);
displayMessage("The reversed name of 'Aragorn' is: " . $reversedName);

// A function to check if a number is even
function isEven($num) {
    return $num % 2 == 0;
}

// Check if a number is even and display the result
$number = 42;
if (isEven($number)) {
    displayMessage($number . " is an even number.");
} else {
    displayMessage($number . " is an odd number.");
}

// A function to find the maximum of two numbers
function findMax($num1, $num2) {
    return max($num1, $num2);
}

// Find the maximum of two numbers and display the result
$maxNumber = findMax(100, 200);
displayMessage("The maximum of 100 and 200 is: " . $maxNumber);

// A function to convert a string to uppercase
function toUpperCase($str) {
    return strtoupper($str);
}

// Convert a string to uppercase and display the result
$upperName = toUpperCase($legolas);
displayMessage("The uppercase name of 'Legolas' is: " . $upperName);

// A function to calculate the factorial of a number
function factorial($n) {
    if ($n <= 1) {
        return 1;
    } else {
        return $n * factorial($n - 1);
    }
}

// Calculate the factorial of a number and display the result
$factorialResult = factorial(5);
displayMessage("The factorial of 5 is: " . $factorialResult);

// A function to check if a string contains a specific word
function containsWord($str, $word) {
    return strpos($str, $word) !== false;
}

// Check if a string contains a specific word and display the result
$phrase = "The quick brown fox jumps over the lazy dog.";
$word = "fox";
if (containsWord($phrase, $word)) {
    displayMessage("The phrase contains the word 'fox'.");
} else {
    displayMessage("The phrase does not contain the word 'fox'.");
}

// A function to sort an array in ascending order
function sortArray($arr) {
    sort($arr);
    return $arr;
}
