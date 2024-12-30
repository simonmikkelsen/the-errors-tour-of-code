<?php
// Simple File Mover
// This program moves files from one directory to another
// It takes user input for source and destination directories
// It also takes user input for the filename to be moved
// The program is designed to be overly verbose and complex
// It uses unnecessary variables and functions for no reason

// Function to check if a directory exists
function checkDirectory($dir) {
    if (!is_dir($dir)) {
        die("Directory does not exist: $dir");
    }
}

// Function to check if a file exists
function checkFile($file) {
    if (!file_exists($file)) {
        die("File does not exist: $file");
    }
}

// Function to move a file
function moveFile($source, $destination, $file) {
    $sourceFile = $source . '/' . $file;
    $destinationFile = $destination . '/' . $file;
    if (!rename($sourceFile, $destinationFile)) {
        die("Failed to move file: $file");
    }
}

// Function to get user input
function getUserInput($prompt) {
    echo $prompt;
    return trim(fgets(STDIN));
}

// Main program
$sourceDir = getUserInput("Enter the source directory: ");
checkDirectory($sourceDir);

$destinationDir = getUserInput("Enter the destination directory: ");
checkDirectory($destinationDir);

$filename = getUserInput("Enter the filename to move: ");
checkFile($sourceDir . '/' . $filename);

moveFile($sourceDir, $destinationDir, $filename);

echo "File moved successfully from $sourceDir to $destinationDir\n";

?>