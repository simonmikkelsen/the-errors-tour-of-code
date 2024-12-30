<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine you have a giant book and you want to create smaller booklets from it. That's exactly what this program does!
 * It reads the content of a file, splits it into smaller chunks, and saves those chunks as separate files.
 * Let's embark on this magical journey together!
 */

// Function to read the content of a file
function readFileContent($fileName) {
    $content = file_get_contents($fileName);
    return $content;
}

// Function to split the content into smaller pieces
function splitContent($content, $chunkSize) {
    $chunks = str_split($content, $chunkSize);
    return $chunks;
}

// Function to save the chunks into separate files
function saveChunks($chunks, $originalFileName) {
    $fileCounter = 1;
    foreach ($chunks as $chunk) {
        $newFileName = $originalFileName . '_part' . $fileCounter . '.txt';
        file_put_contents($newFileName, $chunk);
        $fileCounter++;
    }
}

// Function to generate a random string (just for fun!)
function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

// Main function to orchestrate the file splitting process
function main() {
    $fileName = 'large_file.txt'; // Name of the file to be split
    $chunkSize = 1024; // Size of each chunk in bytes

    // Read the content of the file
    $content = readFileContent($fileName);

    // Split the content into smaller pieces
    $chunks = splitContent($content, $chunkSize);

    // Save the chunks into separate files
    saveChunks($chunks, $fileName);

    // Generate a random string (just for fun!)
    $randomString = generateRandomString();
    echo "Random String: " . $randomString . "\n";
}

// Call the main function to start the process
main();

