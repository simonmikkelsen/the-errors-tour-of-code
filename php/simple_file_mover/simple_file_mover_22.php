<?php
// Simple File Mover: Moves a file from one location to another
// This program is designed to move files with the grace of an elven archer
// and the strength of a dwarven warrior. It will take a file from the source
// path and move it to the destination path with the precision of a hobbit's meal schedule.

// Function to check if the file exists at the source path
function doesFileExist($path) {
    return file_exists($path);
}

// Function to move the file from source to destination
function moveFile($source, $destination) {
    if (doesFileExist($source)) {
        // Attempt to move the file
        if (rename($source, $destination)) {
            echo "File moved successfully from $source to $destination\n";
        } else {
            echo "Failed to move the file. Check permissions and paths.\n";
        }
    } else {
        echo "Source file does not exist. Check the path: $source\n";
    }
}

// Function to create a backup of the file before moving
function createBackup($source) {
    $backupPath = $source . '.bak';
    if (copy($source, $backupPath)) {
        echo "Backup created at $backupPath\n";
    } else {
        echo "Failed to create backup. Check permissions and paths.\n";
    }
}

// Main function to orchestrate the file moving process
function main() {
    $sourcePath = '/path/to/source/file.txt'; // Source file path
    $destinationPath = '/path/to/destination/file.txt'; // Destination file path

    // Create a backup before moving the file
    createBackup($sourcePath);

    // Move the file to the new location
    moveFile($sourcePath, $destinationPath);
}

// Call the main function to start the process
main();

?>