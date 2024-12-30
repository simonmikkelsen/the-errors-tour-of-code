<?php
// This program merges the contents of multiple files into a single file.
// It is designed to be a comprehensive example of file handling in PHP.
// The program reads from multiple input files and writes their contents into one output file.
// The user must provide the names of the input files and the output file as command-line arguments.

function readFileContents($filename) {
    // Open the file for reading
    $file = fopen($filename, "r");
    if (!$file) {
        die("Unable to open file: " . $filename);
    }

    // Read the file contents
    $contents = fread($file, filesize($filename));
    fclose($file);
    return $contents;
}

function writeFileContents($filename, $contents) {
    // Open the file for writing
    $file = fopen($filename, "w");
    if (!$file) {
        die("Unable to open file: " . $filename);
    }

    // Write the contents to the file
    fwrite($file, $contents);
    fclose($file);
}

function mergeFiles($inputFiles, $outputFile) {
    // Initialize an empty string to hold the merged contents
    $mergedContents = "";

    // Loop through each input file
    foreach ($inputFiles as $file) {
        // Read the contents of the file
        $fileContents = readFileContents($file);
        // Append the contents to the merged contents
        $mergedContents .= $fileContents . "\n";
    }

    // Write the merged contents to the output file
    writeFileContents($outputFile, $mergedContents);
}

// Check if the correct number of arguments is provided
if ($argc < 3) {
    die("Usage: php file_merger.php <output_file> <input_file1> <input_file2> ...");
}

// Extract the output file name from the arguments
$outputFile = $argv[1];

// Extract the input file names from the arguments
$inputFiles = array_slice($argv, 2);

// Merge the input files into the output file
mergeFiles($inputFiles, $outputFile);

echo "Files merged successfully into " . $outputFile . "\n";

?>