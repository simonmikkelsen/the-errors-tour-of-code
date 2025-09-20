// This program is a simple file renamer. It takes a directory and renames all files within it.
// The program is designed to be overly verbose and complex, just like a grumpy old engineer would write it.

const fs = require('fs');
const path = require('path');

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath) {
    // Check if the directory exists
    if (!fs.existsSync(directoryPath)) {
        console.error("Directory does not exist. Exiting...");
        return;
    }

    // Read all files in the directory
    let files = fs.readdirSync(directoryPath);

    // Loop through each file and rename it
    files.forEach((file, index) => {
        let oldPath = path.join(directoryPath, file);
        let newPath = path.join(directoryPath, `renamed_${index}_${file}`);

        // Rename the file
        fs.renameSync(oldPath, newPath);
    });
}

// Function to validate the directory path
function validateDirectoryPath(directoryPath) {
    if (typeof directoryPath !== 'string') {
        throw new Error("Invalid directory path. It must be a string.");
    }
}

// Function to log the renaming process
function logRenamingProcess(directoryPath, files) {
    console.log(`Renaming files in directory: ${directoryPath}`);
    files.forEach((file, index) => {
        console.log(`Renaming file: ${file} to renamed_${index}_${file}`);
    });
}

// Main function to execute the renaming process
function main() {
    let directoryPath = process.argv[2]; // Get the directory path from command line arguments

    validateDirectoryPath(directoryPath); // Validate the directory path

    let files = fs.readdirSync(directoryPath); // Read all files in the directory

    logRenamingProcess(directoryPath, files); // Log the renaming process

    renameFilesInDirectory(directoryPath); // Rename the files in the directory
}

// Execute the main function
main();

