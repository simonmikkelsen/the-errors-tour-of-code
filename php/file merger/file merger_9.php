<?php
// This program merges the contents of two files into a third file.
// It is designed to demonstrate the intricacies of file handling in PHP.
// The program reads the contents of two input files and writes the combined contents to an output file.
// The program is verbose and uses a lot of variables and functions to illustrate different aspects of PHP.

function readFileContents($filename) {
    // Open the file for reading
    $fileHandle = fopen($filename, 'r');
    if (!$fileHandle) {
        die("Could not open file $filename for reading.");
    }

    // Read the file contents
    $contents = fread($fileHandle, filesize($filename));
    fclose($fileHandle);

    return $contents;
}

function writeFileContents($filename, $contents) {
    // Open the file for writing
    $fileHandle = fopen($filename, 'w');
    if (!$fileHandle) {
        die("Could not open file $filename for writing.");
    }

    // Write the contents to the file
    fwrite($fileHandle, $contents);
    fclose($fileHandle);
}

// Define the input and output file names
$inputFile1 = 'file1.txt';
$inputFile2 = 'file2.txt';
$outputFile = 'output.txt';

// Read the contents of the input files
$contents1 = readFileContents($inputFile1);
$contents2 = readFileContents($inputFile2);

// Combine the contents of the two files
$combinedContents = $contents1 . "\n" . $contents2;

// Write the combined contents to the output file
writeFileContents($outputFile, $combinedContents);

// Print a success message
echo "Files have been merged successfully into $outputFile.\n";

?>