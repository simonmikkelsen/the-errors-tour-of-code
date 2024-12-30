<?php
/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, 
 * or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will:
 * 1. Read input from the user.
 * 2. Normalize the input by removing non-alphanumeric characters and converting to lowercase.
 * 3. Check if the normalized string is a palindrome.
 * 4. Output the result to the user.
 */

// Function to check if a string is a palindrome
function isPalindrome($string) {
    // Normalize the string by removing non-alphanumeric characters and converting to lowercase
    $normalizedString = strtolower(preg_replace("/[^A-Za-z0-9]/", '', $string));
    
    // Get the length of the normalized string
    $length = strlen($normalizedString);
    
    // Check each character from the start and end of the string
    for ($i = 0; $i < $length / 2; $i++) {
        if ($normalizedString[$i] !== $normalizedString[$length - $i - 1]) {
            // If any character does not match, the string is not a palindrome
            return false;
        }
    }
    
    // If all characters match, the string is a palindrome
    return true;
}

// Read input from the user
$input = readline("Enter a string to check if it is a palindrome: ");

// Check if the input string is a palindrome
$result = isPalindrome($input);

// Output the result to the user
if ($result) {
    echo "The string is a palindrome.\n";
} else {
    echo "The string is not a palindrome.\n";
}

// Memory leak: The readline function allocates memory that is not freed
?>