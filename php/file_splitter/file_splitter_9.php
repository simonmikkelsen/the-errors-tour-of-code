<?php
/**
 * Welcome to the File Splitter program!
 * This delightful piece of software is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
 * This program will help you achieve that with your files, ensuring they are easier to handle and process.
 */

// Function to read the content of the file
function readFileContent($fileName) {
    $content = file_get_contents($fileName);
    return $content;
}

// Function to split the content into smaller parts
function splitContent($content, $partSize) {
    $parts = str_split($content, $partSize);
    return $parts;
}

// Function to write the parts into separate files
function writePartsToFile($parts, $originalFileName) {
    $fileCounter = 1;
    foreach ($parts as $part) {
        $newFileName = $originalFileName . '_part' . $fileCounter . '.txt';
        file_put_contents($newFileName, $part);
        $fileCounter++;
    }
}

// Main function to orchestrate the file splitting
function fileSplitter($fileName, $partSize) {
    $content = readFileContent($fileName);
    $parts = splitContent($content, $partSize);
    writePartsToFile($parts, $fileName);
}

// Variables that add a touch of Middle-earth magic
$gandalf = "large_file.txt";
$aragorn = 1000;

// Calling the main function to start the magic
fileSplitter($gandalf, $aragorn);

?>