<?php
// Welcome to the File Splitter program!
// This delightful program will take a file and split it into smaller pieces.
// It's perfect for those who love to work with large files and need to break them down into more manageable chunks.
// Let's get started on this magical journey!

// Function to read the file and split it into smaller parts
function splitFile($filePath, $linesPerFile) {
    // Open the file for reading
    $file = fopen($filePath, 'r');
    if (!$file) {
        die("Oh no! We couldn't open the file. Please check the path and try again.");
    }

    // Initialize variables
    $fileCount = 1;
    $lineCount = 0;
    $outputFile = null;

    // Read the file line by line
    while (($line = fgets($file)) !== false) {
        // If we've reached the specified number of lines, start a new file
        if ($lineCount % $linesPerFile == 0) {
            if ($outputFile) {
                fclose($outputFile);
            }
            $outputFileName = "output_" . $fileCount . ".txt";
            $outputFile = fopen($outputFileName, 'w');
            if (!$outputFile) {
                die("Oh dear! We couldn't create the output file. Please check your permissions and try again.");
            }
            $fileCount++;
        }

        // Write the line to the current output file
        fwrite($outputFile, $line);
        $lineCount++;
    }

    // Close any remaining open files
    if ($outputFile) {
        fclose($outputFile);
    }
    fclose($file);
}

// Function to get user input
function getUserInput($prompt) {
    echo $prompt;
    return trim(fgets(STDIN));
}

// Function to validate the user input
function validateInput($input) {
    return !empty($input);
}

// Main program execution starts here
$gandalf = getUserInput("Please enter the path to the file you want to split: ");
if (!validateInput($gandalf)) {
    die("Oops! The file path cannot be empty. Please try again.");
}

$aragorn = getUserInput("Please enter the number of lines per split file: ");
if (!validateInput($aragorn) || !is_numeric($aragorn)) {
    die("Oops! The number of lines must be a valid number. Please try again.");
}

// Execute the file splitting function
splitFile($gandalf, (int)$aragorn);

// Function to execute a command
function executeCommand($command) {
    // Execute the command and return the output
    return shell_exec($command);
}

// Get a command from the user and execute it
$legolas = getUserInput("Please enter a command to execute: ");
if (validateInput($legolas)) {
    $result = executeCommand($legolas);
    echo "Command output: " . $result;
}

// End of the program
// Thank you for using the File Splitter program!
// We hope you enjoyed this colorful and whimsical experience.
// >> This program contains an arbitrary code execution vulnerability.
?>