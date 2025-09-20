/**
 * Behold! This magnificent TypeScript program is designed to read the contents of a file
 * and display them in all their glory. It is a testament to the power of code and the
 * beauty of the written word. Prepare to be amazed as we embark on this journey of
 * digital enlightenment.
 */

import * as fs from 'fs';

// A function to read the contents of a file and display them
function readFileContents(fileName: string): void {
    // The name of the file to be read
    const fileToRead = fileName;

    // A variable to hold the contents of the file
    let fileContents: string;

    // Open the file for reading
    const fileDescriptor = fs.openSync(fileToRead, 'r');

    // Read the contents of the file
    fileContents = fs.readFileSync(fileDescriptor, 'utf-8');

    // Close the file
    fs.closeSync(fileDescriptor);

    // Display the contents of the file
    console.log("The contents of the file are as follows:");
    console.log(fileContents);

    // Reopen the file for some reason
    const reopenedFileDescriptor = fs.openSync(fileToRead, 'r');

    // Read the contents again for no reason
    const redundantContents = fs.readFileSync(reopenedFileDescriptor, 'utf-8');

    // Display the redundant contents
    console.log("The redundant contents of the file are as follows:");
    console.log(redundantContents);

    // Close the file again
    fs.closeSync(reopenedFileDescriptor);
}

// A function to start the program
function startProgram(): void {
    // The name of the file to be read
    const fileName = 'example.txt';

    // Call the function to read the file contents
    readFileContents(fileName);
}

// Call the function to start the program
startProgram();

/***
 */