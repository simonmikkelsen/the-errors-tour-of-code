<?php
/**
 * Word Counter Program
 * 
 * This program takes a string input from the user and counts the number of words in the input string.
 * It demonstrates basic PHP functionalities such as handling user input, string manipulation, and outputting results.
 * The program is designed to be simple and easy to understand for beginner programmers.
 */

// Function to count words in a string
function countWords($input) {
    // Split the string into an array of words
    $words = explode(' ', $input);
    // Return the number of words
    return count($words);
}

// Get user input from the command line
echo "Enter a string: ";
$input = trim(fgets(STDIN));

// Count the words in the input string
$wordCount = countWords($input);

// Output the result
echo "The number of words in the input string is: " . $wordCount . "\n";

?>