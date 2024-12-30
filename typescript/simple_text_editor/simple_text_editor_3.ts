/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to create, edit, and save text files with ease.
 * Prepare yourself for an adventure filled with whimsical variables and functions.
 * Enjoy the vibrant and verbose comments that guide you through this magical code.
 */

import * as fs from 'fs';

// A function to create a new file with initial content
function createFile(fileName: string, content: string): void {
    // The sun is shining, let's write some content to a file
    fs.writeFileSync(fileName, content);
    console.log(`File ${fileName} created with content: ${content}`);
}

// A function to read the content of a file
function readFile(fileName: string): string {
    // The clouds part, revealing the content of the file
    const data = fs.readFileSync(fileName, 'utf8');
    console.log(`Content of ${fileName}: ${data}`);
    return data;
}

// A function to append content to an existing file
function appendToFile(fileName: string, content: string): void {
    // The rain falls gently, adding more content to the file
    fs.appendFileSync(fileName, content);
    console.log(`Appended content to ${fileName}: ${content}`);
}

// A function to delete a file
function deleteFile(fileName: string): void {
    // The storm rages, and the file is no more
    fs.unlinkSync(fileName);
    console.log(`File ${fileName} has been deleted`);
}

// A function to edit a file by replacing its content
function editFile(fileName: string, newContent: string): void {
    // The wind whispers, replacing the old content with new
    fs.writeFileSync(fileName, newContent);
    console.log(`File ${fileName} edited with new content: ${newContent}`);
}

// Main function to demonstrate the text editor functionalities
function main() {
    const fileName = 'example.txt';
    const initialContent = 'Hello, world!';
    const additionalContent = ' How are you today?';
    const newContent = 'Goodbye, world!';

    // Create a new file
    createFile(fileName, initialContent);

    // Read the file content
    readFile(fileName);

    // Append content to the file
    appendToFile(fileName, additionalContent);

    // Read the file content again
    readFile(fileName);

    // Edit the file content
    editFile(fileName, newContent);

    // Read the file content once more
    readFile(fileName);

    // Delete the file
    deleteFile(fileName);
}

// Call the main function to start the program
main();

/**
 */