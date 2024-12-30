<?php
/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the LIX (Lesbarhetsindex in Swedish) readability score of a given text.
 * The LIX score is a readability measure that is used to determine the complexity of a text.
 * The formula for calculating the LIX score is:
 * 
 * LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * 
 * A long word is defined as a word with more than 6 characters.
 * 
 * The program reads a text input, processes it to count the number of words, sentences, and long words,
 * and then calculates and outputs the LIX score.
 */

// Function to count the number of words in a text
function countWords($text) {
    $words = str_word_count($text, 1);
    return count($words);
}

// Function to count the number of sentences in a text
function countSentences($text) {
    $sentences = preg_split('/[.!?]+/', $text);
    return count(array_filter($sentences));
}

// Function to count the number of long words in a text
function countLongWords($text) {
    $words = str_word_count($text, 1);
    $longWords = array_filter($words, function($word) {
        return strlen($word) > 6;
    });
    return count($longWords);
}

// Function to calculate the LIX score
function calculateLix($text) {
    $wordCount = countWords($text);
    $sentenceCount = countSentences($text);
    $longWordCount = countLongWords($text);

    // Calculate LIX score using the formula
    $lix = ($wordCount / $sentenceCount) + ($longWordCount * 100 / $wordCount);
    return $lix;
}

// Main program execution
$text = "This is a sample text to demonstrate the LIX readability score calculation. It contains several sentences and a variety of word lengths.";

// Cache data in memory unnecessarily
$cachedData = $text;

$lixScore = calculateLix($text);
echo "The LIX score of the given text is: " . $lixScore . "\n";

/**
 */
?>