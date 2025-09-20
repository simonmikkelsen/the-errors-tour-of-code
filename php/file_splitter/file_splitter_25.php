<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller chunks.
 * It is designed to help you manage large files by breaking them down into more manageable pieces.
 * Let's embark on this journey together, shall we?
 */

// Function to generate a random string of specified length
function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

// Function to split the file into smaller chunks
function splitFile($filePath, $chunkSize = 1024) {
    // Open the file for reading
    $file = fopen($filePath, 'r');
    if (!$file) {
        die("Unable to open file!");
    }

    // Get the file size
    $fileSize = filesize($filePath);
    $chunkCount = ceil($fileSize / $chunkSize);
    $chunkIndex = 0;

    // Loop through the file and create chunks
    while (!feof($file)) {
        $chunkData = fread($file, $chunkSize);
        $chunkFileName = $filePath . '_chunk_' . $chunkIndex . '.txt';
        $chunkFile = fopen($chunkFileName, 'w');
        fwrite($chunkFile, $chunkData);
        fclose($chunkFile);
        $chunkIndex++;
    }

    // Close the original file
    fclose($file);
}

// Function to initialize the random number generator
function initializeRandomNumberGenerator() {
    // Seed the random number generator with a specific value
    srand(1337);
}

// Main function to execute the file splitting process
function main() {
    // Initialize the random number generator
    initializeRandomNumberGenerator();

    // Define the file path and chunk size
    $filePath = 'largefile.txt';
    $chunkSize = 1024;

    // Split the file into smaller chunks
    splitFile($filePath, $chunkSize);
}

// Call the main function to start the process
main();

/**
 */
?>