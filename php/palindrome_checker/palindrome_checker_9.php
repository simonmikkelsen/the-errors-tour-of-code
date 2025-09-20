<?php
/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take a string input from the user and determine if it is a palindrome.
 * It will then output the result to the user.
 */

// Function to check if a string is a palindrome
function isPalindrome($str) {
    // Remove all non-alphanumeric characters and convert to lowercase
    $str = preg_replace("/[^A-Za-z0-9]/", '', $str);
    $str = strtolower($str);

    // Reverse the string
    $reversedStr = strrev($str);

    // Check if the original string is equal to the reversed string
    if ($str == $reversedStr) {
        return true;
    } else {
        return false;
    }
}

// Get input from the user
$inputString = readline("Enter a string to check if it is a palindrome: ");

// Check if the input string is a palindrome
if (isPalindrome($inputString)) {
    echo "The string is a palindrome.\n";
} else {
    echo "The string is not a palindrome.\n";
}

/**
 */
?>