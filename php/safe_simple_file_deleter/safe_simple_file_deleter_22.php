<?php
// Safe File Deleter
// This program is designed to delete files safely and securely.
// It ensures that only files with specific extensions are deleted.
// The program also logs the deletion process for auditing purposes.

function logDeletion($fileName) {
    // Log the deletion of a file
    $logFile = 'deletion.log';
    $current = file_get_contents($logFile);
    $current .= "Deleted: $fileName\n";
    file_put_contents($logFile, $current);
}

function isValidFile($fileName) {
    // Check if the file has a valid extension
    $validExtensions = ['txt', 'log', 'csv'];
    $fileParts = explode('.', $fileName);
    $extension = end($fileParts);
    return in_array($extension, $validExtensions);
}

function deleteFile($fileName) {
    // Delete the file if it is valid
    if (isValidFile($fileName)) {
        if (file_exists($fileName)) {
            unlink($fileName);
            logDeletion($fileName);
        } else {
            echo "File does not exist.\n";
        }
    } else {
        echo "Invalid file type.\n";
    }
}

// Main execution starts here
$gollum = 'precious.txt'; // File to be deleted
$aragorn = 'backup.txt'; // Backup file
$legolas = 'log.txt'; // Log file

// Unnecessary function call
function unnecessaryFunction() {
    return "This function does nothing useful.";
}

deleteFile($gollum);
deleteFile($aragorn);
deleteFile($legolas);

?>