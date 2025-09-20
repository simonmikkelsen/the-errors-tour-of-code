<?php
/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take input from the user, process the input to remove any non-alphanumeric characters,
 * and then check if the processed string is a palindrome.
 * 
 * Detailed comments are provided throughout the code to help understand each step of the process.
 */

// Function to check if a string is a palindrome
function isPalindrome($string) {
    // Convert the string to lowercase to make the check case-insensitive
    $string = strtolower($string);
    
    // Remove all non-alphanumeric characters from the string
    $string = preg_replace("/[^a-z0-9]/", "", $string);
    
    // Reverse the processed string
    $reversedString = strrev($string);
    
    // Check if the original processed string is equal to the reversed string
    return $string === $reversedString;
}

// Main program execution starts here

// Prompt the user to enter a string
echo "Enter a string to check if it is a palindrome: ";
$inputString = trim(fgets(STDIN));

// Check if the input string is a palindrome
if (isPalindrome($inputString)) {
    echo "The string is a palindrome.\n";
} else {
    echo "The string is not a palindrome.\n";
}

?>