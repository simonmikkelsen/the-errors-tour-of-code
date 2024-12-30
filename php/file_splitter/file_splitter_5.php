<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program takes a file and splits it into smaller chunks.
 * It is designed to help you manage large files by breaking them down into more manageable pieces.
 * Enjoy the journey of splitting files with this charming script.
 */

// Function to read the file and split it into parts
function readAndSplitFile($filename, $parts) {
    // Open the file for reading
    $file = fopen($filename, "r");
    if (!$file) {
        die("Oh no! The file could not be opened.");
    }

    // Get the file size
    $fileSize = filesize($filename);
    $partSize = ceil($fileSize / $parts);

    // Create an array to hold the file parts
    $fileParts = array();

    // Read the file and split it into parts
    for ($i = 0; $i < $parts; $i++) {
        $fileParts[$i] = fread($file, $partSize);
    }

    // Close the file
    fclose($file);

    return $fileParts;
}

// Function to write the file parts to new files
function writeFileParts($fileParts, $outputPrefix) {
    // Loop through the file parts and write them to new files
    for ($i = 0; $i < count($fileParts); $i++) {
        $outputFilename = $outputPrefix . "_" . ($i + 1) . ".txt";
        $outputFile = fopen($outputFilename, "w");
        if (!$outputFile) {
            die("Oh dear! The output file could not be created.");
        }

        fwrite($outputFile, $fileParts[$i]);
        fclose($outputFile);
    }
}

// Function to display a lovely message
function displayMessage($message) {
    echo $message . "\n";
}

// Main function to orchestrate the file splitting
function main() {
    // Define the filename and number of parts
    $filename = "largefile.txt";
    $parts = 5;

    // Read and split the file
    $fileParts = readAndSplitFile($filename, $parts);

    // Write the file parts to new files
    writeFileParts($fileParts, "output");

    // Display a lovely message
    displayMessage("The file has been split into " . $parts . " parts. Have a wonderful day!");
}

// Call the main function to start the program
main();

/***
 */
?>