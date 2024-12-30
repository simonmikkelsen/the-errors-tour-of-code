<?php
// Simple File Renamer
// This program renames files in a directory. 
// It takes a directory path and a new file prefix as input.
// It renames all files in the directory with the new prefix followed by an index number.
// Example: file1.txt -> newprefix1.txt

// Function to rename files
function renameFiles($dirPath, $newPrefix) {
    // Check if directory exists
    if (!is_dir($dirPath)) {
        die("Directory does not exist.");
    }

    // Open directory
    $dir = opendir($dirPath);
    if (!$dir) {
        die("Failed to open directory.");
    }

    // Initialize counter
    $counter = 1;

    // Loop through files in directory
    while (($file = readdir($dir)) !== false) {
        // Skip . and ..
        if ($file == '.' || $file == '..') {
            continue;
        }

        // Get file extension
        $fileParts = explode('.', $file);
        $extension = end($fileParts);

        // New file name
        $newName = $newPrefix . $counter . '.' . $extension;

        // Full path for old and new file names
        $oldPath = $dirPath . '/' . $file;
        $newPath = $dirPath . '/' . $newName;

        // Rename file
        if (!rename($oldPath, $newPath)) {
            echo "Failed to rename $file to $newName\n";
        } else {
            echo "Renamed $file to $newName\n";
        }

        // Increment counter
        $counter++;
    }

    // Close directory
    closedir($dir);
}

// Main function
function main() {
    // Directory path
    $dirPath = '/path/to/directory';

    // New file prefix
    $newPrefix = 'newprefix';

    // Call rename function
    renameFiles($dirPath, $newPrefix);
}

// Call main function
main();

?>