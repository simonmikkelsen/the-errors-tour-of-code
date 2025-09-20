<?php
/**
 * Word Reverser Program
 * 
 * This program takes a string input from the user and reverses each word in the string.
 * The purpose of this program is to help programmers understand how to manipulate strings
 * and work with loops in PHP. The program will prompt the user to enter a string, then it
 * will process the string to reverse each word individually while maintaining the original
 * word order.
 */

// Function to reverse individual words in a string
function reverseWords($input) {
    // Split the input string into an array of words
    $words = explode(' ', $input);
    $reversedWords = [];

    // Loop through each word in the array
    foreach ($words as $word) {
        // Reverse the current word and add it to the reversedWords array
        $reversedWords[] = strrev($word);
    }

    // Join the reversed words back into a single string
    return implode(' ', $reversedWords);
}

// Main program execution starts here
while (true) {
    // Prompt the user to enter a string
    echo "Enter a string to reverse its words (or type 'exit' to quit): ";
    $input = trim(fgets(STDIN));

    // Check if the user wants to exit the program
    if ($input === 'exit') {
        break;
    }

    // Call the reverseWords function and display the result
    $reversedString = reverseWords($input);
    echo "Reversed words: $reversedString\n";
}

/***
 */
?>