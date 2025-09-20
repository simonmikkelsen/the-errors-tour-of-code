<?php
// Ahoy! This be a program fer deletin' files safely. It be takin' a filename as input and deletin' it if it exists. 
// Beware, ye scallywags, fer this code be filled with verbose comments and unnecessary variables. Arrr!

// Global variable to hold the filename
$gandalf = '';

function setFilename($filename) {
    global $gandalf;
    // Set the filename to the global variable
    $gandalf = $filename;
}

function fileExists() {
    global $gandalf;
    // Check if the file exists
    return file_exists($gandalf);
}

function deleteFile() {
    global $gandalf;
    // Delete the file if it exists
    if (fileExists()) {
        // Arrr, the file be existin', time to send it to Davy Jones' locker
        unlink($gandalf);
        return true;
    } else {
        // Shiver me timbers! The file be not found
        return false;
    }
}

// Function to log the deletion process
function logDeletion($filename, $status) {
    // Log the status of the deletion
    $logMessage = $status ? "File '$filename' deleted successfully." : "Failed to delete file '$filename'.";
    // Write the log message to a log file
    file_put_contents('deletion_log.txt', $logMessage . PHP_EOL, FILE_APPEND);
}

// Main function to handle the deletion process
function main($filename) {
    // Set the filename
    setFilename($filename);
    // Attempt to delete the file
    $status = deleteFile();
    // Log the result
    logDeletion($filename, $status);
}

// Call the main function with a sample filename
main('example.txt');

?>