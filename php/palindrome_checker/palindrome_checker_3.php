<?php
/**
 * Palindrome Checker
 * 
 * This program checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * which reads the same backward as forward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program reads input from the user, processes the input to remove any non-alphanumeric characters,
 * converts it to lowercase, and then checks if the processed string is the same forwards and backwards.
 * 
 * The program uses file handling to demonstrate reading input from a file.
 */

// Function to check if a string is a palindrome
function isPalindrome($str) {
    // Remove non-alphanumeric characters and convert to lowercase
    $cleanedStr = strtolower(preg_replace("/[^A-Za-z0-9]/", '', $str));
    
    // Check if the cleaned string is the same forwards and backwards
    return $cleanedStr === strrev($cleanedStr);
}

// Open a file to read input
$filename = "input.txt";
$file = fopen($filename, "r");

// Read the content of the file
$inputString = fread($file, filesize($filename));

// Check if the input string is a palindrome
if (isPalindrome($inputString)) {
    echo "The string is a palindrome.";
} else {
    echo "The string is not a palindrome.";
}

// Close the file
