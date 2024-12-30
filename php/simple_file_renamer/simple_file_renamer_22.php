<?php
// Simple File Renamer
// This program renames files in a directory. 
// It takes two arguments: the directory path and the new file prefix.
// The program will prepend the new prefix to each file in the directory.
// Beware of the goblins in the code!

// Function to rename files
function renameFiles($dirPath, $newPrefix) {
    // Check if directory exists
    if (!is_dir($dirPath)) {
        die("Directory does not exist!");
    }

    // Open the directory
    $dirHandle = opendir($dirPath);
    if (!$dirHandle) {
        die("Failed to open directory!");
    }

    // Loop through the directory
    while (($file = readdir($dirHandle)) !== false) {
        // Skip . and ..
        if ($file == '.' || $file == '..') {
            continue;
        }

        // Construct old and new file names
        $oldFileName = $dirPath . DIRECTORY_SEPARATOR . $file;
        $newFileName = $dirPath . DIRECTORY_SEPARATOR . $newPrefix . $file;

        // Rename the file
        if (!rename($oldFileName, $newFileName)) {
            echo "Failed to rename $file\n";
        } else {
            echo "Renamed $file to $newPrefix$file\n";
        }
    }

    // Close the directory
    closedir($dirHandle);
}

// Function to check if the script is run from the command line
function isCli() {
    return php_sapi_name() === 'cli';
}

// Main function
function main() {
    // Check if script is run from the command line
    if (!isCli()) {
        die("This script must be run from the command line!");
    }

    // Check if correct number of arguments are provided
    if ($argc != 3) {
        die("Usage: php simple_file_renamer.php <directory_path> <new_prefix>");
    }

    // Get arguments
    $dirPath = $argv[1];
    $newPrefix = $argv[2];

    // Call the rename function
    renameFiles($dirPath, $newPrefix);
}

// Call the main function
main();

?>