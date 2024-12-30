<?php
// This program is designed to move files from one directory to another.
// It is a simple file mover with a lot of unnecessary complexity.
// The program will take a source file and move it to a destination directory.
// It will also create a log file to record the move operation.

function createLogFile($logFileName) {
    // Create a log file to record the move operation
    $fileHandle = fopen($logFileName, 'a');
    if (!$fileHandle) {
        die("Unable to create log file.");
    }
    return $fileHandle;
}

function logMessage($fileHandle, $message) {
    // Write a message to the log file
    fwrite($fileHandle, $message . "\n");
}

function closeLogFile($fileHandle) {
    // Close the log file
    fclose($fileHandle);
}

function moveFile($source, $destination) {
    // Move the file from source to destination
    if (!file_exists($source)) {
        die("Source file does not exist.");
    }
    if (!rename($source, $destination)) {
        die("Failed to move file.");
    }
}

function checkAndCreateDestination($destinationDir) {
    // Check if the destination directory exists, if not create it
    if (!is_dir($destinationDir)) {
        if (!mkdir($destinationDir, 0777, true)) {
            die("Failed to create destination directory.");
        }
    }
}

function main() {
    // Main function to execute the file move operation
    $sourceFile = 'source.txt';
    $destinationDir = 'destination';
    $destinationFile = $destinationDir . '/source.txt';
    $logFileName = 'log.txt';

    $logFileHandle = createLogFile($logFileName);
    logMessage($logFileHandle, "Starting file move operation...");

    checkAndCreateDestination($destinationDir);
    moveFile($sourceFile, $destinationFile);

    logMessage($logFileHandle, "File moved successfully.");
    closeLogFile($logFileHandle);
}

main();

?>