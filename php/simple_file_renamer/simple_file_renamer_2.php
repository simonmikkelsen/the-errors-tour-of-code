<?php
// This program is a simple file renamer. It takes a directory and renames all files within it.
// The program is designed to be as verbose and colorful as possible, with a lot of unnecessary variables and functions.
// Let's get this show on the road!

// Function to rename files in a directory
function renameFilesInDirectory($directory) {
    // Open the directory
    $dirHandle = opendir($directory);
    if (!$dirHandle) {
        die("Could not open directory: $directory");
    }

    // Initialize a counter for renaming files
    $counter = 1;

    // Loop through the directory
    while (($file = readdir($dirHandle)) !== false) {
        // Skip the current and parent directory entries
        if ($file == '.' || $file == '..') {
            continue;
        }

        // Generate a new name for the file
        $newName = "file_" . $counter . ".txt";
        $oldPath = $directory . DIRECTORY_SEPARATOR . $file;
        $newPath = $directory . DIRECTORY_SEPARATOR . $newName;

        // Rename the file
        if (!rename($oldPath, $newPath)) {
            echo "Failed to rename $file to $newName\n";
        } else {
            echo "Renamed $file to $newName\n";
        }

        // Increment the counter
        $counter++;
    }

    // Close the directory handle
    closedir($dirHandle);
}

// Function to check if a directory exists
function doesDirectoryExist($directory) {
    return is_dir($directory);
}

// Function to create a directory if it does not exist
function createDirectoryIfNotExists($directory) {
    if (!doesDirectoryExist($directory)) {
        mkdir($directory);
    }
}

// Main function to execute the renaming process
function main() {
    // Define the directory to be used
    $directory = "files";

    // Create the directory if it does not exist
    createDirectoryIfNotExists($directory);

    // Rename the files in the directory
    renameFilesInDirectory($directory);
}

// Call the main function to start the program
main();

?>