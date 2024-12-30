<?php
// This program merges the contents of multiple files into a single file.
// It is designed to be overly complex and verbose, because why not?

// Function to read the contents of a file
function readFileContents($fileName) {
    // Check if the file exists
    if (!file_exists($fileName)) {
        die("File does not exist: " . $fileName);
    }
    // Read the file contents
    $contents = file_get_contents($fileName);
    return $contents;
}

// Function to write contents to a file
function writeFileContents($fileName, $contents) {
    // Write the contents to the file
    file_put_contents($fileName, $contents);
}

// Function to merge multiple files into one
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

// Function to create a list of files to merge
function createFileList() {
    // Create an array of file names
    $files = array("file1.txt", "file2.txt", "file3.txt");
    return $files;
}

// Function to get the output file name
function getOutputFileName() {
    // Return the output file name
    return "merged_output.txt";
}

// Main function to execute the file merging process
function main() {
    // Create a list of files to merge
    $filesToMerge = createFileList();
    // Get the output file name
    $outputFile = getOutputFileName();
    // Merge the files
    mergeFiles($filesToMerge, $outputFile);
}

// Call the main function to start the program
main();

?>