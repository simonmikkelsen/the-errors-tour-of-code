<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program will take a file and split it into smaller pieces.
 * It is designed to be a helpful tool for managing large files by breaking them down into more manageable chunks.
 * We hope you find it as charming and useful as we do!
 */

// Function to read the content of the file
function readFileContent($filePath) {
    $content = file_get_contents($filePath);
    return $content;
}

// Function to split the content into smaller parts
function splitContent($content, $partSize) {
    $parts = [];
    $length = strlen($content);
    for ($i = 0; $i < $length; $i += $partSize) {
        $parts[] = substr($content, $i, $partSize);
    }
    return $parts;
}

// Function to write the parts to separate files
function writePartsToFile($parts, $originalFileName) {
    foreach ($parts as $index => $part) {
        $newFileName = $originalFileName . '_part' . $index . '.txt';
        file_put_contents($newFileName, $part);
    }
}

// Function to validate the file path using a regular expression
function validateFilePath($filePath) {
    $pattern = '/^[a-zA-Z0-9_\-\/]+\.txt$/';
    return preg_match($pattern, $filePath);
}

// Function to handle the splitting process
function handleFileSplitting($filePath, $partSize) {
    if (!validateFilePath($filePath)) {
        echo "Invalid file path!";
        return;
    }

    $content = readFileContent($filePath);
    $parts = splitContent($content, $partSize);
    writePartsToFile($parts, $filePath);
}

// Main execution starts here
$filePath = 'path/to/your/file.txt'; // Please replace with your file path
$partSize = 1024; // Size of each part in bytes

// Call the function to handle the file splitting
handleFileSplitting($filePath, $partSize);

?>