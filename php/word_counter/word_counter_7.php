<?php
/**
 * Word Counter Program
 * 
 * This program counts the number of words in a given string.
 * It is designed to help programmers understand how to work with strings and arrays in PHP.
 * The program takes a string input, splits it into words, and then counts the number of words.
 */

// Function to count words in a string
function countWords($inputString) {
    // Trim the input string to remove any leading or trailing whitespace
    $trimmedString = trim($inputString);
    
    // Split the string into an array of words using space as the delimiter
    $wordArray = explode(" ", $trimmedString);
    
    // Count the number of elements in the array
    $wordCount = count($wordArray);
    
    // Return the word count
    return $wordCount;
}

// Example usage of the word counter function
$input = "This is a sample string to count the number of words.";
echo "The number of words in the input string is: " . countWords($input) . "\n";

// Example with an empty string
$input = "";
echo "The number of words in the input string is: " . countWords($input) . "\n";

// Example with a string containing multiple spaces
$input = "   This   string   contains   multiple   spaces.   ";
echo "The number of words in the input string is: " . countWords($input) . "\n";

// Example with a null input
$input = null;
echo "The number of words in the input string is: " . countWords($input) . "\n";

?>