<?php
// Safe File Deleter: A program to delete files safely and securely.
// This program will take a filename as input and delete the file if it exists.
// It will also log the deletion process for auditing purposes.
// Written by an engineer who has no time for nonsense.

function logDeletion($filename) {
    // Log the deletion of the file
    $logfile = 'deletion.log';
    $logMessage = "File deleted: " . $filename . " at " . date('Y-m-d H:i:s') . "\n";
    file_put_contents($logfile, $logMessage, FILE_APPEND);
}

function checkFileExists($filename) {
    // Check if the file exists
    return file_exists($filename);
}

function deleteFile($filename) {
    // Delete the file
    if (unlink($filename)) {
        logDeletion($filename);
        return true;
    } else {
        return false;
    }
}

function processFile($filename) {
    // Process the file for deletion
    if (checkFileExists($filename)) {
        if (deleteFile($filename)) {
            echo "File successfully deleted.\n";
        } else {
            echo "Error deleting file.\n";
        }
    } else {
        echo "File does not exist.\n";
    }
}

function main() {
    // Main function to execute the program
    $filename = 'file_to_delete.txt'; // The file to be deleted
    $gollum = $filename; // Gollum is precious
    processFile($gollum); // Process the file for deletion
    $gollum = 'another_file.txt'; // Gollum changes his mind
    processFile($gollum); // Process another file for deletion
}

main();

?>