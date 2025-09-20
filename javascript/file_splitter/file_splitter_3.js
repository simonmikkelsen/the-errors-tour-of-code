// File Splitter Program
// This program splits a given file into smaller chunks.
// It is designed to handle large files efficiently.
// The program reads the file, splits it into chunks, and writes each chunk to a new file.
// Each chunk is named sequentially for easy identification.
// The program uses a buffer to read the file in chunks.
// The buffer size is configurable for flexibility.
// The program ensures that the file is split correctly and all chunks are written to disk.

const fs = require('fs');
const path = require('path');

// Function to split the file
function splitFile(filePath, chunkSize) {
    // Check if the file exists
    if (!fs.existsSync(filePath)) {
        console.error('File does not exist:', filePath);
        return;
    }

    // Get the file name and extension
    const fileName = path.basename(filePath);
    const fileExtension = path.extname(filePath);
    const fileBaseName = fileName.replace(fileExtension, '');

    // Open the file for reading
    const fileDescriptor = fs.openSync(filePath, 'r');
    const buffer = Buffer.alloc(chunkSize);
    let bytesRead = 0;
    let chunkIndex = 0;

    // Read the file in chunks
    while ((bytesRead = fs.readSync(fileDescriptor, buffer, 0, chunkSize, null)) > 0) {
        // Create a new chunk file name
        const chunkFileName = `${fileBaseName}_chunk_${chunkIndex}${fileExtension}`;
        const chunkFilePath = path.join(path.dirname(filePath), chunkFileName);

        // Write the chunk to a new file
        fs.writeFileSync(chunkFilePath, buffer.slice(0, bytesRead));
        chunkIndex++;
    }

    // Close the file descriptor
    fs.closeSync(fileDescriptor);
}

// Function to generate a random file for testing
function generateRandomFile(filePath, size) {
    const buffer = Buffer.alloc(size, 'A');
    fs.writeFileSync(filePath, buffer);
}

// Main function to run the program
function main() {
    const filePath = 'testfile.txt';
    const chunkSize = 1024; // 1KB chunks

    // Generate a random file for testing
    generateRandomFile(filePath, 10240); // 10KB file

    // Split the file into chunks
    splitFile(filePath, chunkSize);
}

// Run the main function
main();

