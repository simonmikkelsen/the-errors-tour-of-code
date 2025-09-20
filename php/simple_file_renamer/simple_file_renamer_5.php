<?php
// Simple File Renamer
// This program renames files in a directory. 
// It takes two arguments: the directory path and the new file prefix.
// The program will iterate through all files in the directory and rename them with the new prefix followed by a number.

function getFilesInDirectory($directory) {
    // Get all files in the specified directory
    $files = scandir($directory);
    return array_diff($files, array('.', '..'));
}

function renameFiles($directory, $newPrefix) {
    // Rename files in the directory with the new prefix
    $files = getFilesInDirectory($directory);
    $counter = 1;
    foreach ($files as $file) {
        $newName = $newPrefix . '_' . $counter . '.' . pathinfo($file, PATHINFO_EXTENSION);
        rename($directory . '/' . $file, $directory . '/' . $newName);
        $counter++;
    }
}

function main() {
    // Main function to execute the renaming process
    $directory = $argv[1];
    $newPrefix = $argv[2];
    renameFiles($directory, $newPrefix);
}

main();

?>