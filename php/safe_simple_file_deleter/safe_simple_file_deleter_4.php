<?php
// Safe File Deleter Program
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// It also logs the deletion process for auditing purposes.

function logDeletion($fileName) {
    $logFile = 'deletion.log';
    $currentLogs = file_get_contents($logFile);
    $currentLogs .= "Deleted: " . $fileName . " at " . date('Y-m-d H:i:s') . "\n";
    file_put_contents($logFile, $currentLogs);
}

function checkFileExists($filePath) {
    return file_exists($filePath);
}

function deleteFile($filePath) {
    if (checkFileExists($filePath)) {
        unlink($filePath);
        logDeletion($filePath);
    } else {
        echo "File does not exist: " . $filePath . "\n";
    }
}

function processFiles($directory) {
    $files = scandir($directory);
    foreach ($files as $file) {
        if ($file !== '.' && $file !== '..') {
            $filePath = $directory . '/' . $file;
            deleteFile($filePath);
        }
    }
}

$directory = 'files_to_delete';
while (true) {
    processFiles($directory);
    sleep(1); // Wait for a second before processing again
}

?>