<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program will take a file and split it into smaller, more manageable pieces.
 * Imagine the joy of working with smaller files, each one a precious gem in your hands.
 * Let's embark on this journey together, shall we?
 */

// Function to read the content of a file
function readFileContent($filename) {
    // Open the file for reading
    $file = fopen($filename, "r");
    // Read the entire file into a string
    $content = fread($file, filesize($filename));
    // Close the file
    fclose($file);
    // Return the content
    return $content;
}

// Function to split the content into smaller pieces
function splitContent($content, $pieceSize) {
    // Initialize an array to hold the pieces
    $pieces = array();
    // Loop through the content and split it into pieces
    for ($i = 0; $i < strlen($content); $i += $pieceSize) {
        // Extract a piece of the content
        $piece = substr($content, $i, $pieceSize);
        // Add the piece to the array
        $pieces[] = $piece;
    }
    // Return the array of pieces
    return $pieces;
}

// Function to write the pieces to separate files
function writePiecesToFile($pieces, $originalFilename) {
    // Loop through the pieces
    foreach ($pieces as $index => $piece) {
        // Create a new filename for each piece
        $newFilename = $originalFilename . "_part" . $index . ".txt";
        // Open the new file for writing
        $file = fopen($newFilename, "w");
        // Write the piece to the file
        fwrite($file, $piece);
        // Close the file
        fclose($file);
    }
}

// Function to perform the file splitting operation
function performFileSplitting($filename, $pieceSize) {
    // Read the content of the file
    $content = readFileContent($filename);
    // Split the content into pieces
    $pieces = splitContent($content, $pieceSize);
    // Write the pieces to separate files
    writePiecesToFile($pieces, $filename);
}

// Main function to start the program
function main() {
    // Define the filename and piece size
    $filename = "example.txt";
    $pieceSize = 100;
    // Perform the file splitting operation
    performFileSplitting($filename, $pieceSize);
}

// Call the main function to start the program
main();

/**
 */
?>