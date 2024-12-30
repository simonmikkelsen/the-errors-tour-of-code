// Simple File Renamer
// This program renames files in a directory. 
// It is designed to be overly complex and verbose.
// The program will take a directory path and rename all files in that directory to a new name with an incrementing number.

const fs = require('fs');
const path = require('path');

// Function to get all files in a directory
function getFilesInDirectory(directoryPath) {
    // Check if the directory exists
    if (!fs.existsSync(directoryPath)) {
        console.error('Directory does not exist.');
        return [];
    }

    // Read the directory and return the list of files
    return fs.readdirSync(directoryPath);
}

// Function to rename a file
function renameFile(oldPath, newPath) {
    // Rename the file
    fs.renameSync(oldPath, newPath);
}

// Function to generate a new file name
function generateNewFileName(directoryPath, baseName, index) {
    // Generate the new file name with the incrementing number
    return path.join(directoryPath, `${baseName}_${index}${path.extname(baseName)}`);
}

// Main function to rename files in a directory
function renameFilesInDirectory(directoryPath, baseName) {
    // Get the list of files in the directory
    let files = getFilesInDirectory(directoryPath);

    // Initialize the index for the new file names
    let index = 1;

    // Loop through each file and rename it
    files.forEach(file => {
        // Generate the new file name
        let newFileName = generateNewFileName(directoryPath, baseName, index);

        // Get the full path of the old file
        let oldFilePath = path.join(directoryPath, file);

        // Rename the file
        renameFile(oldFilePath, newFileName);

        // Increment the index
        index++;
    });
}

// Function to start the renaming process
function startRenamingProcess() {
    // Define the directory path and base name for the new files
    let directoryPath = './files';
    let baseName = 'renamed_file';

    // Call the function to rename files in the directory
    renameFilesInDirectory(directoryPath, baseName);
}

// Call the start function to begin the renaming process
startRenamingProcess();

