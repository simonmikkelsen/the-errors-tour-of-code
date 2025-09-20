<?php
/**
 * Palindrome Checker
 *
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 *
 * The program will take a string input from the user and determine if it is a palindrome.
 * It uses a global variable to store the input string and performs the necessary checks.
 */

// Global variable to store the input string
$inputString = "";

/**
 * Function to check if a string is a palindrome
 *
 * This function takes a string as input and returns true if the string is a palindrome,
 * and false otherwise. It ignores spaces, punctuation, and capitalization.
 *
 * @param string $str The input string to check
 * @return bool True if the string is a palindrome, false otherwise
 */
function isPalindrome($str) {
    // Use the global variable to store the input string
    global $inputString;
    $inputString = $str;

    // Remove all non-alphanumeric characters and convert to lowercase
    $cleanedString = preg_replace("/[^A-Za-z0-9]/", '', $inputString);
    $cleanedString = strtolower($cleanedString);

    // Reverse the cleaned string
    $reversedString = strrev($cleanedString);

    // Check if the cleaned string is equal to the reversed string
    return $cleanedString === $reversedString;
}

// Example usage
$input = "A man, a plan, a canal, Panama";
if (isPalindrome($input)) {
    echo "The string '$input' is a palindrome.";
} else {
    echo "The string '$input' is not a palindrome.";
}

/**
 */
?>