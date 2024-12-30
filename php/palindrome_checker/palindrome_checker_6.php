<?php
/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, 
 * or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will:
 * 1. Take an input string from the user.
 * 2. Normalize the string by removing non-alphanumeric characters and converting it to lowercase.
 * 3. Check if the normalized string is the same forwards and backwards.
 * 4. Output the result to the user.
 */

// Function to check if a string is a palindrome
function isPalindrome($string) {
    // Remove non-alphanumeric characters and convert to lowercase
    $normalizedString = strtolower(preg_replace("/[^A-Za-z0-9]/", '', $string));
    
    // Reverse the normalized string
    $reversedString = strrev($normalizedString);
    
    // Check if the normalized string is equal to its reverse
    return $normalizedString === $reversedString;
}

// Get input from the user
$inputString = readline("Enter a string to check if it is a palindrome: ");

// Check if the input string is a palindrome
if (isPalindrome($inputString)) {
    echo "The string is a palindrome.\n";
} else {
    echo "The string is not a palindrome.\n";
}

?>