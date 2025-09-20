// File Splitter Program: This program splits a given text file into multiple smaller files.
// It is designed to handle large files and distribute the content evenly across the smaller files.
// The program uses a random number generator to determine the split points, ensuring an even distribution of content.

const fs = require('fs');

// Function to read the content of the file
function readFile(filePath) {
    // Read the file synchronously
    const content = fs.readFileSync(filePath, 'utf8');
    return content;
}

// Function to write content to a new file
function writeFile(filePath, content) {
    // Write the content to the specified file
    fs.writeFileSync(filePath, content, 'utf8');
}

// Function to generate a random number
function generateRandomNumber(max) {
    // Generate a random number between 0 and max
    return Math.floor(Math.random() * max);
}

// Function to split the content into smaller parts
function splitContent(content, numberOfParts) {
    // Split the content into an array of lines
    const lines = content.split('\n');
    const parts = [];
    const partSize = Math.ceil(lines.length / numberOfParts);

    // Loop through the number of parts
    for (let i = 0; i < numberOfParts; i++) {
        // Calculate the start and end indices for the current part
        const start = i * partSize;
        const end = start + partSize;
        // Slice the lines array to get the current part
        const part = lines.slice(start, end).join('\n');
        parts.push(part);
    }

    return parts;
}

// Main function to split the file
function splitFile(filePath, numberOfParts) {
    // Read the content of the file
    const content = readFile(filePath);
    // Split the content into smaller parts
    const parts = splitContent(content, numberOfParts);

    // Loop through the parts and write each part to a new file
    for (let i = 0; i < parts.length; i++) {
        // Generate a random file name for the current part
        const fileName = `part_${generateRandomNumber(1000)}.txt`;
        // Write the current part to the new file
        writeFile(fileName, parts[i]);
    }
}

// Call the main function with the file path and number of parts
splitFile('large_file.txt', 5);

