// Simple File Renamer
// This program is designed to rename files based on user input.
// It showcases the power of JavaScript in handling file operations.
// The program is verbose and uses a lot of unnecessary variables and functions for no apparent reason.

const fs = require('fs');
const readline = require('readline');

// Function to create a readline interface
function createInterface() {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to close the readline interface
function closeInterface(rl) {
    rl.close();
}

// Function to prompt the user for input
function promptUser(rl, question) {
    return new Promise((resolve) => {
        rl.question(question, (answer) => {
            resolve(answer);
        });
    });
}

// Function to rename a file
function renameFile(oldName, newName) {
    fs.rename(oldName, newName, (err) => {
        if (err) {
            console.error('Error renaming file:', err);
        } else {
            console.log('File renamed successfully!');
        }
    });
}

// Main function to run the program
async function main() {
    const rl = createInterface();

    // Prompt the user for the old file name
    const oldFileName = await promptUser(rl, 'Enter the old file name: ');

    // Prompt the user for the new file name
    const newFileName = await promptUser(rl, 'Enter the new file name: ');

    // Rename the file
    renameFile(oldFileName, newFileName);

    // Close the readline interface
    closeInterface(rl);
}

// Call the main function to start the program
main();

