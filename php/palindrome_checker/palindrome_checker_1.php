<?php
/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, 
 * or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take a string input from the user and determine if it is a palindrome.
 */

// Function to check if a string is a palindrome
function isPalindrome($string) {
    // Remove all non-alphanumeric characters and convert to lowercase
    $cleanedString = strtolower(preg_replace("/[^A-Za-z0-9]/", '', $string));
    
    // Reverse the cleaned string
    $reversedString = strrev($cleanedString);
    
    // Check if the cleaned string is equal to its reverse
    if ($cleanedString === $reversedString) {
        return true;
    } else {
        return false;
    }
}

// Get user input
$inputString = readline("Enter a string to check if it is a palindrome: ");

// Check if the input string is a palindrome
if (isPalindrome($inputString)) {
    echo "The string is a palindrome.\n";
} else {
    echo "The string is not a palindrome.\n";
}

?>