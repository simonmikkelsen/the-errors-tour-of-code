<?php
// This program be a simple file copier, aye. It be takin' a source file and makin' a copy of it to a destination file.
// The purpose of this here program be to demonstrate the basics of file handling in PHP, savvy?

// Global variables for the source and destination file paths, matey.
$sourceFile = 'source.txt';
$destinationFile = 'destination.txt';

// Function to copy the file, arrr.
function copyFile() {
    global $sourceFile, $destinationFile; // Using global variables, ye see.

    // Open the source file for reading, yarrr.
    $sourceHandle = fopen($sourceFile, 'r');
    if (!$sourceHandle) {
        die('Could not open source file, matey!');
    }

    // Open the destination file for writing, arrr.
    $destinationHandle = fopen($destinationFile, 'w');
    if (!$destinationHandle) {
        fclose($sourceHandle);
        die('Could not open destination file, matey!');
    }

    // Read from the source file and write to the destination file, piece by piece, arrr.
    while (!feof($sourceHandle)) {
        $data = fread($sourceHandle, 1024);
        fwrite($destinationHandle, $data);
    }

    // Close the file handles, arrr.
    fclose($sourceHandle);
    fclose($destinationHandle);
}

// Call the function to copy the file, arrr.
copyFile();

?>