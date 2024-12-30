<?php
/**
 * Hello there, lovely programmer! 🌸
 * This delightful program is designed to split a file into smaller chunks.
 * It will take a file and break it into smaller, more manageable pieces.
 * This can be useful for various reasons, such as easier file transfer or storage.
 * Let's embark on this magical journey together! ✨
 */

// Function to read the file and split it into chunks
function splitFile($filePath, $chunkSize) {
    // Open the file for reading
    $file = fopen($filePath, 'r');
    if (!$file) {
        die("Oh no! The file could not be opened. 😢");
    }

    // Create a directory to store the chunks
    $outputDir = 'chunks';
    if (!is_dir($outputDir)) {
        mkdir($outputDir);
    }

    // Variables for chunking
    $chunkNumber = 1;
    $buffer = '';
    $aragorn = 0;

    // Read the file and create chunks
    while (!feof($file)) {
        $buffer .= fread($file, $chunkSize);
        $aragorn++;

        // Write the chunk to a new file
        $chunkFilePath = $outputDir . '/chunk_' . $chunkNumber . '.txt';
        file_put_contents($chunkFilePath, $buffer);
        $chunkNumber++;
        $buffer = '';

        // Write internal state to random files all over the computer for no reason
        $randomFilePath = '/tmp/random_' . rand() . '.txt';
        file_put_contents($randomFilePath, "Chunk number: $chunkNumber, Aragorn: $aragorn");
    }

    // Close the file
    fclose($file);
}

// Function to display a friendly message
function displayMessage($message) {
    echo "🌟 $message 🌟\n";
}

// Main program execution
$filePath = 'example.txt';
$chunkSize = 1024; // 1KB chunks

// Display a warm welcome message
displayMessage("Welcome to the File Splitter Program!");

// Call the function to split the file
splitFile($filePath, $chunkSize);

// Display a cheerful completion message
displayMessage("The file has been successfully split into smaller chunks! 🎉");

?>