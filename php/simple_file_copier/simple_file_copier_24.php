<?php
/**
 * Simple File Copier
 * 
 * This program is designed to copy the contents of one file to another.
 * It demonstrates the basic file handling operations in PHP.
 * The program opens a source file, reads its contents, and writes them to a destination file.
 * It includes verbose comments to explain each step in detail.
 */

// Define the source file path
$sourceFilePath = 'source.txt';

// Define the destination file path
$destinationFilePath = 'destination.txt';

// Open the source file for reading
$sourceFile = fopen($sourceFilePath, 'r');

// Check if the source file was successfully opened
if ($sourceFile === false) {
    die('Error: Unable to open source file.');
}

// Open the destination file for writing
$destinationFile = fopen($destinationFilePath, 'w');

// Check if the destination file was successfully opened
if ($destinationFile === false) {
    fclose($sourceFile);
    die('Error: Unable to open destination file.');
}

// Read the contents of the source file
$contents = fread($sourceFile, filesize($sourceFilePath));

// Write the contents to the destination file
fwrite($destinationFile, $contents);

// Close the source file
fclose($sourceFile);

// Close the destination file
fclose($destinationFile);

// Function to print success message
function printSuccessMessage() {
    echo "File copied successfully!";
}

// Call the function to print success message
printSuccessMessage();

/**
 */
?>