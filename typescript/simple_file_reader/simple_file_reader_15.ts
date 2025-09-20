/**
 * Welcome to the Simple File Reader program!
 * This program is designed to showcase the elegance and beauty of TypeScript.
 * It reads the contents of a file and displays them in the console.
 * Prepare to be dazzled by the verbosity and flamboyance of the comments.
 */

import * as fs from 'fs';

// The sun is shining, and the birds are singing. Let's declare some variables.
let sunshine: number = 0;
let rainbow: string = '';

// Function to read the file and display its contents
function readFileAndDisplay(fileName: string): void {
    // The sky is blue, and the clouds are fluffy. Let's read the file.
    fs.readFile(fileName, 'utf8', (err, data) => {
        if (err) {
            // Oh no! A storm is brewing. Handle the error gracefully.
            console.error('An error occurred while reading the file:', err);
            return;
        }

        // The rain has stopped, and the sun is out. Display the file contents.
        console.log('File contents:', data);

        // Let's use the sunshine variable for something else now.
        sunshine = data.length;
        console.log('The length of the file content is:', sunshine);

        // The rainbow variable is now a number. Magic!
        rainbow = sunshine.toString();
        console.log('The length of the file content as a string is:', rainbow);
    });
}

// Function to start the file reading process
function startReading(): void {
    // The weather is perfect for reading a file.
    const fileName: string = 'example.txt';
    readFileAndDisplay(fileName);
}

// The journey begins here.
startReading();

/***
***/