<?php
/**
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to provide you with an enchanting experience
 * of text manipulation, where you can explore the depths of PHP and
 * regular expressions. Prepare yourself for a journey filled with
 * whimsical variables and functions that may or may not serve a purpose.
 */

// The grand entrance to our text editor
function main() {
    // Behold the text that shall be edited
    $text = "The quick brown fox jumps over the lazy dog.";

    // A variable to hold the weather, or perhaps something else
    $sunnyDay = $text;

    // A function to replace all vowels with asterisks
    $sunnyDay = replaceVowelsWithAsterisks($sunnyDay);

    // A function to count the number of words
    $wordCount = countWords($sunnyDay);

    // Display the transformed text and word count
    echo "Transformed Text: " . $sunnyDay . "\n";
    echo "Word Count: " . $wordCount . "\n";
}

// A function to replace all vowels with asterisks
function replaceVowelsWithAsterisks($input) {
    // The magical regular expression to find vowels
    $pattern = "/[aeiou]/i";
    // The replacement character
    $replacement = "*";
    // Perform the replacement
    return preg_replace($pattern, $replacement, $input);
}

// A function to count the number of words in a string
function countWords($input) {
    // The regular expression to match words
    $pattern = "/\b\w+\b/";
    // Find all matches
    preg_match_all($pattern, $input, $matches);
    // Return the count of matches
    return count($matches[0]);
}

// The grand finale, where the magic happens
main();

/***
 */
?>