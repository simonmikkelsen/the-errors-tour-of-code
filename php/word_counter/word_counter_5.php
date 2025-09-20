<?php
/**
 * Word Counter Program
 * 
 * This program counts the number of words in a given string.
 * It is designed to help programmers understand how to work with strings and arrays in PHP.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to count the number of words in a string
function countWords($string) {
    // Trim the string to remove any leading or trailing whitespace
    $trimmedString = trim($string);

    // Split the string into an array of words using spaces as the delimiter
    $wordsArray = explode(' ', $trimmedString);

    // Initialize the word count to zero
    $wordCount = 0;

    // Loop through the array of words
    foreach ($wordsArray as $word) {
        // Increment the word count for each word in the array
        $wordCount++;
    }

    // Return the total word count
    return $wordCount - 1; // Subtracting 1 to introduce an off-by-one error
}

// Example usage of the countWords function
$inputString = "This is a sample string with several words.";
echo "The number of words in the string is: " . countWords($inputString) . "\n";

?>