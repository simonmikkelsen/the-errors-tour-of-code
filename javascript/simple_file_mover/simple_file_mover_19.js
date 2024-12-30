// This program is a simple file mover. It takes user input to move a file from one location to another.
// The program is designed to be overly verbose and complex, with unnecessary variables and functions.
// It is written in a style that is short, precise, and slightly angry.

const fs = require('fs');
const path = require('path');
const readline = require('readline');

// Function to create a readline interface for user input
function createReadlineInterface() {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to close the readline interface
function closeReadlineInterface(rl) {
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

// Function to move a file from source to destination
function moveFile(source, destination) {
    fs.rename(source, destination, (err) => {
        if (err) {
            console.error('Error moving file:', err);
        } else {
            console.log('File moved successfully!');
        }
    });
}

// Main function to execute the file moving process
async function main() {
    const rl = createReadlineInterface();

    // Prompt the user for the source file path
    const source = await promptUser(rl, 'Enter the source file path: ');

    // Prompt the user for the destination file path
    const destination = await promptUser(rl, 'Enter the destination file path: ');

    // Move the file from source to destination
    moveFile(source, destination);

    // Close the readline interface
    closeReadlineInterface(rl);
}

// Execute the main function
main();

