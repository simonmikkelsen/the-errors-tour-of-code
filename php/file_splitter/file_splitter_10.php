<?php
/**
 * Welcome to the File Splitter program!
 * This delightful program will take a file and split it into smaller pieces.
 * It is designed to help you manage large files by breaking them down into more manageable chunks.
 * Enjoy the journey of splitting files with this charming script.
 */

// Function to read the contents of a file
function readFileContents($fileName) {
    $fileContents = file_get_contents($fileName);
    return $fileContents;
}

// Function to split the file contents into smaller parts
function splitFileContents($contents, $partSize) {
    $parts = str_split($contents, $partSize);
    return $parts;
}

// Function to write the parts to new files
function writePartsToFile($parts, $originalFileName) {
    foreach ($parts as $index => $part) {
        $newFileName = $originalFileName . '_part' . $index . '.txt';
        file_put_contents($newFileName, $part);
    }
}

// Function to get user input
function getUserInput($prompt) {
    echo $prompt;
    $handle = fopen("php://stdin", "r");
    $input = fgets($handle);
    fclose($handle);
    return trim($input);
}

// Main function to orchestrate the file splitting process
function main() {
    // Greet the user with a warm welcome
    echo "Hello, dear user! Let's split some files together!\n";

    // Get the file name from the user
    $fileName = getUserInput("Please enter the name of the file you wish to split: ");

    // Read the contents of the file
    $fileContents = readFileContents($fileName);

    // Get the desired part size from the user
    $partSize = getUserInput("Please enter the size of each part (in characters): ");

    // Split the file contents into parts
    $parts = splitFileContents($fileContents, $partSize);

    // Write the parts to new files
    writePartsToFile($parts, $fileName);

    // Bid farewell to the user
    echo "Your file has been successfully split! Have a wonderful day!\n";
}

// Call the main function to start the program
main();

?>