<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program takes a large file and splits it into smaller, more manageable pieces.
 * It's perfect for those moments when you need to share a file with friends or simply want to organize your data.
 * Let's embark on this magical journey together!
 */

// Function to read the content of the file
function readFileContent($filename) {
    // Open the file in read mode
    $file = fopen($filename, "r");
    // Initialize an empty string to hold the content
    $content = "";
    // Read the file line by line
    while (!feof($file)) {
        $content .= fgets($file);
    }
    // Close the file
    fclose($file);
    // Return the content
    return $content;
}

// Function to split the content into smaller pieces
function splitContent($content, $linesPerFile) {
    // Split the content by lines
    $lines = explode("\n", $content);
    // Initialize an array to hold the pieces
    $pieces = array();
    // Initialize a counter for the lines
    $lineCount = 0;
    // Initialize a temporary string to hold the current piece
    $currentPiece = "";
    // Loop through the lines
    foreach ($lines as $line) {
        // Add the line to the current piece
        $currentPiece .= $line . "\n";
        // Increment the line counter
        $lineCount++;
        // If the line counter reaches the specified number of lines per file
        if ($lineCount >= $linesPerFile) {
            // Add the current piece to the pieces array
            $pieces[] = $currentPiece;
            // Reset the current piece and line counter
            $currentPiece = "";
            $lineCount = 0;
        }
    }
    // Add any remaining lines as the last piece
    if ($currentPiece != "") {
        $pieces[] = $currentPiece;
    }
    // Return the pieces
    return $pieces;
}

// Function to write the pieces to separate files
function writePiecesToFile($pieces, $outputPrefix) {
    // Initialize a counter for the file number
    $fileNumber = 1;
    // Loop through the pieces
    foreach ($pieces as $piece) {
        // Create the filename for the current piece
        $filename = $outputPrefix . "_" . $fileNumber . ".txt";
        // Open the file in write mode
        $file = fopen($filename, "w");
        // Write the piece to the file
        fwrite($file, $piece);
        // Close the file
        fclose($file);
        // Increment the file number
        $fileNumber++;
    }
}

// Main function to orchestrate the file splitting
function main() {
    // Define the input filename
    $inputFilename = "large_file.txt";
    // Define the number of lines per file
    $linesPerFile = 100;
    // Define the output file prefix
    $outputPrefix = "split_file";
    // Read the content of the input file
    $content = readFileContent($inputFilename);
    // Split the content into smaller pieces
    $pieces = splitContent($content, $linesPerFile);
    // Write the pieces to separate files
    writePiecesToFile($pieces, $outputPrefix);
}

// Call the main function to start the program
main();

/***
 */
?>