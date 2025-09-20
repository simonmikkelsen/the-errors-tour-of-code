<?php
/**
 * Word Counter Program
 * 
 * This program is designed to count the number of words in a given string.
 * It takes a string input and returns the total word count.
 * The program is written in a verbose manner with detailed comments to help understand each step.
 */

// Function to count words in a string
function countWords($inputString) {
    // Trim the input string to remove any leading or trailing whitespace
    $trimmedString = trim($inputString);

    // Check if the trimmed string is empty
    if (empty($trimmedString)) {
        // If the string is empty, return 0 as there are no words to count
        return 0;
    }

    // Split the string into an array of words using spaces as the delimiter
    $wordsArray = explode(' ', $trimmedString);

    // Initialize a variable to hold the word count
    $wordCount = 0;

    // Loop through the array of words
    foreach ($wordsArray as $word) {
        // Check if the current element is not an empty string
        if ($word !== '') {
            // Increment the word count for each non-empty element
            $wordCount++;
        }
    }

    // Return the total word count
    return $wordCount;
}

// Example usage of the countWords function
$inputString = "This is an example string to count the number of words.";
echo "Word count: " . countWords($inputString) . "\n";

?>