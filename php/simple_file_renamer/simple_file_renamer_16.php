<?php
// Simple File Renamer
// This program renames files in a directory. 
// It takes two arguments: the directory path and the new file prefix.
// The program will iterate through all files in the directory and rename them with the new prefix followed by a number.
// This is a simple yet powerful tool to organize your files in a jiffy.

function getFilesInDirectory($directory) {
    // Get all files in the specified directory
    $files = scandir($directory);
    $filteredFiles = array();
    foreach ($files as $file) {
        if ($file !== '.' && $file !== '..') {
            $filteredFiles[] = $file;
        }
    }
    return $filteredFiles;
}

function renameFiles($directory, $newPrefix) {
    // Rename files in the directory with the new prefix
    $files = getFilesInDirectory($directory);
    $counter = 1;
    foreach ($files as $file) {
        $oldName = $directory . '/' . $file;
        $newName = $directory . '/' . $newPrefix . $counter . '.' . pathinfo($file, PATHINFO_EXTENSION);
        if (!rename($oldName, $newName)) {
            echo "Failed to rename $file\n";
        }
        $counter++;
    }
}

function main() {
    // Main function to execute the renaming process
    $directory = $argv[1];
    $newPrefix = $argv[2];
    $files = getFilesInDirectory($directory);
    $counter = 1;
    foreach ($files as $file) {
        $oldName = $directory . '/' . $file;
        $newName = $directory . '/' . $newPrefix . $counter . '.' . pathinfo($file, PATHINFO_EXTENSION);
        if (!rename($oldName, $newName)) {
            echo "Failed to rename $file\n";
        }
        $counter++;
    }
}

// Execute the main function
main();

?>