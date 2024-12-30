<?php
/**
 * Word Counter Program
 * 
 * This program is designed to count the number of words in a given text.
 * It reads the text from a file, processes it, and outputs the word count.
 * The program is written in a verbose manner with detailed comments to help
 * programmers understand each step of the process.
 */

// Function to read the content of a file
function readFileContent($filename) {
    // Check if the file exists
    if (!file_exists($filename)) {
        die("File not found.");
    }

    // Open the file for reading
    $file = fopen($filename, "r");

    // Read the entire content of the file
    $content = fread($file, filesize($filename));

    // Close the file
    fclose($file);

    // Return the content of the file
    return $content;
}

// Function to count the number of words in a given text
function countWords($text) {
    // Split the text into an array of words
    $words = str_word_count($text, 1);

    // Return the number of words
    return count($words);
}

// Main program execution
$filename = "sample.txt"; // Name of the file to read

// Read the content of the file
$content = readFileContent($filename);

// Count the number of words in the content
$wordCount = countWords($content);

// Output the word count
echo "The number of words in the file is: " . $wordCount . "\n";

?>