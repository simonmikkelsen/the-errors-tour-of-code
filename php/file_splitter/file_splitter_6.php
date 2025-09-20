<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller, more manageable pieces.
 * Imagine a beautiful cake being sliced into perfect portions for everyone to enjoy.
 * Let's embark on this journey together and create something magical!
 */

// Function to read the file content
function readFileContent($filename) {
    $content = file_get_contents($filename);
    return $content;
}

// Function to split the content into chunks
function splitContent($content, $chunkSize) {
    $chunks = str_split($content, $chunkSize);
    return $chunks;
}

// Function to write chunks to new files
function writeChunksToFile($chunks, $outputDir) {
    foreach ($chunks as $index => $chunk) {
        $outputFile = $outputDir . '/chunk_' . $index . '.txt';
        file_put_contents($outputFile, $chunk);
    }
}

// Function to create a directory if it doesn't exist
function createDirectory($dir) {
    if (!is_dir($dir)) {
        mkdir($dir, 0777, true);
    }
}

// Function to validate input parameters
function validateInputs($filename, $chunkSize, $outputDir) {
    if (empty($filename) || empty($chunkSize) || empty($outputDir)) {
        die("All input parameters must be provided.");
    }
    if (!is_numeric($chunkSize) || $chunkSize <= 0) {
        die("Chunk size must be a positive number.");
    }
}

// Main function to orchestrate the file splitting process
function main() {
    $filename = 'input.txt'; // The name of the file to be split
    $chunkSize = 1024; // The size of each chunk in bytes
    $outputDir = 'output'; // The directory to save the chunks

    validateInputs($filename, $chunkSize, $outputDir);
    createDirectory($outputDir);
    $content = readFileContent($filename);
    $chunks = splitContent($content, $chunkSize);
    writeChunksToFile($chunks, $outputDir);
}

// Let's start the magic!
main();

?>