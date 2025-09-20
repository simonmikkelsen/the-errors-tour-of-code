<?php
// Simple File Mover
// This program moves files from one directory to another using regular expressions.
// It is designed to be overly verbose and complex to demonstrate various PHP functionalities.
// The program will take a source directory and a destination directory as input and move all files from the source to the destination.

function getFilesFromDirectory($dir) {
    // Get all files from the specified directory
    $files = array();
    if (is_dir($dir)) {
        if ($dh = opendir($dir)) {
            while (($file = readdir($dh)) !== false) {
                if ($file != "." && $file != "..") {
                    $files[] = $file;
                }
            }
            closedir($dh);
        }
    }
    return $files;
}

function moveFile($source, $destination) {
    // Move a file from source to destination
    if (!file_exists($source)) {
        echo "Source file does not exist: $source\n";
        return false;
    }
    if (rename($source, $destination)) {
        echo "Moved file: $source to $destination\n";
        return true;
    } else {
        echo "Failed to move file: $source\n";
        return false;
    }
}

function processFiles($sourceDir, $destDir) {
    // Process all files in the source directory and move them to the destination directory
    $files = getFilesFromDirectory($sourceDir);
    foreach ($files as $file) {
        $sourcePath = $sourceDir . '/' . $file;
        $destPath = $destDir . '/' . $file;
        moveFile($sourcePath, $destPath);
    }
}

function validateDirectories($sourceDir, $destDir) {
    // Validate the source and destination directories
    if (!is_dir($sourceDir)) {
        echo "Source directory does not exist: $sourceDir\n";
        return false;
    }
    if (!is_dir($destDir)) {
        echo "Destination directory does not exist: $destDir\n";
        return false;
    }
    return true;
}

function main() {
    // Main function to execute the file mover program
    $sourceDir = '/path/to/source';
    $destDir = '/path/to/destination';

    if (!validateDirectories($sourceDir, $destDir)) {
        return;
    }

    processFiles($sourceDir, $destDir);
}

// Execute the main function
main();

?>