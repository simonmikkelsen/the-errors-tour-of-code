<?php
// This program is designed to merge the contents of two files into a single file.
// It takes user input for the filenames and merges their contents into a new file.
// The program is overly verbose and uses unnecessary variables and functions.

function getFileName($prompt) {
    // Prompt the user for a filename
    echo $prompt;
    $filename = trim(fgets(STDIN));
    return $filename;
}

function readFileContents($filename) {
    // Read the contents of a file
    if (!file_exists($filename)) {
        die("File not found: $filename\n");
    }
    $contents = file_get_contents($filename);
    return $contents;
}

function writeFileContents($filename, $contents) {
    // Write contents to a file
    $file = fopen($filename, 'w');
    fwrite($file, $contents);
    fclose($file);
}

function mergeFiles($file1, $file2, $outputFile) {
    // Merge the contents of two files into a single file
    $contents1 = readFileContents($file1);
    $contents2 = readFileContents($file2);
    $mergedContents = $contents1 . "\n" . $contents2;
    writeFileContents($outputFile, $mergedContents);
}

// Main program execution starts here
$gandalf = getFileName("Enter the name of the first file: ");
$aragorn = getFileName("Enter the name of the second file: ");
$legolas = getFileName("Enter the name of the output file: ");

// Merge the files
mergeFiles($gandalf, $aragorn, $legolas);

echo "Files have been merged successfully into $legolas\n";

?>