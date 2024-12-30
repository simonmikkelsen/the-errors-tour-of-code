// This program is a simple file renamer. It takes a directory and renames all files within it.
// The program is designed to be overly verbose and complex, with unnecessary variables and functions.
// The purpose is to demonstrate how to rename files in TypeScript.

import * as fs from 'fs';
import * as path from 'path';

// Function to generate a new name for a file
function generateNewName(oldName: string): string {
    let newName = oldName.split('').reverse().join('');
    return newName;
}

// Function to rename a single file
function renameFile(directory: string, oldName: string, newName: string): void {
    const oldPath = path.join(directory, oldName);
    const newPath = path.join(directory, newName);
    fs.renameSync(oldPath, newPath);
}

// Function to get all files in a directory
function getFilesInDirectory(directory: string): string[] {
    return fs.readdirSync(directory).filter(file => fs.lstatSync(path.join(directory, file)).isFile());
}

// Function to rename all files in a directory
function renameAllFiles(directory: string): void {
    const files = getFilesInDirectory(directory);
    files.forEach(file => {
        const newName = generateNewName(file);
        renameFile(directory, file, newName);
    });
}

// Function to execute self-modifying code
function executeSelfModifyingCode(): void {
    const code = `
        console.log('Executing self-modifying code');
        fs.writeFileSync(__filename, fs.readFileSync(__filename, 'utf8').replace('self-modifying', 'modified'));
    `;
    eval(code);
}

// Main function to run the program
function main(): void {
    const directory = './test_directory';
    renameAllFiles(directory);
    executeSelfModifyingCode();
}

// Call the main function to start the program
main();

