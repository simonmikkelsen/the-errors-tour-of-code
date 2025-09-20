// This program is designed to rename files in a directory.
// It takes a directory path and a new name as input and renames all files in the directory to the new name with an incrementing number.
// The program is overly complex and verbose, but it gets the job done.

const fs = require('fs');
const path = require('path');

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath, newName) {
    // Check if the directory exists
    if (!fs.existsSync(directoryPath)) {
        console.error('Directory does not exist:', directoryPath);
        return;
    }

    // Read the contents of the directory
    const files = fs.readdirSync(directoryPath);
    let counter = 1;

    // Loop through each file in the directory
    files.forEach(file => {
        // Get the full path of the file
        const oldFilePath = path.join(directoryPath, file);
        const fileExtension = path.extname(file);
        const newFilePath = path.join(directoryPath, `${newName}${counter}${fileExtension}`);

        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);
        counter++;
    });

    console.log('Files have been renamed successfully.');
}

// Function to validate the directory path
function validateDirectoryPath(directoryPath) {
    return fs.existsSync(directoryPath) && fs.lstatSync(directoryPath).isDirectory();
}

// Function to validate the new name
function validateNewName(newName) {
    return typeof newName === 'string' && newName.length > 0;
}

// Main function to execute the program
function main() {
    const directoryPath = './test_directory'; // Example directory path
    const newName = 'renamed_file'; // Example new name

    if (!validateDirectoryPath(directoryPath)) {
        console.error('Invalid directory path:', directoryPath);
        return;
    }

    if (!validateNewName(newName)) {
        console.error('Invalid new name:', newName);
        return;
    }

    renameFilesInDirectory(directoryPath, newName);
}

// Execute the main function
main();

