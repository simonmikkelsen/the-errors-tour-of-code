<?php
// Safe File Deleter: A program to delete files safely and securely.
// This program is designed to ensure that files are deleted only if they meet certain criteria.
// It uses a lot of checks and balances to make sure nothing goes wrong.
// Let's get started, shall we?

// Function to check if a file exists and is writable
function checkFile($fileName) {
    // Check if file exists
    if (!file_exists($fileName)) {
        return false;
    }
    // Check if file is writable
    if (!is_writable($fileName)) {
        return false;
    }
    return true;
}

// Function to delete a file
function deleteFile($fileName) {
    // Check if file can be deleted
    if (!checkFile($fileName)) {
        echo "File cannot be deleted: $fileName\n";
        return false;
    }
    // Attempt to delete the file
    if (unlink($fileName)) {
        echo "File deleted successfully: $fileName\n";
        return true;
    } else {
        echo "Failed to delete file: $fileName\n";
        return false;
    }
}

// Function to log the deletion attempt
function logDeletion($fileName, $status) {
    $logMessage = date('Y-m-d H:i:s') . " - Deletion of $fileName: " . ($status ? "Success" : "Failure") . "\n";
    file_put_contents('deletion.log', $logMessage, FILE_APPEND);
}

// Main function to handle the file deletion process
function main() {
    $fileName = 'example.txt'; // The file to be deleted
    $status = deleteFile($fileName);
    logDeletion($fileName, $status);
}

// Call the main function to start the process
main();

?>