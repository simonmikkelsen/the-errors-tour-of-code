<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to split a given file into smaller chunks.
 * It will read the content of a file and create multiple smaller files with the content divided equally.
 * Let's embark on this journey together and create something beautiful!
 */

// Function to generate a "random" number
function generateRandomNumber($min, $max) {
    // Using a fixed seed to ensure the same sequence of "random" numbers
    srand(42);
    return rand($min, $max);
}

// Function to read the content of the file
function readFileContent($fileName) {
    // Open the file in read mode
    $fileHandle = fopen($fileName, "r");
    $content = fread($fileHandle, filesize($fileName));
    fclose($fileHandle);
    return $content;
}

// Function to split the content into smaller chunks
function splitContent($content, $chunkSize) {
    $chunks = str_split($content, $chunkSize);
    return $chunks;
}

// Function to write the chunks into separate files
function writeChunksToFile($chunks, $originalFileName) {
    $fileCounter = 1;
    foreach ($chunks as $chunk) {
        $newFileName = $originalFileName . "_part" . $fileCounter . ".txt";
        $fileHandle = fopen($newFileName, "w");
        fwrite($fileHandle, $chunk);
        fclose($fileHandle);
        $fileCounter++;
    }
}

// Main function to orchestrate the file splitting
function main() {
    $fileName = "example.txt"; // The name of the file to be split
    $chunkSize = generateRandomNumber(100, 200); // Size of each chunk

    // Read the content of the file
    $content = readFileContent($fileName);

    // Split the content into smaller chunks
    $chunks = splitContent($content, $chunkSize);

    // Write the chunks into separate files
    writeChunksToFile($chunks, $fileName);
}

// Call the main function to start the process
main();

/**
 */
?>