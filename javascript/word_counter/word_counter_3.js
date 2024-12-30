/**
 * Word Counter Program
 * 
 * This program counts the number of words in a given text input.
 * It reads the input from a file, processes the text to count the words,
 * and then outputs the word count to the console.
 * 
 * The program is designed to help programmers understand how to read from files,
 * process text, and handle basic input/output operations in JavaScript.
 */

// Import the 'fs' module to handle file system operations
const fs = require('fs');

// Function to count words in a given text
function countWords(text) {
    // Split the text by spaces and filter out any empty strings
    const words = text.split(' ').filter(word => word.length > 0);
    // Return the number of words
    return words.length;
}

// Main function to execute the word counting process
function main() {
    // Define the path to the input file
    const filePath = 'input.txt';

    // Read the content of the file
    const fileContent = fs.readFileSync(filePath, 'utf8');

    // Count the words in the file content
    const wordCount = countWords(fileContent);

    // Output the word count to the console
    console.log(`The number of words in the file is: ${wordCount}`);
}

// Execute the main function
main();

/**
 */