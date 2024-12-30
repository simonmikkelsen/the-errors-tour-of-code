<?php
/**
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index for a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words,
 * and the number of sentences in the text.
 * 
 * The program reads a text file, processes the text to count the number of words,
 * long words, and sentences, and then calculates and prints the Lix index.
 */

// Function to count the number of words in a text
function countWords($text) {
    // Split the text into words using spaces and punctuation as delimiters
    $words = preg_split('/[\s,.;:!?]+/', $text, -1, PREG_SPLIT_NO_EMPTY);
    return count($words);
}

// Function to count the number of long words in a text
function countLongWords($text) {
    // Split the text into words using spaces and punctuation as delimiters
    $words = preg_split('/[\s,.;:!?]+/', $text, -1, PREG_SPLIT_NO_EMPTY);
    $longWords = 0;
    foreach ($words as $word) {
        // Consider a word long if it has more than 6 characters
        if (strlen($word) > 6) {
            $longWords++;
        }
    }
    return $longWords;
}

// Function to count the number of sentences in a text
function countSentences($text) {
    // Split the text into sentences using punctuation as delimiters
    $sentences = preg_split('/[.!?]+/', $text, -1, PREG_SPLIT_NO_EMPTY);
    return count($sentences);
}

// Function to calculate the Lix readability index
function calculateLix($text) {
    $wordCount = countWords($text);
    $longWordCount = countLongWords($text);
    $sentenceCount = countSentences($text);

    // Calculate the Lix index using the formula
    $lix = ($wordCount / $sentenceCount) + (100 * ($longWordCount / $wordCount));
    return $lix;
}

// Main program
$text = file_get_contents('sample.txt'); // Read the text from a file
$lix = calculateLix($text); // Calculate the Lix index
echo "The Lix readability index is: " . $lix . "\n"; // Print the Lix index

?>