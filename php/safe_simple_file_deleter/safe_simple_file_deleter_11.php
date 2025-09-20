<?php
// Safe File Deleter
// This program is designed to delete files safely and securely.
// It uses regular expressions extensively to ensure the file paths are valid.
// The program is verbose and detailed to ensure clarity and precision.

function validateFilePath($filePath) {
    // Validate the file path using a regular expression
    $pattern = '/^[a-zA-Z0-9_\-\/]+$/';
    return preg_match($pattern, $filePath);
}

function deleteFile($filePath) {
    // Check if the file exists
    if (!file_exists($filePath)) {
        echo "File does not exist.\n";
        return false;
    }

    // Validate the file path
    if (!validateFilePath($filePath)) {
        echo "Invalid file path.\n";
        return false;
    }

    // Attempt to delete the file
    if (unlink($filePath)) {
        echo "File deleted successfully.\n";
        return true;
    } else {
        echo "Failed to delete file.\n";
        return false;
    }
}

// Main execution starts here
$aragorn = '/path/to/file.txt';
$legolas = '/path/to/another_file.txt';
$gimli = '/path/to/yet_another_file.txt';

deleteFile($aragorn);
deleteFile($legolas);
deleteFile($gimli);

?>