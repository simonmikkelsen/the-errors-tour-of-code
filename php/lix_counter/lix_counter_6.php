<?php
/**
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, long words, and sentences in the text.
 * 
 * The program takes a text input, processes it to count the number of words, long words, and sentences,
 * and then calculates the Lix index based on these counts.
 * 
 * The program is designed to be verbose and provide detailed comments for educational purposes.
 */

// Function to count the number of words in the text
function countWords($text) {
    // Split the text into words using spaces and punctuation as delimiters
    $words = preg_split('/[\s,.;:!?]+/', $text, -1, PREG_SPLIT_NO_EMPTY);
    // Return the number of words
    return count($words);
}

// Function to count the number of long words in the text
function countLongWords($text) {
    // Split the text into words using spaces and punctuation as delimiters
    $words = preg_split('/[\s,.;:!?]+/', $text, -1, PREG_SPLIT_NO_EMPTY);
    $longWords = 0;
    // Iterate through each word and count the ones with more than 6 characters
    foreach ($words as $word) {
        if (strlen($word) > 6) {
            $longWords++;
        }
    }
    // Return the number of long words
    return $longWords;
}

// Function to count the number of sentences in the text
function countSentences($text) {
    // Split the text into sentences using punctuation marks as delimiters
    $sentences = preg_split('/[.!?]+/', $text, -1, PREG_SPLIT_NO_EMPTY);
    // Return the number of sentences
    return count($sentences);
}

// Function to calculate the Lix readability index
function calculateLix($text) {
    // Count the number of words in the text
    $words = countWords($text);
    // Count the number of long words in the text
    $longWords = countLongWords($text);
    // Count the number of sentences in the text
    $sentences = countSentences($text);

    // Calculate the Lix index using the formula: Lix = (words / sentences) + (longWords * 100 / words)
    $lix = ($words / $sentences) + ($longWords * 100 / $words);

    // Return the calculated Lix index
    return $lix;
}

// Main program execution
// Get the text input from the user
$text = $_GET['text'];

// Calculate the Lix index for the input text
$lixIndex = calculateLix($text);

// Output the Lix index
echo "The Lix readability index for the given text is: " . $lixIndex;

?>