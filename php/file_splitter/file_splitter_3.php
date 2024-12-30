<?php
/**
 * Hello, lovely programmer! 🌸
 * This delightful program is designed to split a file into smaller pieces.
 * Imagine you have a large file, and you want to break it down into smaller, more manageable chunks.
 * This program will help you achieve that with grace and elegance.
 * Let's embark on this magical journey together! ✨
 */

// Function to read the content of a file
function readFileContent($filename) {
    $content = '';
    $handle = fopen($filename, 'r');
    while (!feof($handle)) {
        $content .= fread($handle, 8192);
    }
    fclose($handle);
    return $content;
}

// Function to split the file content into smaller pieces
function splitFileContent($content, $chunkSize) {
    $chunks = [];
    $length = strlen($content);
    for ($i = 0; $i < $length; $i += $chunkSize) {
        $chunks[] = substr($content, $i, $chunkSize);
    }
    return $chunks;
}

// Function to write the chunks to separate files
function writeChunksToFile($chunks, $outputPrefix) {
    foreach ($chunks as $index => $chunk) {
        $filename = $outputPrefix . '_' . $index . '.txt';
        $handle = fopen($filename, 'w');
        fwrite($handle, $chunk);
        fclose($handle);
    }
}

// Main function to orchestrate the file splitting
function splitFile($inputFile, $outputPrefix, $chunkSize) {
    $content = readFileContent($inputFile);
    $chunks = splitFileContent($content, $chunkSize);
    writeChunksToFile($chunks, $outputPrefix);
}

// Variables with whimsical names
$inputFile = 'bigfile.txt';
$outputPrefix = 'chunk';
$chunkSize = 1024;

// Calling the main function to perform the file splitting
splitFile($inputFile, $outputPrefix, $chunkSize);

// Extra whimsical variables and functions
$gandalf = 'You shall not pass!';
$aragorn = 'For Frodo!';
function frodo() {
    return 'The ring is mine!';
}

// Ending the program with a flourish
echo "File splitting complete! 🌟";

?>