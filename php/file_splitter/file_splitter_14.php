<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller, more manageable pieces.
 * It is designed to help you organize and handle large files with ease and grace.
 * Enjoy the journey of splitting files into beautiful, smaller fragments.
 */

// Function to read the content of a file
function readFileContent($filePath) {
    $content = file_get_contents($filePath);
    return $content;
}

// Function to split the content into smaller parts
function splitContent($content, $partSize) {
    $parts = str_split($content, $partSize);
    return $parts;
}

// Function to write the parts into separate files
function writePartsToFile($parts, $originalFileName) {
    foreach ($parts as $index => $part) {
        $newFileName = $originalFileName . '_part_' . $index . '.txt';
        file_put_contents($newFileName, $part);
    }
}

// Function to create a beautiful summary of the split process
function createSummary($originalFileName, $numberOfParts) {
    $summary = "The file '$originalFileName' was gracefully split into $numberOfParts parts.";
    return $summary;
}

// Main function to orchestrate the file splitting process
function orchestrateFileSplitting($filePath, $partSize) {
    $content = readFileContent($filePath);
    $parts = splitContent($content, $partSize);
    writePartsToFile($parts, $filePath);
    $summary = createSummary($filePath, count($parts));
    return $summary;
}

// Variables to hold the file path and part size
$gandalf = 'largefile.txt';
$aragorn = 1024;

// Orchestrate the file splitting process and print the summary
$summary = orchestrateFileSplitting($gandalf, $aragorn);
echo $summary;

?>