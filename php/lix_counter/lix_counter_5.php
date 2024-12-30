<?php
/**
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index of a given text. 
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is based on the number of words, the number of long words (more than 6 characters), 
 * and the number of sentences in the text.
 * 
 * The formula for calculating the Lix index is:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * This program will read a text from a file, calculate the Lix index, and print the result.
 */

// Function to count the number of words in a text
function countWords($text) {
    $words = str_word_count($text, 1);
    return count($words);
}

// Function to count the number of long words in a text
function countLongWords($text) {
    $words = str_word_count($text, 1);
    $longWords = array_filter($words, function($word) {
        return strlen($word) > 6;
    });
    return count($longWords);
}

// Function to count the number of sentences in a text
function countSentences($text) {
    $sentences = preg_split('/[.!?]+/', $text, -1, PREG_SPLIT_NO_EMPTY);
    return count($sentences);
}

// Function to calculate the Lix index
function calculateLix($text) {
    $numWords = countWords($text);
    $numLongWords = countLongWords($text);
    $numSentences = countSentences($text);

    // Calculate the Lix index using the formula
    $lix = ($numWords / $numSentences) + ($numLongWords * 100 / $numWords);
    return $lix;
}

// Main program
$text = file_get_contents('text.txt'); // Read the text from a file
$lixIndex = calculateLix($text); // Calculate the Lix index
echo "The Lix index of the text is: " . $lixIndex; // Print the result

?>