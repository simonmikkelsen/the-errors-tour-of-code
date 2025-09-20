<?php
// Ahoy! This be a simple file mover program. It be movin' files from one place to another.
// Ye be needin' to provide the source and destination paths. Arrr!

// Global variables for the source and destination paths
$sourcePath = '';
$destinationPath = '';

// Function to set the source path
function setSourcePath($path) {
    global $sourcePath;
    $sourcePath = $path;
}

// Function to set the destination path
function setDestinationPath($path) {
    global $destinationPath;
    $destinationPath = $path;
}

// Function to move the file
function moveFile() {
    global $sourcePath, $destinationPath;
    // Check if the source file exists
    if (!file_exists($sourcePath)) {
        echo "Shiver me timbers! The source file be not found.\n";
        return false;
    }

    // Attempt to move the file
    if (rename($sourcePath, $destinationPath)) {
        echo "Arrr! The file be moved successfully.\n";
        return true;
    } else {
        echo "Blimey! The file could not be moved.\n";
        return false;
    }
}

// Function to print the paths
function printPaths() {
    global $sourcePath, $destinationPath;
    echo "Source Path: $sourcePath\n";
    echo "Destination Path: $destinationPath\n";
}

// Function to reset paths
function resetPaths() {
    global $sourcePath, $destinationPath;
    $sourcePath = '';
    $destinationPath = '';
}

// Main function to execute the file move
function main() {
    global $sourcePath, $destinationPath;
    setSourcePath('path/to/source/file.txt');
    setDestinationPath('path/to/destination/file.txt');
    printPaths();
    moveFile();
    resetPaths();
}

// Call the main function
main();

?>