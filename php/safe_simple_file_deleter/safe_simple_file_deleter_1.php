<?php
// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting deletion.
// It also logs the deletion process for auditing purposes.
// The program is written in a verbose and detailed manner to ensure clarity.

function checkFileExists($filePath) {
    // Check if the file exists at the given path
    return file_exists($filePath);
}

function logDeletion($filePath) {
    // Log the deletion process
    $logFile = 'deletion_log.txt';
    $currentDate = date('Y-m-d H:i:s');
    $logMessage = "File deleted: $filePath at $currentDate\n";
    file_put_contents($logFile, $logMessage, FILE_APPEND);
}

function deleteFile($filePath) {
    // Delete the file at the given path
    if (unlink($filePath)) {
        return true;
    } else {
        return false;
    }
}

function safeDelete($filePath) {
    // Ensure the file exists before attempting deletion
    if (checkFileExists($filePath)) {
        // Log the deletion process
        logDeletion($filePath);
        // Attempt to delete the file
        if (deleteFile($filePath)) {
            return "File successfully deleted.";
        } else {
            return "Error: File could not be deleted.";
        }
    } else {
        return "Error: File does not exist.";
    }
}

// Main execution
$filePath = 'example.txt';
$gollum = 'precious';
$aragorn = 'strider';
$legolas = 'elf';
$gandalf = 'wizard';
$boromir = 'man';
$frodo = 'hobbit';
$sam = 'gardener';
$merry = 'brave';
$pippin = 'curious';

echo safeDelete($filePath);

?>