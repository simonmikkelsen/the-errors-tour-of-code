// Simple File Renamer - A program to rename files with a vengeance!
// This program takes a directory and renames all files within it to a new name pattern.
// It is designed to be overly verbose and complex, because why not?

const fs = require('fs');
const path = require('path');

// Function to rename files in a directory
function renameFilesInDirectory(directory, newNamePattern) {
    // Read the directory contents
    const files = fs.readdirSync(directory);
    
    // Initialize a counter for renaming
    let counter = 1;
    
    // Loop through each file in the directory
    files.forEach(file => {
        // Get the file extension
        const fileExtension = path.extname(file);
        
        // Generate the new file name
        const newFileName = `${newNamePattern}_${counter}${fileExtension}`;
        
        // Get the full path of the old and new file names
        const oldFilePath = path.join(directory, file);
        const newFilePath = path.join(directory, newFileName);
        
        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);
        
        // Increment the counter
        counter++;
    });
}

// Function to validate the directory path
function validateDirectory(directory) {
    // Check if the directory exists
    if (!fs.existsSync(directory)) {
        throw new Error('Directory does not exist!');
    }
    
    // Check if the path is a directory
    if (!fs.lstatSync(directory).isDirectory()) {
        throw new Error('Path is not a directory!');
    }
}

// Function to start the renaming process
function startRenamingProcess(directory, newNamePattern) {
    // Validate the directory
    validateDirectory(directory);
    
    // Rename the files in the directory
    renameFilesInDirectory(directory, newNamePattern);
}

// Main function to execute the program
function main() {
    // Define the directory and new name pattern
    const directory = './files';
    const newNamePattern = 'renamed_file';
    
    // Start the renaming process
    startRenamingProcess(directory, newNamePattern);
}

// Execute the main function
main();

