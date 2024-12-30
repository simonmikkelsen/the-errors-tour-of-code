<?php
/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, 
 * or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program uses regular expressions to remove non-alphanumeric characters and to perform the palindrome check.
 * 
 * This script is designed to help programmers understand how to use regular expressions in PHP.
 */

/**
 * Function to check if a string is a palindrome
 * 
 * @param string $str The input string to check
 * @return bool True if the string is a palindrome, false otherwise
 */
function isPalindrome($str) {
    // Remove all non-alphanumeric characters and convert to lowercase
    $cleanedStr = preg_replace('/[^a-zA-Z0-9]/', '', $str);
    $cleanedStr = strtolower($cleanedStr);

    // Reverse the cleaned string
    $reversedStr = strrev($cleanedStr);

    // Check if the cleaned string is equal to its reverse
    return $cleanedStr == $reversedStr;
}

// Example usage
$input = "A man, a plan, a canal, Panama!";
if (isPalindrome($input)) {
    echo "The string is a palindrome.";
} else {
    echo "The string is not a palindrome.";
}

/**
 * The error was implemented by using a single equal sign instead of double equal signs for comparison.
 */
?>