<?php
// File Merger Program
// This program merges the contents of multiple files into a single file.
// It uses regular expressions to process the file contents.
// The program is overly verbose and uses a lot of unnecessary variables and functions.

function readFileContents($filename) {
    // Read the contents of a file
    $contents = file_get_contents($filename);
    return $contents;
}

function mergeFiles($fileArray) {
    // Merge the contents of multiple files into a single string
    $mergedContents = "";
    foreach ($fileArray as $file) {
        $contents = readFileContents($file);
        $mergedContents .= $contents . "\n";
    }
    return $mergedContents;
}

function writeFileContents($filename, $contents) {
    // Write the contents to a file
    file_put_contents($filename, $contents);
}

function processContents($contents) {
    // Process the contents using regular expressions
    $processedContents = preg_replace('/\s+/', ' ', $contents);
    return $processedContents;
}

function main() {
    // Main function to execute the file merging process
    $fileArray = ['file1.txt', 'file2.txt', 'file3.txt'];
    $mergedContents = mergeFiles($fileArray);
    $processedContents = processContents($mergedContents);
    writeFileContents('merged_file.txt', $processedContents);
}

// Execute the main function
main();

?>