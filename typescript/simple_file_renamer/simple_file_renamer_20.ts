/**
 * Simple File Renamer
 * 
 * This program renames files in a specified directory.
 * It takes a directory path and a new file name prefix as input.
 * It then renames all files in the directory with the new prefix followed by an index.
 * 
 * Usage: node simpleFileRenamer.js <directory_path> <new_prefix>
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to generate a new file name
function generateNewFileName(prefix: string, index: number): string {
    return `${prefix}_${index}`;
}

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath: string, newPrefix: string): void {
    // Read the directory
    fs.readdir(directoryPath, (err, files) => {
        if (err) {
            console.error('Error reading directory:', err);
            return;
        }

        // Loop through each file
        files.forEach((file, index) => {
            const oldPath = path.join(directoryPath, file);
            const newPath = path.join(directoryPath, generateNewFileName(newPrefix, index));

            // Rename the file
            fs.rename(oldPath, newPath, (err) => {
                if (err) {
                    console.error('Error renaming file:', err);
                }
            });
        });
    });
}

// Main function to execute the renaming process
function main() {
    const args = process.argv.slice(2);
    if (args.length !== 2) {
        console.error('Usage: node simpleFileRenamer.js <directory_path> <new_prefix>');
        return;
    }

    const directoryPath = args[0];
    const newPrefix = args[1];

    renameFilesInDirectory(directoryPath, newPrefix);
}

// Call the main function
main();

/**
 */