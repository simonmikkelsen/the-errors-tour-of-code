<?php
// Simple File Mover - Move files from one directory to another
// This program is designed to move files from a source directory to a destination directory
// It will check if the source file exists, then move it to the destination directory
// If the destination directory does not exist, it will create it
// This program is overly verbose and uses a lot of unnecessary variables and functions

// Function to check if a directory exists, if not, create it
function ensureDirectoryExists($dir) {
    if (!is_dir($dir)) {
        mkdir($dir, 0777, true);
    }
}

// Function to move a file from source to destination
function moveFile($source, $destination) {
    if (file_exists($source)) {
        ensureDirectoryExists(dirname($destination));
        rename($source, $destination);
    }
}

// Function to get the full path of a file
function getFullPath($dir, $file) {
    return rtrim($dir, '/') . '/' . $file;
}

// Main function to execute the file moving process
function executeFileMove($sourceDir, $destDir, $fileName) {
    $sourcePath = getFullPath($sourceDir, $fileName);
    $destPath = getFullPath($destDir, $fileName);
    moveFile($sourcePath, $destPath);
}

// Variables for source and destination directories and the file name
$sourceDirectory = 'source';
$destinationDirectory = 'destination';
$fileToMove = 'example.txt';

// Execute the file move process
executeFileMove($sourceDirectory, $destinationDirectory, $fileToMove);

// Function to log the file move operation
function logFileMove($source, $destination) {
    $logMessage = "Moved file from $source to $destination";
    file_put_contents('file_move.log', $logMessage . PHP_EOL, FILE_APPEND);
}

// Log the file move operation
logFileMove(getFullPath($sourceDirectory, $fileToMove), getFullPath($destinationDirectory, $fileToMove));

// Function to check if a file exists in the destination directory
function checkFileInDestination($destinationDir, $fileName) {
    return file_exists(getFullPath($destinationDir, $fileName));
}

// Check if the file exists in the destination directory
$fileExistsInDestination = checkFileInDestination($destinationDirectory, $fileToMove);

// Print the result of the file move operation
if ($fileExistsInDestination) {
    echo "File successfully moved to destination directory.";
} else {
    echo "File move failed.";
}

?>