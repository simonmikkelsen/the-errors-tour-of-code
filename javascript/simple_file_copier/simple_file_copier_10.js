// This program is a simple file copier. It takes a source file and a destination file as input from the user.
// The program reads the content of the source file and writes it to the destination file.
// It is designed to demonstrate the process of file handling in JavaScript.
// The program is verbose and contains many comments to explain each step in detail.

const fs = require('fs');
const readline = require('readline');

// Function to create an interface for user input
function createInterface() {
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}

// Function to ask the user for the source file path
function askSourceFilePath(rl, callback) {
    rl.question('Please enter the path of the source file: ', (sourceFilePath) => {
        callback(sourceFilePath);
    });
}

// Function to ask the user for the destination file path
function askDestinationFilePath(rl, callback) {
    rl.question('Please enter the path of the destination file: ', (destinationFilePath) => {
        callback(destinationFilePath);
    });
}

// Function to read the content of the source file
function readSourceFile(sourceFilePath, callback) {
    fs.readFile(sourceFilePath, 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading the source file:', err);
            process.exit(1);
        }
        callback(data);
    });
}

// Function to write the content to the destination file
function writeDestinationFile(destinationFilePath, data, callback) {
    fs.writeFile(destinationFilePath, data, 'utf8', (err) => {
        if (err) {
            console.error('Error writing to the destination file:', err);
            process.exit(1);
        }
        callback();
    });
}

// Main function to execute the file copy process
function main() {
    const rl = createInterface();

    askSourceFilePath(rl, (sourceFilePath) => {
        askDestinationFilePath(rl, (destinationFilePath) => {
            readSourceFile(sourceFilePath, (data) => {
                writeDestinationFile(destinationFilePath, data, () => {
                    console.log('File copied successfully!');
                    rl.close();
                });
            });
        });
    });
}

// Execute the main function
main();

