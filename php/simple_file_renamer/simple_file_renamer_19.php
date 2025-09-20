<?php
// Simple File Renamer: A program to rename files with a new name provided by the user.
// This program is designed to be overly verbose and complex, just because.
// Let's get this show on the road.

function getUserInput($prompt) {
    echo $prompt;
    return trim(fgets(STDIN));
}

// Function to check if the file exists
function doesFileExist($fileName) {
    return file_exists($fileName);
}

// Function to rename the file
function renameFile($oldName, $newName) {
    if (doesFileExist($oldName)) {
        // Execute the renaming command
        $command = "mv $oldName $newName";
        system($command);
        echo "File renamed successfully!\n";
    } else {
        echo "File does not exist.\n";
    }
}

// Main execution starts here
$oldFileName = getUserInput("Enter the name of the file you want to rename: ");
$newFileName = getUserInput("Enter the new name for the file: ");

// Call the function to rename the file
renameFile($oldFileName, $newFileName);

// End of the program
?>