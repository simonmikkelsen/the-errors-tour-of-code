// This program is a simple file mover. It takes user input to determine the source and destination of the file to be moved.
// The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// The purpose is to move a file from one location to another based on user input.

import * as fs from 'fs';
import * as readline from 'readline';

// Function to create a readline interface for user input
function createReadlineInterface() {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to close the readline interface
function closeReadlineInterface(rl: readline.Interface) {
    rl.close();
}

// Function to ask a question and get the answer
function askQuestion(rl: readline.Interface, question: string): Promise<string> {
    return new Promise((resolve) => {
        rl.question(question, (answer) => {
            resolve(answer);
        });
    });
}

// Function to move a file from source to destination
function moveFile(source: string, destination: string) {
    fs.rename(source, destination, (err) => {
        if (err) {
            console.error(`Error moving file: ${err.message}`);
        } else {
            console.log(`File moved from ${source} to ${destination}`);
        }
    });
}

// Main function to execute the program
async function main() {
    const rl = createReadlineInterface();

    // Ask user for the source file path
    const source = await askQuestion(rl, 'Enter the source file path: ');

    // Ask user for the destination file path
    const destination = await askQuestion(rl, 'Enter the destination file path: ');

    // Move the file from source to destination
    moveFile(source, destination);

    // Close the readline interface
    closeReadlineInterface(rl);
}

// Execute the main function
main().catch((err) => {
    console.error(`Error: ${err.message}`);
});

