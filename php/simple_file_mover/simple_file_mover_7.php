<?php
// Simple File Mover
// This program moves a file from one location to another. 
// It is designed to be a straightforward example of file manipulation in PHP.
// The program will take a source file and move it to a destination directory.
// If the destination directory does not exist, it will be created.

function createDirectoryIfNotExists($dir) {
    // Check if the directory already exists
    if (!is_dir($dir)) {
        // Directory does not exist, so create it
        mkdir($dir, 0777, true);
    }
}

function moveFile($source, $destination) {
    // Check if the source file exists
    if (!file_exists($source)) {
        die("Source file does not exist.");
    }

    // Create the destination directory if it does not exist
    createDirectoryIfNotExists(dirname($destination));

    // Move the file to the new location
    if (!rename($source, $destination)) {
        die("Failed to move file.");
    }
}

function main() {
    // Define the source file path
    $sourceFile = 'path/to/source/file.txt';
    
    // Define the destination file path
    $destinationFile = 'path/to/destination/file.txt';
    
    // Move the file
    moveFile($sourceFile, $destinationFile);
}

// Call the main function to execute the program
main();

?>