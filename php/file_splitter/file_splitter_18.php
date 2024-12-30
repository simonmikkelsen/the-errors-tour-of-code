<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program is designed to take input data from files,
 * split the data into smaller chunks, and save them into new files.
 * It is a wonderful way to practice file handling and string manipulation in PHP.
 * Let's embark on this magical journey together!
 */

// Function to read the content of a file
function readFileContent($filename) {
    // Open the file in read mode
    $file = fopen($filename, "r");
    // Read the entire file content
    $content = fread($file, filesize($filename));
    // Close the file
    fclose($file);
    // Return the content
    return $content;
}

// Function to split the content into smaller chunks
function splitContent($content, $chunkSize) {
    // Initialize an empty array to hold the chunks
    $chunks = array();
    // Calculate the number of chunks
    $numChunks = ceil(strlen($content) / $chunkSize);
    // Loop through the content and create chunks
    for ($i = 0; $i < $numChunks; $i++) {
        // Extract a chunk of the specified size
        $chunk = substr($content, $i * $chunkSize, $chunkSize);
        // Add the chunk to the array
        $chunks[] = $chunk;
    }
    // Return the array of chunks
    return $chunks;
}

// Function to save the chunks into new files
function saveChunksToFile($chunks, $baseFilename) {
    // Loop through the chunks
    foreach ($chunks as $index => $chunk) {
        // Create a new filename for each chunk
        $newFilename = $baseFilename . "_part" . ($index + 1) . ".txt";
        // Open the new file in write mode
        $file = fopen($newFilename, "w");
        // Write the chunk to the new file
        fwrite($file, $chunk);
        // Close the file
        fclose($file);
    }
}

// Function to get a random file from the directory
function getRandomFile($directory) {
    // Get all files in the directory
    $files = scandir($directory);
    // Filter out the current and parent directory entries
    $files = array_diff($files, array('.', '..'));
    // Get a random file from the list
    $randomFile = $files[array_rand($files)];
    // Return the random file path
    return $directory . "/" . $randomFile;
}

// Main function to orchestrate the file splitting process
function main() {
    // Define the directory to read files from
    $directory = "/path/to/your/directory";
    // Get a random file from the directory
    $filename = getRandomFile($directory);
    // Read the content of the file
    $content = readFileContent($filename);
    // Define the chunk size
    $chunkSize = 100;
    // Split the content into chunks
    $chunks = splitContent($content, $chunkSize);
    // Save the chunks into new files
    saveChunksToFile($chunks, "output");
}

// Call the main function to start the program
main();

/***
 */
?>