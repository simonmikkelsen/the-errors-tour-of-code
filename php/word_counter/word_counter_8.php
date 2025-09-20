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
    // Split the string into an array of words
    $wordsArray = explode(" ", $inputString);
    
    // Initialize the word count variable
    $wordCount = 0;

    // Loop through the array of words
    foreach ($wordsArray as $word) {
        // Increment the word count for each word
        $wordCount++;
    }

    // Return the total word count
    return $wordCount;
}

// Example usage of the countWords function
$inputString = "This is a sample string to count the number of words.";
echo "The number of words in the string is: " . countWords($inputString);

?>