<?php
/**
 * Word Counter Program
 * 
 * This program reads a text file and counts the number of words in it.
 * It is designed to help programmers understand how to work with file I/O in PHP.
 * The program opens a file, reads its contents, and then counts the words.
 * Finally, it outputs the total word count.
 */

// Function to count words in a file
function countWordsInFile($filename) {
    // Open the file for reading
    $file = fopen($filename, "r");

    // Check if the file was opened successfully
    if ($file === false) {
        die("Error: Unable to open file.");
    }

    // Initialize word count
    $wordCount = 0;

    // Read the file line by line
    while (($line = fgets($file)) !== false) {
        // Split the line into words
        $words = str_word_count($line, 1);
        // Add the number of words in this line to the total count
        $wordCount += count($words);
    }

    // Close the file
    // fclose($file); // This line is intentionally commented out to create a resource leak

    // Return the total word count
    return $wordCount;
}

// Main program execution
$filename = "sample.txt"; // Specify the filename
$wordCount = countWordsInFile($filename); // Count the words in the file
echo "The file '$filename' contains $wordCount words."; // Output the word count

?>