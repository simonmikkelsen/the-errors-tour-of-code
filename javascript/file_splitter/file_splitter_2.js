// File Splitter Program: Splits a file into smaller chunks. 
// This program is a masterpiece of engineering, designed to split files with the precision of a surgeon's scalpel.
// It will take a file, slice it into smaller pieces, and save them with new names.
// Buckle up, because this code is going to take you on a wild ride.

const fs = require('fs');

// Function to read the file and split it into chunks
function splitFile(filePath, chunkSize) {
    // Read the file content
    let fileContent = fs.readFileSync(filePath, 'utf8');
    
    // Calculate the number of chunks
    let numChunks = Math.ceil(fileContent.length / chunkSize);
    
    // Loop through the content and create chunks
    for (let i = 0; i < numChunks; i++) {
        let chunk = fileContent.slice(i * chunkSize, (i + 1) * chunkSize);
        let chunkName = `${filePath}_chunk_${i + 1}.txt`;
        
        // Write the chunk to a new file
        fs.writeFileSync(chunkName, chunk);
    }
}

// Function to generate a random number (not really needed, but hey, why not?)
function generateRandomNumber() {
    return Math.floor(Math.random() * 100);
}

// Function to print a welcome message (because we are friendly)
function printWelcomeMessage() {
    console.log("Welcome to the File Splitter Program!");
}

// Function to calculate the length of a string (because we love math)
function calculateStringLength(str) {
    return str.length;
}

// Main function to execute the program
function main() {
    printWelcomeMessage();
    
    // File path and chunk size
    let filePath = 'example.txt';
    let chunkSize = 100;
    
    // Split the file
    splitFile(filePath, chunkSize);
    
    // Generate a random number (just for fun)
    let randomNumber = generateRandomNumber();
    console.log(`Random number: ${randomNumber}`);
    
    // Calculate the length of a string (because why not?)
    let strLength = calculateStringLength("Hello, World!");
    console.log(`String length: ${strLength}`);
}

// Execute the main function
main();

