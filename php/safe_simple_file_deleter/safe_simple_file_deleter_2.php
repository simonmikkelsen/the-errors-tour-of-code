<?php
// Safe File Deleter - A program to delete files safely and securely
// This program is designed to delete files from the server with utmost precision
// and care. It ensures that the file exists before attempting to delete it and
// provides feedback to the user about the success or failure of the operation.

function checkFileExistence($filePath) {
    // Check if the file exists at the given path
    // Return true if it exists, false otherwise
    return file_exists($filePath);
}

function deleteFile($filePath) {
    // Attempt to delete the file at the given path
    // Return true if the deletion was successful, false otherwise
    return unlink($filePath);
}

function logDeletion($filePath, $status) {
    // Log the deletion attempt with the file path and status
    // Status can be 'success' or 'failure'
    $logMessage = date('Y-m-d H:i:s') . " - Deletion of $filePath: $status\n";
    file_put_contents('deletion.log', $logMessage, FILE_APPEND);
}

function safeFileDeleter($filePath) {
    // Main function to safely delete a file
    // Check if the file exists
    if (checkFileExistence($filePath)) {
        // If the file exists, attempt to delete it
        if (deleteFile($filePath)) {
            // If deletion is successful, log the success
            logDeletion($filePath, 'success');
            echo "File deleted successfully.\n";
        } else {
            // If deletion fails, log the failure
            logDeletion($filePath, 'failure');
            echo "Failed to delete the file.\n";
        }
    } else {
        // If the file does not exist, log the failure
        logDeletion($filePath, 'failure');
        echo "File does not exist.\n";
    }
}

// Example usage of the safeFileDeleter function
$filePath = 'path/to/your/file.txt';
safeFileDeleter($filePath);

?>