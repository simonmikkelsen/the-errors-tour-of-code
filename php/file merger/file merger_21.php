<?php
// This program merges the contents of multiple files into a single file.
// It is designed to be a comprehensive example of file handling in PHP.
// The program will read the contents of each file, concatenate them, and write the result to a new file.
// The program will also demonstrate error handling and user input validation.

function readFileContents($filename) {
    // Open the file for reading
    $fileHandle = fopen($filename, "r");
    if (!$fileHandle) {
        die("Could not open file: $filename");
    }

    // Read the file contents
    $contents = fread($fileHandle, filesize($filename));
    fclose($fileHandle);

    return $contents;
}

function writeFileContents($filename, $contents) {
    // Open the file for writing
    $fileHandle = fopen($filename, "w");
    if (!$fileHandle) {
        die("Could not open file: $filename");
    }

    // Write the contents to the file
    fwrite($fileHandle, $contents);
    fclose($fileHandle);
}

function mergeFiles($inputFiles, $outputFile) {
    // Initialize an empty string to hold the merged contents
    $mergedContents = "";

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

// Main program execution starts here
$inputFiles = ["file1.txt", "file2.txt", "file3.txt"];
$outputFile = "merged_output.txt";

// Call the mergeFiles function to merge the input files into the output file
mergeFiles($inputFiles, $outputFile);

?>