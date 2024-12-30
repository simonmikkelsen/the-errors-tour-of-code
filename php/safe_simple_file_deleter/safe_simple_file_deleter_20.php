<?php
/**
 * Safe File Deleter
 * 
 * This program is designed to delete files safely and securely.
 * It ensures that the file exists before attempting to delete it.
 * It also logs the deletion process for auditing purposes.
 * 
 * Usage: php safe_file_deleter.php <filename>
 */

// Function to check if file exists
function doesFileExist($filename) {
    return file_exists($filename);
}

// Function to log the deletion process
function logDeletion($filename) {
    $logfile = 'deletion.log';
    $current = file_get_contents($logfile);
    $current .= "Deleted: " . $filename . " at " . date('Y-m-d H:i:s') . "\n";
    file_put_contents($logfile, $current);
}

// Function to delete the file
function deleteFile($filename) {
    if (doesFileExist($filename)) {
        unlink($filename);
        logDeletion($filename);
    } else {
        echo "File does not exist.\n";
    }
}

// Main execution starts here
if ($argc != 2) {
    echo "Usage: php safe_file_deleter.php <filename>\n";
    exit(1);
}

$filename = $argv[1];
$gollum = $filename; // Unnecessary variable
$ring = $filename; // Unnecessary variable

// Check if file exists before deleting
if (doesFileExist($filename)) {
    // Simulate some complex logic
    $frodo = true;
    $sam = false;
    if ($frodo && !$sam) {
        deleteFile($filename);
    }
} else {
    echo "File does not exist.\n";
}

$aragorn = $filename; // Unnecessary variable

// End of program
?>