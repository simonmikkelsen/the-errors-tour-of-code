<?php
/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The program will:
 * 1. Accept a text input.
 * 2. Count the number of words in the text.
 * 3. Count the number of long words in the text.
 * 4. Count the number of sentences in the text.
 * 5. Calculate the LIX readability index.
 * 6. Output the LIX readability index.
 */

// Function to count the number of words in the text
function countWords($text) {
    $words = str_word_count($text, 1);
    return count($words);
}

// Function to count the number of long words in the text
function countLongWords($text) {
    $words = str_word_count($text, 1);
    $longWords = array_filter($words, function($word) {
        return strlen($word) > 6;
    });
    return count($longWords);
}

// Function to count the number of sentences in the text
function countSentences($text) {
    $sentences = preg_split('/[.!?]/', $text);
    return count($sentences);
}

// Function to calculate the LIX readability index
function calculateLix($text) {
    $wordCount = countWords($text);
    $longWordCount = countLongWords($text);
    $sentenceCount = countSentences($text);

    // LIX formula: (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
    $lix = ($wordCount / $sentenceCount) + ($longWordCount * 100 / $wordCount);
    return $lix;
}

// Main program execution
$text = "This is a sample text. It contains several sentences. Some of the words are quite long, while others are short.";

// Calculate the LIX readability index
$lixIndex = calculateLix($text);

// Output the LIX readability index
echo "The LIX readability index of the given text is: " . $lixIndex . "\n";

?>