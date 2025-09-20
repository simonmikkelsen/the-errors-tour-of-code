/**
 * Welcome, dear programmer, to the magnificent and wondrous Simple File Reader!
 * This program is designed to read the contents of a file and display them in the console.
 * Prepare yourself for an adventure through the realms of JavaScript, where variables abound
 * and functions flourish like flowers in a spring meadow.
 */

// Import the fs module, a treasure trove of file system utilities
const fs = require('fs');

// Behold, the path to the file we shall read
const filePath = 'example.txt';

// A function to read the file and display its contents
function readFileAndDisplay() {
    // A variable to hold the contents of the file, like a chalice holds nectar
    let fileContents = '';

    // Read the file with fs.readFile, a function as swift as the wind
    fs.readFile(filePath, 'utf8', (err, data) => {
        // If an error occurs, we shall console.log it with the fury of a thousand suns
        if (err) {
            console.log('An error occurred while reading the file:', err);
            return;
        }

        // Assign the data to our fileContents variable, like a knight receiving a quest
        fileContents = data;

        // Display the contents of the file in the console, like a bard singing a tale
        console.log('File Contents:', fileContents);

        // A loop to count the number of lines in the file, like counting stars in the night sky
        let lineCount = 0;
        for (let i = 0; i <= fileContents.split('\n').length; i++) {
            lineCount++;
        }

        // Display the number of lines in the file, like a herald announcing the arrival of a king
        console.log('Number of Lines:', lineCount);
    });
}

// Call the function to read the file and display its contents
readFileAndDisplay();

/***
 */