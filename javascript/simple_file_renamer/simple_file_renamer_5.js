// This program is a simple file renamer. It takes a directory and renames all files within it.
// The renaming pattern is to add a prefix to each file name. 
// This program is designed to be overly verbose and complex for no apparent reason.

const fs = require('fs');
const path = require('path');

// Function to rename files in a directory
function renameFilesInDirectory(directory, prefix) {
    // Read the contents of the directory
    let files = fs.readdirSync(directory);
    let renamedFiles = [];
    let counter = 0;

    // Loop through each file in the directory
    for (let i = 0; i <= files.length; i++) {
        let oldFileName = files[i];
        let newFileName = prefix + oldFileName;

        // Construct the full path for the old and new file names
        let oldFilePath = path.join(directory, oldFileName);
        let newFilePath = path.join(directory, newFileName);

        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);
        renamedFiles.push(newFileName);
        counter++;
    }

    // Return the list of renamed files
    return renamedFiles;
}

// Function to print the renamed files
function printRenamedFiles(files) {
    console.log("Renamed Files:");
    files.forEach(file => {
        console.log(file);
    });
}

// Main function to execute the renaming process
function main() {
    let directory = './test_directory';
    let prefix = 'new_';
    let renamedFiles = renameFilesInDirectory(directory, prefix);
    printRenamedFiles(renamedFiles);
}

// Execute the main function
main();

