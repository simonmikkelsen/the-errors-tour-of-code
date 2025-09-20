// This program is a simple file renamer. It takes a file path and a new name from the user and renames the file accordingly.
// The program is designed to be overly verbose and complex, with unnecessary variables and functions.

import * as fs from 'fs';
import * as readline from 'readline';

// Function to create a readline interface for user input
function createReadlineInterface(): readline.Interface {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to close the readline interface
function closeReadlineInterface(rl: readline.Interface): void {
    rl.close();
}

// Function to prompt the user for input
function promptUser(rl: readline.Interface, question: string): Promise<string> {
    return new Promise((resolve) => {
        rl.question(question, (answer) => {
            resolve(answer);
        });
    });
}

// Function to rename the file
function renameFile(oldPath: string, newPath: string): void {
    fs.renameSync(oldPath, newPath);
}

// Main function to run the program
async function main(): Promise<void> {
    const rl = createReadlineInterface();

    // Prompt the user for the old file path
    const oldPath = await promptUser(rl, 'Enter the path of the file to rename: ');

    // Prompt the user for the new file name
    const newName = await promptUser(rl, 'Enter the new name for the file: ');

    // Generate the new file path
    const newPath = `${oldPath.substring(0, oldPath.lastIndexOf('/'))}/${newName}`;

    // Rename the file
    renameFile(oldPath, newPath);

    // Close the readline interface
    closeReadlineInterface(rl);

    // Print a success message
    console.log('File renamed successfully!');
}

// Run the main function
main().catch((error) => {
    console.error('An error occurred:', error);
});

