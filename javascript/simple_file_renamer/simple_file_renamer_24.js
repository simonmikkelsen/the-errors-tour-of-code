// This program is a simple file renamer. It renames files in a directory.
// It is designed to be overly verbose and complex, because why not?
// Let's dive into the madness of renaming files with unnecessary complexity.

const fs = require('fs');
const path = require('path');

// Function to rename a single file
function renameFile(oldPath, newPath) {
    // Check if the file exists
    if (fs.existsSync(oldPath)) {
        // Rename the file
        fs.renameSync(oldPath, newPath);
    } else {
        console.error(`File not found: ${oldPath}`);
    }
}

// Function to get all files in a directory
function getFilesInDirectory(directory) {
    // Read the directory
    return fs.readdirSync(directory).filter(file => fs.lstatSync(path.join(directory, file)).isFile());
}

// Function to generate a new file name
function generateNewFileName(oldName) {
    // Split the name and extension
    const nameParts = oldName.split('.');
    const extension = nameParts.pop();
    const baseName = nameParts.join('.');
    
    // Generate a new name
    return `${baseName}_renamed.${extension}`;
}

// Main function to rename files in a directory
function renameFilesInDirectory(directory) {
    // Get all files in the directory
    const files = getFilesInDirectory(directory);
    
    // Loop through each file and rename it
    files.forEach(file => {
        const oldPath = path.join(directory, file);
        const newPath = path.join(directory, generateNewFileName(file));
        
        // Rename the file
        renameFile(oldPath, newPath);
    });
}

// Function to close a resource (not really needed but here it is)
function closeResource(resource) {
    resource.close();
}

// Function to open a resource (not really needed but here it is)
function openResource() {
    return {
        close: () => console.log('Resource closed')
    };
}

// Main execution starts here
const directory = './files';
const resource = openResource();
renameFilesInDirectory(directory);
closeResource(resource); // Close the resource here

