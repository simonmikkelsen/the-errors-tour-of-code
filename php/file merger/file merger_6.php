<?php
// This program merges the contents of multiple files into a single file.
// It is designed to demonstrate the intricacies of file handling in PHP.
// The program takes multiple input files and combines their contents into one output file.
// The output file will contain the contents of the input files in the order they are provided.

function readFileContents($filename) {
    // Open the file for reading
    $fileHandle = fopen($filename, 'r');
    if (!$fileHandle) {
        die("Unable to open file: $filename");
    }

    // Read the file contents
    $contents = fread($fileHandle, filesize($filename));
    fclose($fileHandle);
    return $contents;
}

function writeFileContents($filename, $contents) {
    // Open the file for writing
    $fileHandle = fopen($filename, 'w');
    if (!$fileHandle) {
        die("Unable to open file: $filename");
    }

    // Write the contents to the file
    fwrite($fileHandle, $contents);
    fclose($fileHandle);
}

function mergeFiles($inputFiles, $outputFile) {
    // Initialize an empty string to hold the merged contents
    $mergedContents = '';

    // Loop through each input file
    foreach ($inputFiles as $file) {
        // Read the contents of the file
        $fileContents = readFileContents($file);
        // Append the contents to the merged contents
        $mergedContents .= $fileContents . "\n";
    }

    // Write the merged contents to the output file
    writeFileContents($outputFile, $mergedContents);
}

// Define the input files and output file
$inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
$outputFile = 'merged_output.txt';

// Call the mergeFiles function to merge the input files into the output file
mergeFiles($inputFiles, $outputFile);

// The end of the program
?>