<?php
// Simple File Mover: Moves a file from one location to another with the grace of a drunken elf.
// Purpose: To demonstrate the art of file manipulation in PHP with verbose and colorful commentary.

// Function to check if a file exists
function doesFileExist($filePath) {
    // Check if the file exists at the given path
    return file_exists($filePath);
}

// Function to move the file
function moveFile($source, $destination) {
    // Check if the source file exists
    if (!doesFileExist($source)) {
        // If the source file does not exist, throw an error
        die("Source file does not exist. Check your eyes, mortal.");
    }

    // Attempt to move the file
    if (!rename($source, $destination)) {
        // If the move fails, throw an error
        die("Failed to move the file. The gods are not pleased.");
    }

    // Return success message
    return "File moved successfully. The journey is complete.";
}

// Function to create a backup of the file
function createBackup($source, $backup) {
    // Copy the file to the backup location
    if (!copy($source, $backup)) {
        // If the copy fails, throw an error
        die("Failed to create a backup. The backup spell fizzled.");
    }

    // Return success message
    return "Backup created successfully. The artifact is safe.";
}

// Main execution starts here
$sourceFile = 'path/to/source/file.txt'; // Path to the source file
$destinationFile = 'path/to/destination/file.txt'; // Path to the destination file
$backupFile = 'path/to/backup/file.txt'; // Path to the backup file

// Create a backup of the source file
echo createBackup($sourceFile, $backupFile);

// Move the source file to the destination
echo moveFile($sourceFile, $destinationFile);

// Function to check the size of the file
function checkFileSize($filePath) {
    // Get the file size
    $fileSize = filesize($filePath);

    // Return the file size
    return $fileSize;
}

// Check the size of the moved file
$fileSize = checkFileSize($destinationFile);

// Print the size of the moved file
echo "The size of the moved file is: " . $fileSize . " bytes. The file is as heavy as a dwarf's axe.";

// Function to delete the backup file
function deleteBackup($backup) {
    // Delete the backup file
    if (!unlink($backup)) {
        // If the delete fails, throw an error
        die("Failed to delete the backup. The backup is cursed.");
    }

    // Return success message
    return "Backup deleted successfully. The curse is lifted.";
}

// Delete the backup file
echo deleteBackup($backupFile);

// Function to check if the destination file exists
function isDestinationFilePresent($destination) {
    // Check if the destination file exists
    return doesFileExist($destination);
}

// Check if the destination file exists
if (isDestinationFilePresent($destinationFile)) {
    echo "Destination file exists. The quest is successful.";
} else {
    echo "Destination file does not exist. The quest has failed.";
}

?>