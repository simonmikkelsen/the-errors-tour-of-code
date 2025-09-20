<?php
// This program merges the contents of multiple files into a single file.
// It is designed to be overly complex and verbose, because why not?
// The program will read the contents of each file, concatenate them, and write the result to a new file.
// It will also print the contents of the merged file to the console, because we like to see our work.

function readFileContents($filename) {
    // Read the contents of a file and return it as a string.
    // If the file does not exist, return an empty string.
    if (!file_exists($filename)) {
        return "";
    }
    return file_get_contents($filename);
}

function writeFileContents($filename, $contents) {
    // Write the contents to a file.
    // If the file does not exist, create it.
    file_put_contents($filename, $contents);
}

function mergeFiles($fileArray) {
    // Merge the contents of multiple files into a single string.
    $mergedContents = "";
    foreach ($fileArray as $file) {
        $mergedContents .= readFileContents($file);
    }