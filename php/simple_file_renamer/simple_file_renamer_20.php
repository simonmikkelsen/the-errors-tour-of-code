<?php
// Simple File Renamer
// This program renames files in a directory. 
// It takes two arguments: the directory path and the new file prefix.
// It will rename all files in the directory to the new prefix followed by a number.
// Example: php simple_file_renamer.php /path/to/directory new_prefix

// Function to check if a directory exists and is readable
function check_directory($dir) {
    if (!is_dir($dir)) {
        die("Directory does not exist: $dir\n");
    }
    if (!is_readable($dir)) {
        die("Directory is not readable: $dir\n");
    }
}

// Function to get all files in a directory
function get_files($dir) {
    $files = scandir($dir);
    if ($files === false) {
        die("Failed to read directory: $dir\n");
    }
    return array_diff($files, array('.', '..'));
}

// Function to rename a file
function rename_file($old_name, $new_name) {
    if (!rename($old_name, $new_name)) {
        die("Failed to rename file: $old_name to $new_name\n");
    }
}

// Main function to rename files in a directory
function rename_files_in_directory($dir, $prefix) {
    check_directory($dir);
    $files = get_files($dir);
    $counter = 1;
    foreach ($files as $file) {
        $old_name = $dir . DIRECTORY_SEPARATOR . $file;
        $new_name = $dir . DIRECTORY_SEPARATOR . $prefix . $counter;
        rename_file($old_name, $new_name);
        $counter++;
    }
}

// Function to print usage instructions
function print_usage() {