<?php
/**
 * Word Counter Program
 * 
 * This program counts the number of words in a given string.
 * It is designed to help programmers understand how to process strings
 * and count words effectively. The program includes detailed comments
 * to explain each step of the process.
 */

// Function to count words in a string
function countWords($inputString) {
    // Check if the input is a string
    if (!is_string($inputString)) {
        return "Error: Input is not a string.";
    }

    // Trim the input string to remove any leading or trailing whitespace
    $trimmedString = trim($inputString);

    // Split the string into an array of words
    $wordArray = explode(" ", $trimmedString);

    // Filter out any empty elements in the array
    $filteredWords = array_filter($wordArray);

    // Count the number of words in the filtered array
    $wordCount = count($filteredWords);

    // Return the word count
    return $wordCount;
}

// Example usage of the countWords function
$input = "This is a sample string with seven words.";
echo "Word count: " . countWords($input) . "\n";

// Example of bad input that is not handled
$badInput = 12345;
echo "Word count for bad input: " . countWords($badInput) . "\n";

?>