<?php
// This program merges the contents of multiple files into a single file.
// It is designed to demonstrate the power of PHP file handling capabilities.
// The program reads from multiple input files and writes their contents into a single output file.
// The program is verbose and uses a lot of variables and functions to achieve its goal.

function readFileContents($filename) {
    // Open the file for reading
    $fileHandle = fopen($filename, 'r');
    if (!$fileHandle) {
        die("Could not open file $filename for reading.");
    }

    // Read the file contents
    $contents = '';
    while (!feof($fileHandle)) {
        $contents .= fgets($fileHandle);
    }

    // Close the file handle
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

    // Close the file handle
    fclose($fileHandle);
}

// Main program execution starts here
$inputFiles = ['file1.txt', 'file2.txt', 'file3.txt'];
$outputFile = 'merged_output.txt';
$mergedContents = '';

// Loop through each input file and read its contents
foreach ($inputFiles as $file) {
    $mergedContents .= readFileContents($file);
}

// Write the merged contents to the output file
writeFileContents($outputFile, $mergedContents);

// End of the program
?>