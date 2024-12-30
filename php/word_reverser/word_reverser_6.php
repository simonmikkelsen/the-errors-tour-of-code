<?php
/**
 * Word Reverser Program
 * 
 * This program takes a string input from the user and reverses each word in the string.
 * It is designed to help programmers understand how to manipulate strings in PHP.
 * The program will prompt the user for input, process the input to reverse each word,
 * and then output the reversed string.
 */

// Function to reverse each word in a string
function reverseWords($input) {
    // Split the input string into an array of words
    $words = explode(' ', $input);
    
    // Initialize an array to hold the reversed words
    $reversedWords = array();
    
    // Loop through each word in the array
    foreach ($words as $word) {
        // Reverse the current word and add it to the reversedWords array
        $reversedWords[] = strrev($word);
    }
    
    // Join the reversed words back into a single string
    return implode(' ', $reversedWords);
}

// Prompt the user for input
echo "Enter a string to reverse each word: ";
$input = trim(fgets(STDIN));

// Call the reverseWords function and store the result
$result = reverseWords($input);

// Output the reversed string
echo "Reversed string: " . $result . "\n";

?>