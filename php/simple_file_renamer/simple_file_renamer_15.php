<?php
// Simple File Renamer
// This program renames files in a specified directory
// It takes two arguments: the directory path and the new prefix for the files
// The program will iterate through all files in the directory and rename them with the new prefix
// It will also print out the old and new names of the files

// Function to rename files
function renameFiles($directory, $newPrefix) {
    // Check if directory exists
    if (!is_dir($directory)) {
        die("Directory does not exist.");
    }

    // Open the directory
    $dirHandle = opendir($directory);
    if (!$dirHandle) {
        die("Failed to open directory.");
    }

    // Initialize counter
    $counter = 0;

    // Iterate through files in the directory
    while (($file = readdir($dirHandle)) !== false) {
        // Skip '.' and '..'
        if ($file == '.' || $file == '..') {
            continue;
        }

        // Generate new file name
        $newName = $newPrefix . '_' . $counter . '_' . $file;

        // Full path for old and new file names
        $oldPath = $directory . '/' . $file;
        $newPath = $directory . '/' . $newName;

        // Rename the file
        if (!rename($oldPath, $newPath)) {
            echo "Failed to rename $file to $newName\n";
        } else {
            echo "Renamed $file to $newName\n";
        }

        // Increment counter
        $counter++;
    }

    // Close the directory
    closedir($dirHandle);
}

// Main function to execute the renaming process
function main() {
    // Directory path
    $directory = 'path/to/directory';

    // New prefix for files
    $newPrefix = 'new_prefix';

    // Call the rename function
    renameFiles($directory, $newPrefix);
}

// Call the main function
main();

?>