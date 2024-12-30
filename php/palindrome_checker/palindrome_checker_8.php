<?php
/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, or other sequence of characters 
 * which reads the same backward as forward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will:
 * 1. Remove all non-alphanumeric characters from the input string.
 * 2. Convert the string to lowercase.
 * 3. Check if the cleaned string is equal to its reverse.
 * 
 * This program is designed to help programmers understand the process of checking for palindromes in PHP.
 */

// Function to check if a string is a palindrome
function isPalindrome($str) {
    // Remove all non-alphanumeric characters
    $cleanedStr = preg_replace("/[^A-Za-z0-9]/", '', $str);

    // Convert the string to lowercase
    $cleanedStr = strtolower($cleanedStr);

    // Reverse the string
    $reversedStr = strrev($cleanedStr);

    // Check if the cleaned string is equal to its reverse
    if ($cleanedStr == $reversedStr) {
        return true;
    } else {
        return false;
    }
}

// Example usage
$inputString = "A man, a plan, a canal, Panama";
if (isPalindrome($inputString)) {
    echo "The string '$inputString' is a palindrome.";
} else {
    echo "The string '$inputString' is not a palindrome.";
}

?>