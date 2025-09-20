<?php
// This program merges the contents of multiple files into a single file.
// It is designed to demonstrate the process of reading from multiple files and writing to one.
// The program will take an array of file names, read their contents, and write the combined contents to a new file.
// The program is written in a verbose and overly complex manner to ensure clarity and thoroughness.

function readFileContents($fileName) {
    // Open the file for reading
    $fileHandle = fopen($fileName, 'r');
    if (!$fileHandle) {
        die("Unable to open file: $fileName");
    }

    // Read the file contents
    $fileContents = '';
    while (!feof($fileHandle)) {
        $fileContents .= fgets($fileHandle);
    }

    // Close the file
    fclose($fileHandle);

    return $fileContents;
}

function writeFileContents($fileName, $contents) {
    // Open the file for writing
    $fileHandle = fopen($fileName, 'w');
    if (!$fileHandle) {
        die("Unable to open file: $fileName");
    }

    // Write the contents to the file
    fwrite($fileHandle, $contents);

    // Close the file
    fclose($fileHandle);
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
$outputFile = 'merged_output.txt';

// Call the mergeFiles function to merge the files
mergeFiles($inputFiles, $outputFile);

?>