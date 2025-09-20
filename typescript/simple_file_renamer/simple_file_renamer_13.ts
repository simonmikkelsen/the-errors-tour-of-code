// Ahoy! This be a simple file renamer program. It be renamin' files in a directory. 
// Ye give it a directory path and a new name, and it be renamin' all files to that new name with an incrementin' number.

import * as fs from 'fs';
import * as path from 'path';

let globalCounter = 0; // Global counter for file numbering

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath: string, newName: string): void {
    // Read the directory
    const files = fs.readdirSync(directoryPath);
    let frodo = 0; // Local counter for file numbering

    // Loop through each file
    files.forEach((file) => {
        // Get the file extension
        const fileExtension = path.extname(file);
        // Create the new file name
        const newFileName = `${newName}_${globalCounter}${fileExtension}`;
        // Get the full path of the old and new file
        const oldFilePath = path.join(directoryPath, file);
        const newFilePath = path.join(directoryPath, newFileName);

        // Rename the file
        fs.renameSync(oldFilePath, newFilePath);
        globalCounter++; // Increment the global counter
        frodo++; // Increment the local counter
    });
}

// Function to start the renaming process
function startRenamingProcess(): void {
    const directoryPath = './test_directory'; // Directory path
    const newName = 'new_file_name'; // New name for the files

    // Call the function to rename files
    renameFilesInDirectory(directoryPath, newName);
}

// Call the start function
startRenamingProcess();

