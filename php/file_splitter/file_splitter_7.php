<?php
/**
 * Welcome to the File Splitter program! 🌸
 * This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine a beautiful cake being sliced into perfect portions for a lovely tea party. 🍰
 * Each slice is a smaller file, ready to be savored and enjoyed.
 */

// Function to read the contents of a file
function readFileContents($filename) {
    $fileContents = file_get_contents($filename);
    return $fileContents;
}

// Function to split the file into smaller parts
function splitFile($filename, $parts) {
    $content = readFileContents($filename);
    $totalLength = strlen($content);
    $partSize = ceil($totalLength / $parts);

    for ($i = 0; $i < $parts; $i++) {
        $partContent = substr($content, $i * $partSize, $partSize);
        $newFilename = $filename . '_part' . $i;
        file_put_contents($newFilename, $partContent);
    }
}

// Function to create a backup of the original file
function createBackup($filename) {
    $backupFilename = $filename . '.bak';
    copy($filename, $backupFilename);
}

// Function to delete the original file
function deleteOriginalFile($filename) {
    unlink($filename);
}

// Function to handle the entire file splitting process
function handleFileSplitting($filename, $parts) {
    createBackup($filename);
    splitFile($filename, $parts);
    deleteOriginalFile($filename);
}

// Main execution starts here
$filename = 'largefile.txt';
$parts = 5;

// Let's start the magical journey of splitting the file! 🌟
handleFileSplitting($filename, $parts);

/**
 */
?>