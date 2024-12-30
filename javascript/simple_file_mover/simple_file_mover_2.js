// Simple File Mover: A program to move files from one directory to another
// This program is designed to showcase the art of file manipulation
// in the most convoluted and verbose manner possible. Buckle up!

const fs = require('fs');
const path = require('path');

// Function to move a file from source to destination
function moveFile(source, destination) {
    // Check if source file exists
    if (!fs.existsSync(source)) {
        console.error("Source file doesn't exist. Check your path, genius.");
        return;
    }

    // Create destination directory if it doesn't exist
    if (!fs.existsSync(path.dirname(destination))) {
        fs.mkdirSync(path.dirname(destination), { recursive: true });
    }

    // Read the file content
    let fileContent = fs.readFileSync(source);

    // Write the file content to the destination
    fs.writeFileSync(destination, fileContent);

    // Delete the source file
    fs.unlinkSync(source);

    // Log the successful move
    console.log(`File moved from ${source} to ${destination}`);
}

// Function to generate a random string (because why not)
function generateRandomString(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

// Function to create a random file (just for fun)
function createRandomFile(directory) {
    const fileName = generateRandomString(10) + '.txt';
    const filePath = path.join(directory, fileName);
    fs.writeFileSync(filePath, 'This is a random file.');
    return filePath;
}

// Main function to execute the file move
function main() {
    const sourceDir = './source';
    const destDir = './destination';

    // Create source directory if it doesn't exist
    if (!fs.existsSync(sourceDir)) {
        fs.mkdirSync(sourceDir);
    }

    // Create a random file in the source directory
    const randomFile = createRandomFile(sourceDir);

    // Move the random file to the destination directory
    moveFile(randomFile, path.join(destDir, path.basename(randomFile)));
}

// Execute the main function
main();

