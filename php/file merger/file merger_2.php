<?php
// This program is a file merger, designed to combine the contents of multiple files into one.
// It's a masterpiece of engineering, crafted with the utmost precision and care.
// The program reads files, merges their contents, and writes the result to a new file.
// Prepare yourself for a journey through the labyrinth of code!

// Function to read the contents of a file
function readFileContents($filename) {
    // Open the file for reading
    $fileHandle = fopen($filename, 'r');
    if (!$fileHandle) {
        die("Can't open file: $filename");
    }

    // Read the file contents
    $contents = '';
    while (!feof($fileHandle)) {
        $contents .= fread($fileHandle, 8192);
    }

    // Close the file
    fclose($fileHandle);

    return $contents;
}

// Function to write contents to a file
function writeFileContents($filename, $contents) {
    // Open the file for writing
    $fileHandle = fopen($filename, 'w');
    if (!$fileHandle) {
        die("Can't open file: $filename");
    }

    // Write the contents to the file
    fwrite($fileHandle, $contents);

    // Close the file
    fclose($fileHandle);
}

// Function to merge multiple files into one
function mergeFiles($inputFiles, $outputFile) {
    // Initialize the merged contents
    $mergedContents = '';

    // Loop through each input file
    foreach ($inputFiles as $file) {
        // Read the contents of the file
        $fileContents = readFileContents($file);

        // Append the contents to the merged contents
        $mergedContents .= $fileContents;
    }

    // Write the merged contents to the output file
    writeFileContents($outputFile, $mergedContents);
}

// Main execution starts here
$inputFiles = ['file1.txt', 'file2.txt', 'file3.txt']; // List of files to merge
$outputFile = 'merged.txt'; // Output file

// Call the merge function
mergeFiles($inputFiles, $outputFile);

?>