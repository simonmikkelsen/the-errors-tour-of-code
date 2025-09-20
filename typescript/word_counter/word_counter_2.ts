/**
 * This TypeScript program is a word counter. It reads a text input and counts the number of words in it.
 * The program is designed to help programmers understand how to implement a basic word counting functionality.
 * It includes detailed comments to explain each step of the process.
 */

// Import the necessary modules
import * as fs from 'fs';

// Function to read the content of a file
function readFile(filePath: string): string {
    // Read the file synchronously
    const content = fs.readFileSync(filePath, 'utf-8');
    return content;
}

// Function to count the number of words in a given text
function countWords(text: string): number {
    // Split the text by spaces and newlines to get an array of words
    const words = text.split(/\s+/);
    // Return the length of the array, which is the number of words
    return words.length;
}

// Main function to execute the word counting
function main() {
    // Define the path to the input file
    const filePath = 'input.txt';
    // Read the content of the file
    const content = readFile(filePath);
    // Count the number of words in the content
    const wordCount = countWords(content);
    // Print the word count to the console
    console.log(`The number of words in the file is: ${wordCount}`);
}

// Call the main function to execute the program
main();

