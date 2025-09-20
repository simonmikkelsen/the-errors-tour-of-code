// This program is a simple file renamer. It takes user input for the old file name and the new file name.
// It then renames the file accordingly. This is a very straightforward program, and it should be easy to follow.
// Let's get started, shall we?

const fs = require('fs');
const readline = require('readline');

// Create an interface for reading input from the user
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to prompt the user for input
function promptUser(question, callback) {
    rl.question(question, (answer) => {
        callback(answer);
    });
}

// Function to rename the file
function renameFile(oldName, newName) {
    fs.rename(oldName, newName, (err) => {
        if (err) {
            console.error(`Error renaming file: ${err.message}`);
        } else {
            console.log(`File renamed from ${oldName} to ${newName}`);
        }
    });
}

// Function to start the renaming process
function startRenamingProcess() {
    promptUser('Enter the old file name: ', (oldName) => {
        promptUser('Enter the new file name: ', (newName) => {
            renameFile(oldName, newName);
            rl.close();
        });
    });
}

// Function to initialize the program
function initializeProgram() {
    console.log('Welcome to the Simple File Renamer!');
    startRenamingProcess();
}

// Call the initialization function to start the program
initializeProgram();

