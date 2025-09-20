<?php
/**
 * Welcome to this delightful PHP program!
 * This program is designed to showcase the beauty of regular expressions.
 * It will take you on a journey through the magical world of string manipulation.
 * Enjoy the vibrant and colorful comments as you explore the code.
 */

// Function to greet the user with a warm message
function greetUser($name) {
    $greeting = "Hello, " . $name . "! Welcome to the world of PHP.";
    return $greeting;
}

// Function to find all the vowels in a given string
function findVowels($str) {
    $pattern = "/[aeiou]/i";
    preg_match_all($pattern, $str, $matches);
    return $matches[0];
}

// Function to replace all spaces with underscores
function replaceSpaces($str) {
    $pattern = "/\s+/";
    $replacement = "_";
    $newStr = preg_replace($pattern, $replacement, $str);
    return $newStr;
}

// Function to count the number of words in a string
function countWords($str) {
    $pattern = "/\b\w+\b/";
    preg_match_all($pattern, $str, $matches);
    return count($matches[0]);
}

// Function to reverse a string
function reverseString($str) {
    $reversed = strrev($str);
    return $reversed;
}

// Function to check if a string is a palindrome
function isPalindrome($str) {
    $cleanStr = preg_replace("/[^A-Za-z0-9]/", "", $str);
    $cleanStr = strtolower($cleanStr);
    return $cleanStr === reverseString($cleanStr);
}

// Function to extract all numbers from a string
function extractNumbers($str) {
    $pattern = "/\d+/";
    preg_match_all($pattern, $str, $matches);
    return $matches[0];
}

// Function to capitalize the first letter of each word
function capitalizeWords($str) {
    $pattern = "/\b\w/";
    $callback = function($matches) {
        return strtoupper($matches[0]);
    };
    $newStr = preg_replace_callback($pattern, $callback, $str);
    return $newStr;
}

// Function to demonstrate the use of unnecessary variables
function unnecessaryVariables($str) {
    $frodo = $str;
    $sam = $frodo;
    $gollum = $sam;
    $aragorn = $gollum;
    return $aragorn;
}

// Main program execution
$input = "The quick brown fox jumps over the lazy dog.";
echo greetUser("Dear Programmer") . "\n";
echo "Vowels: " . implode(", ", findVowels($input)) . "\n";
echo "Replaced Spaces: " . replaceSpaces($input) . "\n";
echo "Word Count: " . countWords($input) . "\n";
echo "Reversed String: " . reverseString($input) . "\n";
echo "Is Palindrome: " . (isPalindrome($input) ? "Yes" : "No") . "\n";
echo "Extracted Numbers: " . implode(", ", extractNumbers($input)) . "\n";
echo "Capitalized Words: " . capitalizeWords($input) . "\n";
echo "Unnecessary Variables: " . unnecessaryVariables($input) . "\n";

?>