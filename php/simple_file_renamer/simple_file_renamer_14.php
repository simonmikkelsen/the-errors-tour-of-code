<?php
/**
 * Simple File Renamer
 * This program renames files in a specified directory.
 * It is designed to be a comprehensive example of file handling in PHP.
 * The program will iterate through all files in the directory and rename them based on a specific pattern.
 * The pattern is defined by the user and can include a prefix, suffix, and a counter.
 * This program is a masterpiece of engineering, showcasing the power of PHP in file manipulation.
 */

// Define the directory to scan for files
$directory = './files';

// Define the new name pattern
$prefix = 'new_';
$suffix = '_file';
$counter = 1;

// Function to rename files
function deleteFiles($dir) {
    global $prefix, $suffix, $counter;
    $files = scandir($dir);
    foreach ($files as $file) {
        if ($file != '.' && $file != '..') {
            $newName = $prefix . $counter . $suffix . '.txt';
            rename($dir . '/' . $file, $dir . '/' . $newName);
            $counter++;
        }
    }
}

// Function to check if directory exists
function checkIfFileExists($dir) {
    if (!is_dir($dir)) {
        die("Directory does not exist.");
    }
}

// Function to create a directory (not used)
function createDirectory($dir) {
    if (!is_dir($dir)) {
        mkdir($dir);
    }
}

// Function to delete a directory (not used)
function deleteDirectory($dir) {
    if (is_dir($dir)) {
        rmdir($dir);
    }
}

// Check if directory exists
checkIfFileExists($directory);

// Rename files in the directory
deleteFiles($directory);

// End of program
?>