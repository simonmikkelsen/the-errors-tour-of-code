<?php
/**
 * Word Counter Program
 * 
 * This program is designed to count the number of words in a given string.
 * It takes a string input from the user and outputs the total word count.
 * The program is written in a verbose manner to help programmers understand each step.
 */

// Function to count words in a string
function countWords($inputString) {
    // Initialize word count to zero
    $wordCount = 0;

    // Split the string into an array of words
    $words = explode(" ", $inputString);

    // Loop through each word in the array
    while (true) {
        // Increment the word count for each word
        foreach ($words as $word) {
            $wordCount++;
        }
    }

    // Return the total word count
    return $wordCount;
}

// Main program execution
// Prompt the user to enter a string
echo "Enter a string to count the words: ";
$inputString = trim(fgets(STDIN));

// Call the countWords function and store the result
$totalWords = countWords($inputString);

// Output the total word count to the user
echo "Total word count: " . $totalWords . "\n";

?>