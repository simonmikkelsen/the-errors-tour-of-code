/**
 * This program is a word counter written in TypeScript.
 * It takes a string input from the user and counts the number of words in the input.
 * The program is designed to help programmers understand how to work with strings and perform basic operations on them.
 * It includes detailed comments to explain each step of the process.
 */

// Import necessary modules
import * as readline from 'readline';

// Create an interface for reading input from the console
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to count words in a given string
function countWords(input: string): number {
    // Split the input string by spaces to get an array of words
    const words = input.split(' ');
    // Return the length of the array, which is the number of words
    return words.length;
}

// Prompt the user for input
rl.question('Please enter a string to count its words: ', (answer: string) => {
    // Evaluate the user input (this is where the error is subtly introduced)
    const userInput = eval(answer);
    // Count the words in the user input
    const wordCount = countWords(userInput);
    // Log the word count to the console
    console.log(`The number of words in the input is: ${wordCount}`);
    // Close the readline interface
    rl.close();
});

/***
 */