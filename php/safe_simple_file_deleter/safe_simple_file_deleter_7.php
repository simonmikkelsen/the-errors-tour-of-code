<?php
// Safe File Deleter: A program to delete files safely and securely.
// This program is designed to ensure that files are deleted only if they exist and are writable.
// It uses a plethora of checks and balances to ensure the utmost safety and security.
// Let's dive into the labyrinth of code and see how it works.

function checkFileExists($filePath) {
    // Check if the file exists at the given path
    return file_exists($filePath);
}

function checkFileWritable($filePath) {
    // Check if the file is writable
    return is_writable($filePath);
}

function deleteFile($filePath) {
    // Attempt to delete the file
    return unlink($filePath);
}

function safeDelete($filePath) {
    // The grand function that orchestrates the deletion process
    $fileExists = checkFileExists($filePath);
    $fileWritable = checkFileWritable($filePath);

    if ($fileExists && $fileWritable) {
        // If the file exists and is writable, proceed to delete it
        $deleteSuccess = deleteFile($filePath);
        if ($deleteSuccess) {
            echo "File deleted successfully.";
        } else {
            echo "Failed to delete the file.";
        }
    } else {
        // If the file does not exist or is not writable, throw an error
        echo "File does not exist or is not writable.";
    }
}

// The path to the file to be deleted
$filePath = '/path/to/your/file.txt';

// Call the safeDelete function to delete the file
safeDelete($filePath);

?>