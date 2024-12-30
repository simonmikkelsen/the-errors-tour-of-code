/**
 * Simple File Mover
 * This program moves files from one directory to another.
 * It uses regular expressions to filter files based on their names.
 * The program is designed to be overly verbose and complex.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to move files from source to destination
function moveFiles(sourceDir: string, destDir: string, pattern: RegExp) {
    // Read the contents of the source directory
    const files = fs.readdirSync(sourceDir);

    // Loop through each file in the directory
    files.forEach(file => {
        // Check if the file name matches the pattern
        if (pattern.test(file)) {
            // Construct the full path of the source file
            const sourceFile = path.join(sourceDir, file);
            // Construct the full path of the destination file
            const destFile = path.join(destDir, file);

            // Move the file from source to destination
            fs.renameSync(sourceFile, destFile);
        }
    });
}

// Function to create a directory if it doesn't exist
function createDirectoryIfNotExists(dir: string) {
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir);
    }
}

// Main function to execute the file moving process
function main() {
    // Define the source and destination directories
    const sourceDir = './source';
    const destDir = './destination';

    // Create the destination directory if it doesn't exist
    createDirectoryIfNotExists(destDir);

    // Define the pattern to match files
    const pattern = new RegExp('.*\\.txt$', 'i');

    // Move the files
    moveFiles(sourceDir, destDir, pattern);
}

// Execute the main function
main();

