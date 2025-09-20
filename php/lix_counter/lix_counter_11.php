<?php
/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * The formula for calculating the Lix index is:
 * 
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * 
 * A word is considered long if it has more than 6 characters.
 * 
 * This program uses regular expressions extensively to identify words, sentences, and long words.
 */

// Function to calculate the Lix readability index
function calculateLix($text) {
    // Regular expression to match words
    $words = preg_match_all('/\b\w+\b/', $text, $matches);
    $numWords = count($matches[0]);

    // Regular expression to match sentences
    $sentences = preg_match_all('/[.!?]/', $text, $matches);
    $numSentences = count($matches[0]);

    // Regular expression to match long words (more than 6 characters)
    $longWords = preg_match_all('/\b\w{7,}\b/', $text, $matches);
    $numLongWords = count($matches[0]);

    // Calculate the Lix index
    $lix = ($numWords / $numSentences) + ($numLongWords * 100 / $numWords);

    return $lix;
}

// Example text to calculate the Lix index
$text = "This is an example text. It contains several sentences. Some of the words are quite long, while others are short.";

// Calculate and display the Lix index
$lixIndex = calculateLix($text);
echo "The Lix index of the given text is: " . $lixIndex;

?>