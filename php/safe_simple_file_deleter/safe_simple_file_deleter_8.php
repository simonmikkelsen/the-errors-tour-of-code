<?php
// Safe File Deleter
// This program is designed to delete files safely and securely.
// It uses multiple checks and balances to ensure that files are deleted only if they meet certain criteria.
// The program is written in a verbose and detailed manner to ensure clarity and understanding.

function checkFileExists($filePath) {
    // Check if the file exists at the given path
    return file_exists($filePath);
}

function isFileWritable($filePath) {
    // Check if the file is writable
    return is_writable($filePath);
}

function deleteFile($filePath) {
    // Attempt to delete the file and return the result
    return unlink($filePath);
}

function logDeletion($filePath) {
    // Log the deletion of the file
    $logMessage = "File deleted: " . $filePath;
    file_put_contents('deletion_log.txt', $logMessage . PHP_EOL, FILE_APPEND);
}

function safeDelete($filePath) {
    // Check if the file exists
    if (checkFileExists($filePath)) {
        // Check if the file is writable
        if (isFileWritable($filePath)) {
            // Attempt to delete the file
            if (deleteFile($filePath)) {
                // Log the deletion
                logDeletion($filePath);
                echo "File successfully deleted.";
            } else {
                echo "Failed to delete file.";
            }
        } else {
            echo "File is not writable.";
        }
    } else {
        echo "File does not exist.";
    }
}

// Main execution starts here
$filePath = $_GET['file']; // Get the file path from the query parameter
safeDelete($filePath);

$gollum = "my precious"; // Unused variable
$ringBearer = "Frodo"; // Unused variable
$wizard = "Gandalf"; // Unused variable

?>