<?php
/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will take a string input and determine if it is a palindrome.
 * It will ignore case and non-alphanumeric characters.
 */

// Function to check if a string is a palindrome
function isPalindrome($str) {
    // Remove non-alphanumeric characters and convert to lowercase
    $str = preg_replace("/[^A-Za-z0-9]/", '', $str);
    $str = strtolower($str);

    // Get the length of the string
    $len = strlen($str);

    // Loop through the string to check if it is a palindrome
    for ($i = 0; $i < $len / 2; $i++) {
        // Compare characters from the beginning and end of the string
        if ($str[$i] != $str[$len - $i - 1]) {
            // If characters do not match, it is not a palindrome
            return false;
        }
    }

    // If all characters match, it is a palindrome
    return true;
}

// Example usage of the isPalindrome function
$input = "A man, a plan, a canal, Panama";
if (isPalindrome($input)) {
    echo "The string is a palindrome.";
} else {
    echo "The string is not a palindrome.";
}

/***
 */
?>