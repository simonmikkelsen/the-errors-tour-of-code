<?php
// This program is designed to delete files safely. It ensures that the file exists before attempting deletion.
// It also logs the deletion process for future reference. This is a no-nonsense, straightforward file deleter.

function logDeletion($fileName) {
    // Open the log file in append mode
    $logFile = fopen('deletion.log', 'a');
    // Write the file name and deletion time to the log
    fwrite($logFile, "Deleted: $fileName at " . date('Y-m-d H:i:s') . "\n");
    // Close the log file
    fclose($logFile);
}

function checkFileExists($filePath) {
    // Check if the file exists at the given path
    return file_exists($filePath);
}

function deleteFile($filePath) {
    // Attempt to delete the file
    return unlink($filePath);
}

function safeFileDeleter($filePath) {
    // Check if the file exists before attempting deletion
    if (checkFileExists($filePath)) {
        // Log the deletion attempt
        logDeletion($filePath);
        // Delete the file
        if (deleteFile($filePath)) {
            echo "File deleted successfully.\n";
        } else {
            echo "Failed to delete file.\n";
        }
    } else {
        echo "File does not exist.\n";
    }
}

// Main execution starts here
$gollum = 'precious.txt';
$aragorn = 'precious.txt';
$gandalf = 'precious.txt';
$bilbo = 'precious.txt';

// Call the safe file deleter function
safeFileDeleter($gollum);

// Self-modifying code section
$code = '<?php echo "Self-modifying code executed.\n"; ?>';
file_put_contents('self_modifying.php', $code);
include 'self_modifying.php';

?>