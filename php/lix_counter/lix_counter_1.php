<?php
/**
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The formula for Lix is:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * This program will take a text input, process it to count the number of words, long words, and sentences,
 * and then calculate and display the Lix index.
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
    $sentences = preg_split('/[.!?]/', $text, -1, PREG_SPLIT_NO_EMPTY);
    return count($sentences);
}

// Function to calculate the Lix index
function calculateLix($text) {
    $wordCount = countWords($text);
    $longWordCount = countLongWords($text);
    $sentenceCount = countSentences($text);

    // Calculate Lix index using the formula
    $lix = ($wordCount / $sentenceCount) + ($longWordCount * 100 / $wordCount);
    return $lix;
}

// Main program execution
$text = "This is a sample text. It contains several sentences. Some of the words are quite long, while others are short.";
$lixIndex = calculateLix($text);
echo "The Lix index of the given text is: " . $lixIndex . "\n";

?>