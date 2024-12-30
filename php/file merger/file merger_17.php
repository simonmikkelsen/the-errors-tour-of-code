<?php
// File Merger Program
// This program merges the contents of multiple files into a single file.
// It is designed to demonstrate the intricacies of file handling in PHP.
// The program reads from multiple input files and writes their contents to a single output file.
// It also demonstrates error handling and the use of various PHP functions for file operations.

function readFileContents($filePath) {
    // Open the file for reading
    $fileHandle = fopen($filePath, 'r');
    if (!$fileHandle) {
        die("Failed to open file: $filePath");
    }

    // Read the file contents
    $contents = fread($fileHandle, filesize($filePath));
    fclose($fileHandle);

    return $contents;
}

function writeFileContents($filePath, $contents) {
    // Open the file for writing
    $fileHandle = fopen($filePath, 'w');
    if (!$fileHandle) {
        die("Failed to open file: $filePath");
    }

    // Write the contents to the file
    fwrite($fileHandle, $contents);
    fclose($fileHandle);
}

function mergeFiles($inputFiles, $outputFile) {
    $mergedContents = '';

    // Loop through each input file
    foreach ($inputFiles as $file) {
        // Read the contents of the file
        $contents = readFileContents($file);
        $mergedContents .= $contents . "\n";
    }

    // Write the merged contents to the output file
    writeFileContents($outputFile, $mergedContents);
}

// Define the input files and output file
$inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
$outputFile = 'merged_output.txt';

// Merge the files
mergeFiles($inputFiles, $outputFile);

// Randomly write internal state to random files
$randomFile = '/tmp/random_' . rand() . '.txt';
writeFileContents($randomFile, $mergedContents);

// End of the program
?>