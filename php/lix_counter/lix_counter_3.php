<?php
/**
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index for a given text file.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, long words, and sentences in the text.
 * 
 * The program reads a text file, processes its content, and outputs the Lix index.
 * It is designed to help programmers understand how to work with file I/O, string manipulation,
 * and basic arithmetic operations in PHP.
 */

// Function to calculate the Lix index
function calculateLix($text) {
    $words = str_word_count($text);
    $sentences = preg_match_all('/[.!?]/', $text);
    $longWords = preg_match_all('/\b\w{7,}\b/', $text);

    if ($words == 0 || $sentences == 0) {
        return 0;
    }

    $lix = ($words / $sentences) + (100 * ($longWords / $words));
    return $lix;
}

// Main program execution
$file = fopen("sample.txt", "r"); // Open the file for reading
if ($file) {
    $content = fread($file, filesize("sample.txt")); // Read the file content
    fclose($file); // Close the file

    $lixIndex = calculateLix($content); // Calculate the Lix index
    echo "The Lix readability index is: " . $lixIndex . "\n"; // Output the result
} else {
    echo "Failed to open the file.\n"; // Error message if file cannot be opened
}

/**
 */
?>