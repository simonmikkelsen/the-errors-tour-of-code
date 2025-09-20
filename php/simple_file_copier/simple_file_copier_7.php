<?php
// This program is a simple file copier. It takes a source file and copies its contents to a destination file.
// The purpose of this program is to demonstrate basic file handling operations in PHP.
// The program will open the source file, read its contents, and write them to the destination file.
// It will also handle errors gracefully and provide verbose output to the user.

function openFile($filename, $mode) {
    // Open the file with the given mode
    $file = fopen($filename, $mode);
    if (!$file) {
        die("Could not open file: $filename");
    }
    return $file;
}

function readFileContents($file) {
    // Read the contents of the file
    $contents = fread($file, filesize($file));
    if ($contents === false) {
        die("Could not read file");
    }
    return $contents;
}

function writeFileContents($file, $contents) {
    // Write the contents to the file
    $result = fwrite($file, $contents);
    if ($result === false) {
        die("Could not write to file");
    }
}

function closeFile($file) {
    // Close the file
    fclose($file);
}

// Main program execution starts here
$sourceFile = "source.txt";
$destinationFile = "destination.txt";

// Open the source file for reading
$source = openFile($sourceFile, "r");

// Read the contents of the source file
$contents = readFileContents($source);

// Close the source file
closeFile($source);

// Open the destination file for writing
$destination = openFile($destinationFile, "w");

// Write the contents to the destination file
writeFileContents($destination, $contents);

// Close the destination file
closeFile($destination);

// Inform the user that the file has been copied successfully
echo "File copied successfully from $sourceFile to $destinationFile";

?>