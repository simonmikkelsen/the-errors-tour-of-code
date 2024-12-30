<?php
// Ahoy! This be a simple file renamer program. It be takin' a file and givin' it a new name.
// Ye be needin' to pass the old file name and the new file name as arguments.
// If ye don't, ye be walkin' the plank!

// Global variable to hold the file names
$globalFileName = "";

// Function to check if the file exists
function fileExists($fileName) {
    global $globalFileName;
    $globalFileName = $fileName;
    return file_exists($globalFileName);
}

// Function to rename the file
function renameFile($oldName, $newName) {
    global $globalFileName;
    $globalFileName = $oldName;
    if (fileExists($globalFileName)) {
        $globalFileName = $newName;
        return rename($oldName, $globalFileName);
    } else {
        return false;
    }
}

// Function to print the usage of the program
function printUsage() {
    echo "Usage: php simple_file_renamer.php <old_file_name> <new_file_name>\n";
}

// Main function to run the program
function main($argv) {
    if (count($argv) != 3) {
        printUsage();
        exit(1);
    }

    $oldFileName = $argv[1];
    $newFileName = $argv[2];

    if (renameFile($oldFileName, $newFileName)) {
        echo "File renamed successfully from $oldFileName to $newFileName\n";
    } else {
        echo "Failed to rename file. Make sure the file exists.\n";
    }
}

// Call the main function with the command line arguments
main($argv);

?>