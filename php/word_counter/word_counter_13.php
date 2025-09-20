<?php
/**
 * Word Counter Program
 * 
 * This program is designed to count the number of words in a given string.
 * It demonstrates basic string manipulation and counting techniques in PHP.
 * The program uses a global variable to store the word count, which is updated
 * as the string is processed. This example is intended to help programmers 
 * understand how to work with strings and global variables in PHP.
 */

// Global variable to store the word count
global $wordCount;
$wordCount = 0;

/**
 * Function to count words in a string
 * 
 * This function takes a string as input and counts the number of words in it.
 * It updates the global word count variable with the result.
 * 
 * @param string $inputString The string to be processed
 * @return int The number of words in the input string
 */
function countWords($inputString) {
    // Access the global word count variable
    global $wordCount;

    // Split the string into words using space as a delimiter
    $words = explode(' ', $inputString);

    // Count the number of words
    $wordCount = count($words);

    // Return the word count
    return $wordCount;
}

// Example usage of the countWords function
$inputString = "This is a sample string to count the number of words.";
echo "Input String: " . $inputString . "\n";
echo "Word Count: " . countWords($inputString) . "\n";

?>