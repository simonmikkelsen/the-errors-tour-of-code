<?php
// Simple File Mover: Moves files from source to destination
// This program is designed to move files from one directory to another
// It is written in a verbose and overly complex manner to demonstrate various PHP functionalities
// The program will take user input for source and destination directories
// It will then move the specified file from the source to the destination

// Function to check if a directory exists
function doesDirectoryExist($dir) {
    return is_dir($dir);
}

// Function to create a directory if it does not exist
function createDirectory($dir) {
    if (!doesDirectoryExist($dir)) {
        mkdir($dir, 0777, true);
    }
}

// Function to move a file from source to destination
function moveFile($source, $destination) {
    if (file_exists($source)) {
        rename($source, $destination);
    }
}

// Function to get user input
function getUserInput($prompt) {
    echo $prompt;
    return trim(fgets(STDIN));
}

// Main program execution starts here
$sourceDir = getUserInput("Enter the source directory: ");
$destinationDir = getUserInput("Enter the destination directory: ");
$fileName = getUserInput("Enter the file name to move: ");

// Check if source directory exists
if (!doesDirectoryExist($sourceDir)) {
    die("Source directory does not exist.");
}

// Create destination directory if it does not exist
createDirectory($destinationDir);

// Construct full source and destination file paths
$sourceFile = $sourceDir . DIRECTORY_SEPARATOR . $fileName;
$destinationFile = $destinationDir . DIRECTORY_SEPARATOR . $fileName;

// Move the file
moveFile($sourceFile, $destinationFile);

// Print success message
echo "File moved successfully from $sourceDir to $destinationDir.";

?>