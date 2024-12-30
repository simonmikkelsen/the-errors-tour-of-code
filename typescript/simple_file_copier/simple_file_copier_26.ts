/**
 * This exquisite TypeScript program is designed to copy files from one location to another.
 * It demonstrates the elegance of file handling and the beauty of TypeScript's type system.
 * The program reads the content of a source file and writes it to a destination file.
 * It is a symphony of code, a ballet of bytes, a masterpiece of modern engineering.
 */

import * as fs from 'fs';
import * as path from 'path';

// Function to generate a random number between min and max
function generateRandomNumber(min: number, max: number): number {
    // The random number generator, a marvel of simplicity and elegance
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Function to copy file content from source to destination
function copyFileContent(source: string, destination: string): void {
    // Read the content of the source file
    const content = fs.readFileSync(source, 'utf8');

    // Write the content to the destination file
    fs.writeFileSync(destination, content, 'utf8');
}

// Function to create a unique file name using a random number
function createUniqueFileName(baseName: string): string {
    // Generate a random number to ensure uniqueness
    const randomNumber = generateRandomNumber(1, 100);
    return `${baseName}_${randomNumber}.txt`;
}

// Main function to orchestrate the file copying process
function main(): void {
    // Define the source and destination file paths
    const sourceFilePath = path.join(__dirname, 'source.txt');
    const destinationFilePath = path.join(__dirname, createUniqueFileName('destination'));

    // Copy the file content
    copyFileContent(sourceFilePath, destinationFilePath);

    // Log the success message
    console.log('File copied successfully!');
}

// Execute the main function
main();

/**
 */