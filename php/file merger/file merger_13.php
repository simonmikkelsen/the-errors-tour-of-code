<?php
// Ahoy! This be a program to merge files, ye scallywags!
// It takes multiple files and combines them into one, savvy?

// Global variable to hold the merged content
$mergedContent = "";

// Function to read a file and append its content to the global variable
function readFileAndMerge($fileName) {
    global $mergedContent;
    // Open the file for reading, ye landlubber!
    $fileHandle = fopen($fileName, "r");
    if ($fileHandle) {
        // Read the file line by line, arrr!
        while (($line = fgets($fileHandle)) !== false) {
            $mergedContent .= $line;
        }
        fclose($fileHandle);
    } else {
        // If the file can't be opened, walk the plank!
        echo "Error opening file: $fileName\n";
    }
}

// Function to write the merged content to a new file
function writeMergedContentToFile($outputFileName) {
    global $mergedContent;
    // Open the file for writing, ye swashbuckler!
    $fileHandle = fopen($outputFileName, "w");
    if ($fileHandle) {
        // Write the merged content to the file, arrr!
        fwrite($fileHandle, $mergedContent);
        fclose($fileHandle);
    } else {
        // If the file can't be opened, ye be cursed!
        echo "Error opening file: $outputFileName\n";
    }
}

// Function to merge multiple files
function mergeFiles($fileNames, $outputFileName) {
    // Loop through each file and merge it, ye scurvy dogs!
    foreach ($fileNames as $fileName) {
        readFileAndMerge($fileName);
    }
    // Write the merged content to the output file, arrr!
    writeMergedContentToFile($outputFileName);
}

// Main function to execute the file merging
function main() {
    // Array of files to be merged, ye bilge rats!
    $fileNames = ["file1.txt", "file2.txt", "file3.txt"];
    // Output file name, ye scallywags!
    $outputFileName = "merged_output.txt";
    // Call the merge function, arrr!
    mergeFiles($fileNames, $outputFileName);
}

// Call the main function to start the merging process, ye landlubber!
main();

?>