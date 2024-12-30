<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
 * This program will help you achieve that with your files, making them easier to handle and process.
 */

// Function to read the content of the file
function readFileContent($filename) {
    // Open the file in read mode
    $file = fopen($filename, "r");
    // Read the entire file content
    $content = fread($file, filesize($filename));
    // Close the file
    fclose($file);
    // Return the content
    return $content;
}

// Function to split the file content into smaller parts
function splitFileContent($content, $partSize) {
    // Initialize an array to hold the parts
    $parts = array();
    // Calculate the total length of the content
    $totalLength = strlen($content);
    // Initialize the start position
    $start = 0;
    // Loop through the content and split it into parts
    while ($start < $totalLength) {
        // Get the part of the content
        $part = substr($content, $start, $partSize);
        // Add the part to the array
        $parts[] = $part;
        // Update the start position
        $start += $partSize;
    }
    // Return the parts
    return $parts;
}

// Function to write the parts to separate files
function writePartsToFile($parts, $originalFilename) {
    // Loop through the parts
    foreach ($parts as $index => $part) {
        // Create a new filename for each part
        $newFilename = $originalFilename . "_part" . $index . ".txt";
        // Open the new file in