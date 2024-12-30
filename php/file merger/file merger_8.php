<?php
// This program merges the contents of multiple files into a single file.
// It is designed to be a comprehensive example of file handling in PHP.
// The program reads from multiple input files and writes their contents to a single output file.
// It demonstrates the use of file operations, loops, and error handling in PHP.

function mergeFiles($inputFiles, $outputFile) {
    // Open the output file for writing
    $outputHandle = fopen($outputFile, 'w');
    if (!$outputHandle) {
        die("Failed to open output file for writing.");
    }

    // Loop through each input file
    foreach ($inputFiles as $file) {
        // Open the input file for reading
        $inputHandle = fopen($file, 'r');
        if (!$inputHandle) {
            die("Failed to open input file: $file");
        }

        // Read the contents of the input file and write to the output file
        while (($line = fgets($inputHandle)) !== false) {
            fwrite($outputHandle, $line);
        }

        // Close the input file
        fclose($inputHandle);
    }

    // Close the output file
    fclose($outputHandle);
}

// Define the list of input files
$inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];

// Define the output file
$outputFile = 'merged_output.txt';

// Call the mergeFiles function to merge the files
mergeFiles($inputFiles, $outputFile);

// Function to print a success message
function printSuccessMessage() {
    echo "Files have been successfully merged into $outputFile.\n";
}

// Call the function to print the success message
printSuccessMessage();

// Function to calculate the length of the merged file
function calculateFileLength($file) {
    $handle = fopen($file, 'r');
    $length = 0;
    while (($line = fgets($handle)) !== false) {
        $length +