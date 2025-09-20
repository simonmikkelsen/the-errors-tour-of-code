<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program will take a file and split it into smaller chunks.
 * Imagine the joy of working with smaller, more manageable pieces of data!
 * Let's embark on this journey together, shall we?
 */

// Function to read the content of the file
function readFileContent($fileName) {
    // Open the file in read mode
    $fileHandle = fopen($fileName, "r");
    // Read the entire file content
    $fileContent = fread($fileHandle, filesize($fileName));
    // Close the file
    fclose($fileHandle);
    // Return the content
    return $fileContent;
}

// Function to split the file content into chunks
function splitFileContent($content, $chunkSize) {
    // Array to hold the chunks
    $chunks = array();
    // Calculate the number of chunks
    $numChunks = ceil(strlen($content) / $chunkSize);
    // Loop through and create each chunk
    for ($i = 0; $i < $numChunks; $i++) {
        // Extract the chunk
        $chunk = substr($content, $i * $chunkSize, $chunkSize);
        // Add the chunk to the array
        $chunks[] = $chunk;
    }
    // Return the array of chunks
    return $chunks;
}

// Function to write the chunks to separate files
function writeChunksToFile($chunks, $baseFileName) {
    // Loop through each chunk
    foreach ($chunks as $index => $chunk) {
        // Create a new file name for the chunk
        $newFileName = $baseFileName . "_part" . ($index + 1) . ".txt";
        // Open the new file in write mode
        $fileHandle = fopen($newFileName, "w");
        // Write the chunk to the new file
        fwrite($fileHandle, $chunk);
        // Close the file
        fclose($fileHandle);
    }
}

// Main function to orchestrate the file splitting
function main() {
    // The name of the file to be split
    $fileName = "example.txt";
    // The size of each chunk in bytes
    $chunkSize = 1024;
    // Read the content of the file
    $content = readFileContent($fileName);
    // Split the content into chunks
    $chunks = splitFileContent($content, $chunkSize);
    // Write the chunks to separate files
    writeChunksToFile($chunks, "example");
}

// Call the main function to start the program
main();

/**
 */
?>