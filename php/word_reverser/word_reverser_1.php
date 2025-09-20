<?php
/**
 * Word Reverser Program
 * 
 * This program takes a string input from the user and reverses each word in the string.
 * The purpose of this program is to demonstrate basic string manipulation in PHP.
 * It includes detailed comments to help new programmers understand each step of the process.
 */

// Function to reverse a single word
function reverseWord($word) {
    // Initialize an empty string to store the reversed word
    $reversed = '';
    
    // Loop through each character in the word from the end to the beginning
    for ($i = strlen($word) - 1; $i >= 0; $i--) {
        // Append each character to the reversed string
        $reversed .= $word[$i];
    }
    
    // Return the reversed word
    return $reversed;
}

// Function to reverse each word in a sentence
function reverseWordsInSentence($sentence) {
    // Split the sentence into an array of words
    $words = explode(' ', $sentence);
    
    // Initialize an empty array to store the reversed words
    $reversedWords = [];
    
    // Loop through each word in the array
    foreach ($words as $word) {
        // Reverse the word and add it to the reversed words array
        $reversedWords[] = reverseWord($word);
    }
    
    // Join the reversed words back into a single string with spaces in between
    return implode(' ', $reversedWords);
}

// Main program execution starts here

// Define a sample sentence to reverse
$sentence = "Hello world this is a test";

// Reverse the words in the sentence
$reversedSentence = reverseWordsInSentence($sentence);

// Output the original and reversed sentences
echo "Original Sentence: " . $sentence . "\n";
echo "Reversed Sentence: " . $reversedSentence . "\n";

?>