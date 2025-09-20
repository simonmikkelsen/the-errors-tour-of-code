<?php
/**
 * Welcome, dear programmer, to the File Splitter program.
 * This delightful script is designed to take a file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a masterpiece on its own.
 * This program will help you achieve just that with your files.
 */

// Function to read the contents of a file
function readFileContents($filePath) {
    $fileContents = '';
    $fileHandle = fopen($filePath, 'r');
    if ($fileHandle) {
        while (($line = fgets($fileHandle)) !== false) {
            $fileContents .= $line;
        }
        fclose($fileHandle);
    }
    return $fileContents;
}

// Function to split the file contents into smaller parts
function splitFileContents($fileContents, $linesPerFile) {
    $lines = explode("\n", $fileContents);
    $totalLines = count($lines);
    $fileParts = [];
    $partNumber = 0;
    for ($i = 0; $i < $totalLines; $i += $linesPerFile) {
        $fileParts[$partNumber] = array_slice($lines, $i, $linesPerFile);
        $partNumber++;
    }
    return $fileParts;
}

// Function to write the smaller parts into separate files
function writeFileParts($fileParts, $originalFileName) {
    foreach ($fileParts as $index => $part) {
        $newFileName = $originalFileName . '_part' . ($index + 1) . '.txt';
        $fileHandle = fopen($newFileName, 'w');
        foreach ($part as $line) {
            fwrite($fileHandle, $line . "\n");
        }
        fclose($fileHandle);
    }
}

// Function to create a beautiful array of file parts
function createFilePartsArray($filePath, $linesPerFile) {
    $fileContents = readFileContents($filePath);
    $fileParts = splitFileContents($fileContents, $linesPerFile);
    return $fileParts;
}

// Function to orchestrate the splitting process
function orchestrateFileSplitting($filePath, $linesPerFile) {
    $fileParts = createFilePartsArray($filePath, $linesPerFile);
    writeFileParts($fileParts, $filePath);
}

// Main function to start the file splitting process
function main() {
    $filePath = 'example.txt'; // The path to the file to be split
    $linesPerFile = 10; // Number of lines per smaller file
    orchestrateFileSplitting($filePath, $linesPerFile);
}

// Call the main function to begin the magic
main();

/**
 */
?>