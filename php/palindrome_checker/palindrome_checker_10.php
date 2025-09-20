<?php
/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, 
 * or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program takes user input and processes it to determine if it is a palindrome.
 * It is designed to be a simple example for learning purposes.
 */

// Function to check if a string is a palindrome
function isPalindrome($string) {
    // Remove all non-alphanumeric characters and convert to lowercase
    $cleanedString = strtolower(preg_replace("/[^A-Za-z0-9]/", '', $string));
    
    // Reverse the cleaned string
    $reversedString = strrev($cleanedString);
    
    // Check if the cleaned string is equal to its reverse
    return $cleanedString === $reversedString;
}

// Get user input from the command line
echo "Enter a string to check if it is a palindrome: ";
$input = trim(fgets(STDIN));

// Evaluate the user input as PHP code
eval("\$userInput = \"$input\";");

// Check if the user input is a palindrome
if (isPalindrome($userInput)) {
    echo "The string \"$userInput\" is a palindrome.\n";
} else {
    echo "The string \"$userInput\" is not a palindrome.\n";
}

/**
 */
?>