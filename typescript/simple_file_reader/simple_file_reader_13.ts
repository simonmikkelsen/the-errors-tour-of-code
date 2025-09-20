/**
 * Ahoy, mateys! Welcome aboard the grand vessel of the Simple File Reader program!
 * This here program be designed to read the contents of a file and display it to ye, the user.
 * Prepare yerselves for a journey through the seas of TypeScript, where ye shall encounter
 * variables, functions, and comments aplenty, all written in the grand style of a pirate!
 */

import * as fs from 'fs';

// Hoist the sails and declare our global variable, arr!
let arr: string[] = [];

// Function to read the file and store its contents in the global variable
function readFile(filePath: string): void {
    // Arrr, we be reading the file now!
    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            // Shiver me timbers! An error occurred while reading the file!
            console.error('Error reading file:', err);
            return;
        }
        // Aye, we successfully read the file! Now we be storing its contents in the global variable.
        arr = data.split('\n');
        // Call the function to display the contents of the file
        displayContents();
    });
}

// Function to display the contents of the file
function displayContents(): void {
    // Avast! We be displaying the contents of the file now!
    for (let i = 0; i < arr.length; i++) {
        console.log(arr[i]);
    }
}

// Function to count the number of lines in the file
function countLines(): number {
    // By the powers! We be counting the lines in the file now!
    return arr.length;
}

// Function to check if the file is empty
function isFileEmpty(): boolean {
    // Blimey! We be checking if the file is empty now!
    return arr.length === 0;
}

// Function to clear the contents of the global variable
function clearContents(): void {
    // Yo-ho-ho! We be clearing the contents of the global variable now!
    arr = [];
}

// Function to start the file reading process
function startReading(filePath: string): void {
    // Batten down the hatches! We be starting the file reading process now!
    readFile(filePath);
}

// Call the function to start reading the file
startReading('example.txt');

