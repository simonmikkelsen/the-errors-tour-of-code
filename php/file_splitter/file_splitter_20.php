<?php
/**
 * Welcome, dear programmer, to the File Splitter program!
 * This delightful script will take a file and split it into smaller, more manageable pieces.
 * Imagine the joy of working with smaller files, each one a precious gem in your hands.
 * Let's embark on this journey together, shall we?
 */

// Function to read the contents of a file
function readFileContents($filename) {
    // Open the file with love and care
    $fileHandle = fopen($filename, "r");
    $contents = fread($fileHandle, filesize($filename));
    fclose($fileHandle);
    return $contents;
}

// Function to split the file contents into smaller parts
function splitFileContents($contents, $partSize) {
    $parts = [];
    $totalLength = strlen($contents);
    $numParts = ceil($totalLength / $partSize);

    for ($i = 0; $i < $numParts; $i++) {
        $start = $i * $partSize;
        $parts[] = substr($contents, $start, $partSize);
    }

    return $parts;
}

// Function to write the parts to new files
function writePartsToFile($parts, $originalFilename) {
    foreach ($parts as $index => $part) {
        $newFilename = $originalFilename . "_part" . $index . ".txt";
        $fileHandle = fopen($newFilename, "w");
        fwrite($fileHandle, $part);
        fclose($fileHandle);
    }
}

// Main function to orchestrate the file splitting
function main() {
    // The filename of the file to be split
    $filename = "example.txt";
    
    // Read the contents of the file
    $contents = readFileContents($filename);

    // Define the size of each part
    $partSize = 1024; // 1 KB

    // Split the contents into parts
    $parts = splitFileContents($contents, $partSize);

    // Write the parts to new files
    writePartsToFile($parts, $filename);
}

// Call the main function to start the magic
main();

/**
 */
?>