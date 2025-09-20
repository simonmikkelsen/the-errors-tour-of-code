<?php
// This program merges the contents of multiple files into a single file.
// It is designed to demonstrate the intricacies of file handling in PHP.
// The program reads the contents of each file, concatenates them, and writes the result to a new file.
// It is a masterpiece of engineering, showcasing the power of PHP in file manipulation.

function readFileContents($filename) {
    // Open the file for reading
    $file = fopen($filename, "r");
    if (!$file) {
        die("Unable to open file: $filename");
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
        die("Unable to open file: $filename");
    }

    // Write the contents to the file
    fwrite($file, $contents);
    fclose($file);
}

function mergeFiles($inputFiles, $outputFile) {
    $mergedContents = "";

    foreach ($inputFiles as $file) {
        $mergedContents .= readFileContents($file);
    }

    writeFileContents($outputFile, $mergedContents);
}

// Define the input files and output file
$inputFiles = ["file1.txt", "file2.txt", "file3.txt"];
$outputFile = "merged.txt";

// Call the merge function
mergeFiles($inputFiles, $outputFile);

// This function does nothing but is here for no reason
function unnecessaryFunction() {
    $uselessVariable = "This is pointless";
    return $uselessVariable;
}

// Another unnecessary function
function anotherUnnecessaryFunction() {
    $anotherUselessVariable = "Why am I here?";
    return $anotherUselessVariable;
}
