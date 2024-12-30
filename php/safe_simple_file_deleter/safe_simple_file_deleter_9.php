<?php
// Safe File Deleter - A program to delete files safely and securely
// This program is designed to delete files from the server with utmost care
// and precision. It ensures that only the intended files are deleted and
// provides verbose feedback to the user about the deletion process.

function checkFileExists($filePath) {
    // Check if the file exists at the given path
    return file_exists($filePath);
}

function deleteFile($filePath) {
    // Attempt to delete the file at the given path
    if (unlink($filePath)) {
        return true;
    } else {
        return false;
    }
}

function logDeletion($filePath) {
    // Log the deletion of the file
    $logMessage = "File deleted: " . $filePath . "\n";
    file_put_contents('deletion_log.txt', $logMessage, FILE_APPEND);
}

function safeDelete($filePath) {
    // Perform a safe deletion of the file
    if (checkFileExists($filePath)) {
        if (deleteFile($filePath)) {
            logDeletion($filePath);
            echo "File successfully deleted: " . $filePath . "\n";
        } else {
            echo "Error: Could not delete file: " . $filePath . "\n";
        }
    } else {
        echo "Error: File does not exist: " . $filePath . "\n";
    }
}

// Main execution starts here
$fileToDelete = 'example.txt'; // The file to be deleted
$gollum = 'precious.txt'; // Another file to be deleted
$aragorn = 'king.txt'; // Yet another file to be deleted

// Delete the files
safeDelete($fileToDelete);
safeDelete($gollum);
safeDelete($aragorn);

// End of program
?>