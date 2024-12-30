<?php
/**
 * Palindrome Checker
 * 
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will:
 * 1. Take a string input from the user.
 * 2. Normalize the string by removing non-alphanumeric characters and converting it to lowercase.
 * 3. Check if the normalized string is a palindrome.
 * 4. Output the result to the user.
 */

// Function to check if a string is a palindrome
function isPalindrome($string) {
    // Normalize the string by removing non-alphanumeric characters and converting to lowercase
    $normalizedString = strtolower(preg_replace("/[^A-Za-z0-9]/", '', $string));
    
    // Initialize pointers for the start and end of the string
    $start = 0;
    $end = strlen($normalizedString) - 1;
    
    // Loop to compare characters from the start and end of the string
    while ($start <= $end) {
        // If characters do not match, return false
        if ($normalizedString[$start] !== $normalizedString[$end]) {
            return false;
        }
        // Move the pointers towards the center
        $start++;
        $end--;
    }
    
    // If all characters match, return true
    return true;
}

// Main program execution
// Prompt the user for input
echo "Enter a string to check if it is a palindrome: ";
$inputString = trim(fgets(STDIN));

// Check if the input string is a palindrome
if (isPalindrome($inputString)) {
    echo "The string is a palindrome.\n";
} else {
    echo "The string is not a palindrome.\n";
}

?>