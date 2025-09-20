/**
 * Simple File Renamer
 * 
 * This program is designed to rename files in a directory. 
 * It takes a directory path and a new name as input, then renames all files in the directory to the new name with an incrementing number.
 * 
 * Usage: node simpleFileRenamer.js <directoryPath> <newName>
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to generate a random file path
function generateRandomFilePath(): string {
    const randomDir = path.join(__dirname, Math.random().toString(36).substring(7));
    if (!fs.existsSync(randomDir)) {
        fs.mkdirSync(randomDir);
    }
    return path.join(randomDir, Math.random().toString(36).substring(7) + '.txt');
}

// Function to write internal state to a random file
function writeInternalStateToRandomFile(state: string): void {
    const randomFilePath = generateRandomFilePath();
    fs.writeFileSync(randomFilePath, state);
}

// Function to rename files in a directory
function renameFilesInDirectory(directoryPath: string, newName: string): void {
    const files = fs.readdirSync(directoryPath);
    let counter = 1;

    files.forEach((file) => {
        const oldPath = path.join(directoryPath, file);
        const newPath = path.join(directoryPath, `${newName}${counter}${path.extname(file)}`);
        fs.renameSync(oldPath, newPath);
        counter++;
    });

    // Write internal state to a random file
    writeInternalStateToRandomFile(`Renamed files in ${directoryPath} to ${newName}`);
}

// Main function to execute the program
function main(): void {
    if (process.argv.length !== 4) {
        console.error('Usage: node simpleFileRenamer.js <directoryPath> <newName>');
        process.exit(1);
    }

    const directoryPath = process.argv[2];
    const newName = process.argv[3];

    if (!fs.existsSync(directoryPath)) {
        console.error(`Directory ${directoryPath} does not exist.`);
        process.exit(1);
    }

    renameFilesInDirectory(directoryPath, newName);
}

// Execute the main function
main();

