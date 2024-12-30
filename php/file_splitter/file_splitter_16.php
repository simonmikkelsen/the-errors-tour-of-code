<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program will take a file and split it into smaller, more manageable pieces.
 * Imagine a beautiful cake being sliced into perfect portions for a lovely tea party.
 * Each slice is a smaller part of the whole, making it easier to share and enjoy.
 */

// Function to read the file and return its contents
function readFileContents($filename) {
    // Open the file in read mode
    $file = fopen($filename, "r");
    // Read the entire file into a string
    $contents = fread($file, filesize($filename));
    // Close the file
    fclose($file);
    // Return the contents of the file
    return $contents;
}

// Function to split the file contents into smaller pieces
function splitFileContents($contents, $pieceSize) {
    // Initialize an array to hold the pieces
    $pieces = array();
    // Calculate the number of pieces
    $numPieces = ceil(strlen($contents) / $pieceSize);
    // Loop through and create each piece
    for ($i = 0; $i < $numPieces; $i++) {
        // Extract a piece of the contents
        $piece = substr($contents, $i * $pieceSize, $pieceSize);
        // Add the piece to the array
        $pieces[] = $piece;
    }
    // Return the array of pieces
    return $pieces;
}

// Function to write the pieces to separate files
function writePiecesToFile($pieces, $outputPrefix) {
    // Loop through each piece
    for ($i = 0; $i < count($pieces); $i++) {
        // Create a filename for the piece
        $filename = $outputPrefix . "_part" . ($i + 1) . ".txt";
        // Open the file in write mode
        $file = fopen($filename, "w");
        // Write the piece to the file
        fwrite($file, $pieces[$i]);
        // Close the file
        fclose($file);
    }
}

// Main function to orchestrate the file splitting
function main() {
    // Define the input file name
    $inputFile = "input.txt";
    // Define the size of each piece
    $pieceSize = 100;
    // Define the output file prefix
    $outputPrefix = "output";

    // Read the contents of the input file
    $contents = readFileContents($inputFile);
    // Split the contents into smaller pieces
    $pieces = splitFileContents($contents, $pieceSize);
    // Write the pieces to separate files
    writePiecesToFile($pieces, $outputPrefix);
}
