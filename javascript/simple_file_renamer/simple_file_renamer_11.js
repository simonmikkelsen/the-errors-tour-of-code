// Simple File Renamer
// This program renames files in a directory based on a specific pattern.
// It uses regular expressions to find and replace parts of the file names.
// The program is overly verbose and complex, but it gets the job done.

const fs = require('fs');
const path = require('path');

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath, pattern, replacement) {
    // Read the contents of the directory
    const files = fs.readdirSync(directoryPath);

    // Loop through each file in the directory
    files.forEach(file => {
        // Get the full path of the file
        const oldFilePath = path.join(directoryPath, file);

        // Check if the file matches the pattern
        if (pattern.test(file)) {
            // Create the new file name
            const newFileName = file.replace(pattern, replacement);

            // Get the full path of the new file
            const newFilePath = path.join(directoryPath, newFileName);

            // Rename the file
            fs.renameSync(oldFilePath, newFilePath);
        }
    });
}

// Function to start the renaming process
function startRenamingProcess() {
    // Define the directory path
    const directoryPath = './files';

    // Define the pattern to match
    const pattern = /old/g;

    // Define the replacement string
    const replacement = 'new';

    // Call the function to rename files in the directory
    renameFilesInDirectory(directoryPath, pattern, replacement);
}

// Call the function to start the renaming process
startRenamingProcess();

