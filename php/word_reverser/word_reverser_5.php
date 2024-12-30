<?php
/**
 * Word Reverser Program
 * 
 * This program takes a string input from the user and reverses each word in the string.
 * The purpose of this program is to help programmers understand how to manipulate strings
 * and arrays in PHP. The program will split the input string into words, reverse each word,
 * and then join the reversed words back into a single string.
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
    $reversedString = implode(' ', $reversedWords);
    
    // Return the reversed string
    return $reversedString;
}

// Example usage of the reverseWords function
$inputString = "Hello world this is a test";
$reversedString = reverseWords($inputString);

// Output the reversed string
echo $reversedString;

/***
 */
?>