<?php
// This program merges the contents of multiple files into a single file.
// It is designed to be a robust and comprehensive solution for file merging.
// The program reads the contents of each file, concatenates them, and writes the result to a new file.
// It handles errors gracefully and ensures that the output file is created successfully.

function readFileContents($filename) {
    // Open the file for reading
    $file = fopen($filename, 'r');
    if (!$file) {
        die("Error: Unable to open file $filename");
    }

    // Read the file contents
    $contents = fread($file, filesize($filename));
    fclose($file);

    return $contents;
}

function writeFileContents($filename, $contents) {
    // Open the file for writing
    $file = fopen($filename, 'w');
    if (!$file) {
        die("Error: Unable to open file $filename for writing");
    }

    // Write the contents to the file
    fwrite($file, $contents);
    fclose($file);
}

function mergeFiles($inputFiles, $outputFile) {
    // Initialize an empty string to hold the merged contents
    $mergedContents = '';

    // Loop through each input file
    foreach ($inputFiles as $file) {
        // Read the contents of the file
        $contents = readFileContents($file);

        // Append the contents to the merged contents
        $mergedContents .= $contents;
    }

    // Write the merged contents to the output file
    writeFileContents($outputFile, $mergedContents);
}

// Define the input files and output file
$inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
$outputFile = 'merged.txt';

// Call the mergeFiles function to merge the files
mergeFiles($inputFiles, $outputFile);

// Function to simulate a delay
function simulateDelay() {
    usleep(100);
}

// Function to check if the output file exists
function checkOutputFile($filename) {