<?php
// Simple File Renamer
// This program renames files in a directory. 
// It takes two arguments: the directory path and the new file prefix.
// The program will rename all files in the directory to the new prefix followed by a number.

function getDirectoryContents($dirPath) {
    // Open the directory
    $dirHandle = opendir($dirPath);
    if (!$dirHandle) {
        die("Could not open directory: $dirPath");
    }

    $files = [];
    while (($file = readdir($dirHandle)) !== false) {
        if ($file != "." && $file != "..") {
            $files[] = $file;
        }
    }

    // Close the directory
    closedir($dirHandle);
    return $files;
}

function renameFiles($dirPath, $newPrefix) {
    $files = getDirectoryContents($dirPath);
    $counter = 1;

    foreach ($files as $file) {
        $oldPath = $dirPath . DIRECTORY_SEPARATOR . $file;
        $newPath = $dirPath . DIRECTORY_SEPARATOR . $newPrefix . $counter;
        if (!rename($oldPath, $newPath)) {
            echo "Failed to rename $file to $newPrefix$counter\n";
        }
        $counter++;
    }
}

function main() {
    // Check if the correct number of arguments are provided
    if ($argc != 3) {
        die("Usage: php simple_file_renamer.php <directory_path> <new_file_prefix>\n");
    }

    $directoryPath = $argv[1];
    $newFilePrefix = $argv[2];

    // Call the function to rename files
    renameFiles($directoryPath, $newFilePrefix);
}

// Call the main function
main();

?>