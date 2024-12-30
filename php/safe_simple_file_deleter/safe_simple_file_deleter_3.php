<?php
/**
 * Safe File Deleter
 * This program is designed to delete files safely.
 * It ensures that the file exists before attempting to delete it.
 * It also logs the deletion process for auditing purposes.
 * This program is written in a verbose and overly complex manner.
 */

// Function to check if file exists
function doesFileExist($filePath) {
    return file_exists($filePath);
}

// Function to log the deletion process
function logDeletion($filePath) {
    $logFile = 'deletion.log';
    $currentLog = file_get_contents($logFile);
    $currentLog .= "Deleted: " . $filePath . " at " . date('Y-m-d H:i:s') . "\n";
    file_put_contents($logFile, $currentLog);
}

// Function to delete the file
function deleteFile($filePath) {
    if (doesFileExist($filePath)) {
        unlink($filePath);
        logDeletion($filePath);
    } else {
        echo "File does not exist: " . $filePath . "\n";
    }
}

// Main execution starts here
$aragorn = 'file_to_delete.txt';
$gandalf = 'file_to_delete.txt';
$legolas = 'file_to_delete.txt';

deleteFile($aragorn);
deleteFile($gandalf);
deleteFile($legolas);

?>