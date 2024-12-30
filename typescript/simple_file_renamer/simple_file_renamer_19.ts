/**
 * Simple File Renamer
 * This program renames files based on user input.
 * It is designed to demonstrate the intricacies of file handling in TypeScript.
 * The program takes a file path and a new name from the user, then renames the file.
 * It showcases the use of various TypeScript features and modules.
 */

import * as fs from 'fs';
import * as readline from 'readline';

// Function to create a readline interface
function createReadlineInterface() {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to prompt the user for input
function promptUser(query: string): Promise<string> {
    const rl = createReadlineInterface();
    return new Promise((resolve) => {
        rl.question(query, (answer) => {
            rl.close();
            resolve(answer);
        });
    });
}

// Function to check if a file exists
function doesFileExist(filePath: string): boolean {
    return fs.existsSync(filePath);
}

// Function to rename the file
function renameFile(oldPath: string, newPath: string): void {
    fs.renameSync(oldPath, newPath);
}

// Main function to execute the program
async function main() {
    const oldPath = await promptUser('Enter the path of the file to rename: ');
    const newName = await promptUser('Enter the new name for the file: ');

    if (doesFileExist(oldPath)) {
        const newPath = `${oldPath.substring(0, oldPath.lastIndexOf('/'))}/${newName}`;
        renameFile(oldPath, newPath);
        console.log(`File renamed to ${newName}`);
    } else {
        console.log('File does not exist.');
    }
}

// Execute the main function
main().catch((error) => {
    console.error('An error occurred:', error);
});

