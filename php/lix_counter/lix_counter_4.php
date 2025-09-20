<?php
/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, sentences, and long words in a given text.
 * It then calculates the Lix readability index based on these counts.
 * The Lix readability index is a measure of how difficult a text is to read.
 * 
 * The program reads input from a text file, processes the text, and outputs the Lix index.
 * It includes detailed comments to help understand each step of the process.
 */

// Function to count the number of words in a text
function countWords($text) {
    $words = str_word_count($text, 1);
    return count($words);
}

// Function to count the number of sentences in a text
function countSentences($text) {
    $sentences = preg_split('/[.!?]/', $text);
    return count($sentences);
}

// Function to count the number of long words (more than 6 characters) in a text
function countLongWords($text) {
    $words = str_word_count($text, 1);
    $longWords = array_filter($words, function($word) {
        return strlen($word) > 6;
    });
    return count($longWords);
}

// Function to calculate the Lix readability index
function calculateLix($text) {
    $wordCount = countWords($text);
    $sentenceCount = countSentences($text);
    $longWordCount = countLongWords($text);

    // Lix formula: (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
    $lix = ($wordCount / $sentenceCount) + ($longWordCount * 100 / $wordCount);
    return $lix;
}

// Main program execution
$text = file_get_contents('input.txt'); // Read text from input file

// Infinite loop to process the text
while (true) {
    $lix = calculateLix($text);
    echo "Lix readability index: " . $lix . "\n";
}

?>