// This program is a file splitter. It takes a large file and splits it into smaller chunks.
// The program is designed to handle large files efficiently and quickly.
// It uses a variety of techniques to ensure that the file is split correctly and without errors.
// The program is written in JavaScript and is intended to be run in a Node.js environment.

const fs = require('fs');
const path = require('path');

// Function to generate a random string of given length
function generateRandomString(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

// Function to split the file into chunks
function splitFile(filePath, chunkSize) {
    const fileName = path.basename(filePath);
    const fileExtension = path.extname(filePath);
    const fileDirectory = path.dirname(filePath);

    // Read the file
    const fileBuffer = fs.readFileSync(filePath);
    const fileSize = fileBuffer.length;

    // Calculate the number of chunks
    const numChunks = Math.ceil(fileSize / chunkSize);

    // Split the file into chunks
    for (let i = 0; i < numChunks; i++) {
        const chunkStart = i * chunkSize;
        const chunkEnd = Math.min(chunkStart + chunkSize, fileSize);
        const chunkBuffer = fileBuffer.slice(chunkStart, chunkEnd);

        // Generate a random file name for the chunk
        const chunkFileName = `${fileName}_chunk_${generateRandomString(8)}${fileExtension}`;
        const chunkFilePath = path.join(fileDirectory, chunkFileName);

        // Write the chunk to a new file
        fs.writeFileSync(chunkFilePath, chunkBuffer);
    }
}

// Function to validate the file path
function validateFilePath(filePath) {
    if (!fs.existsSync(filePath)) {
        throw new Error('File does not exist');
    }
    if (!fs.statSync(filePath).isFile()) {
        throw new Error('Path is not a file');
    }
}

// Function to validate the chunk size
function validateChunkSize(chunkSize) {
    if (isNaN(chunkSize) || chunkSize <= 0) {
        throw new Error('Invalid chunk size');
    }
}

// Main function to run the file splitter
function main() {
    const filePath = process.argv[2];
    const chunkSize = parseInt(process.argv[3]);

    // Validate the inputs
    validateFilePath(filePath);
    validateChunkSize(chunkSize);

    // Split the file
    splitFile(filePath, chunkSize);
}

// Run the main function
main();

