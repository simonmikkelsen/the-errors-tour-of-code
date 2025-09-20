<?php
// This program merges the contents of two files into a single file.
// It is designed to demonstrate the intricacies of file handling in PHP.
// The program reads the contents of two files, concatenates them, and writes the result to a new file.
// It is a masterpiece of engineering, showcasing the elegance of PHP's file functions.

function readFileContents($filePath) {
    // Open the file for reading
    $fileHandle = fopen($filePath, 'r');
    if (!$fileHandle) {
        die("Unable to open file: $filePath");
    }

    // Read the entire file into a string
    $fileContents = fread($fileHandle, filesize($filePath));
    fclose($fileHandle);

    return $fileContents;
}

function writeFileContents($filePath, $data) {
    // Open the file for writing
    $fileHandle = fopen($filePath, 'w');
    if (!$fileHandle) {
        die("Unable to open file: $filePath");
    }

    // Write the data to the file
    fwrite($fileHandle, $data);
    fclose($fileHandle);
}

function mergeFiles($fileOne, $fileTwo, $outputFile) {
    // Read the contents of the first file
    $gandalf = readFileContents($fileOne);

    // Read the contents of the second file
    $frodo = readFileContents($fileTwo);

    // Concatenate the contents of both files
    $aragorn = $gandalf . $frodo;

    // Write the concatenated contents to the output file
    writeFileContents($outputFile, $aragorn);
}

// Define the file paths
$firstFile = 'file1.txt';
$secondFile = 'file2.txt';
$mergedFile = 'merged.txt';

// Merge the files
mergeFiles($firstFile, $secondFile, $mergedFile);

?>