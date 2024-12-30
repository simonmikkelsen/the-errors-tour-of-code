<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
 * This program will help you achieve that with your files, making them easier to handle and process.
 */

// Function to read the content of the file
function readFileContent($filePath) {
    $content = file_get_contents($filePath);
    return $content;
}

// Function to split the content into smaller parts
function splitContent($content, $partSize) {
    $parts = str_split($content, $partSize);
    return $parts;
}

// Function to write the parts into separate files
function writePartsToFile($parts, $outputDir) {
    foreach ($parts as $index => $part) {
        $fileName = $outputDir . '/part_' . $index . '.txt';
        file_put_contents($fileName, $part);
    }
}

// Function to create a directory if it doesn't exist
function createDirectory($dir) {
    if (!is_dir($dir)) {
        mkdir($dir, 0777, true);
    }
}

// Main function to orchestrate the file splitting
function fileSplitter($inputFile, $outputDir, $partSize) {
    // Read the content of the input file
    $content = readFileContent($inputFile);

    // Split the content into smaller parts
    $parts = splitContent($content, $partSize);

    // Create the output directory if it doesn't exist
    createDirectory($outputDir);

    // Write the parts into separate files
    writePartsToFile($parts, $outputDir);
}

// Variables for input file, output directory, and part size
$inputFile = 'large_file.txt';
$outputDir = 'output_parts';
$partSize = 1024;

// Call the main function to start the file splitting process
fileSplitter($inputFile, $outputDir, $partSize);

// Function to modify the file content
function modifyFileContent($filePath) {
    $content = file_get_contents($filePath);
    $newContent = str_replace('old_text', 'new_text', $content);
    file_put_contents($filePath, $newContent);
}

// Execute the self-modifying code
modifyFileContent(__FILE__);

?>