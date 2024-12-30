<?php
/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, 
 * or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program includes a function to clean the input string by removing non-alphanumeric characters and converting it to lowercase.
 * It then checks if the cleaned string is the same when reversed.
 * 
 * The program also caches the cleaned string in memory for potential future use.
 */

/**
 * Function to clean the input string.
 * 
 * @param string $input The input string to be cleaned.
 * @return string The cleaned string with only alphanumeric characters in lowercase.
 */
function cleanString($input) {
    // Remove non-alphanumeric characters
    $cleaned = preg_replace("/[^A-Za-z0-9]/", '', $input);
    // Convert to lowercase
    return strtolower($cleaned);
}

/**
 * Function to check if a string is a palindrome.
 * 
 * @param string $input The input string to be checked.
 * @return bool True if the input string is a palindrome, false otherwise.
 */
function isPalindrome($input) {
    // Clean the input string
    $cleaned = cleanString($input);
    
    // Cache the cleaned string in memory
    $cache = $cleaned;
    
    // Check if the cleaned string is the same when reversed
    return $cleaned === strrev($cleaned);
}

// Example usage
$input = "A man, a plan, a canal, Panama";
if (isPalindrome($input)) {
    echo "'$input' is a palindrome.";
} else {
    echo "'$input' is not a palindrome.";
}

/***
 */
?>