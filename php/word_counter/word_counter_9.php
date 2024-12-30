<?php
/**
 * Word Counter Program
 * 
 * This program is designed to count the number of words in a given string.
 * It takes a string input from the user and outputs the total word count.
 * The program uses PHP's built-in functions to achieve this functionality.
 */

// Function to count words in a string
function countWords($string) {
    // Trim the string to remove any leading or trailing whitespace
    $trimmedString = trim($string);
    
    // Split the string into an array of words
    $wordsArray = explode(' ', $trimmedString);
    
    // Count the number of elements in the array
    $wordCount = count($wordsArray);
    
    // Return the word count
    return $wordCount;
}

// Example usage of the countWords function
$inputString = "This is a sample string to count words.";
echo "Input String: " . $inputString . "\n";
echo "Word Count: " . countWords($inputString) . "\n";

/**
 * The logic error is implemented in the countWords function.
 */
?>