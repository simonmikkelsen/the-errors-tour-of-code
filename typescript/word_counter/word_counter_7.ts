/**
 * This program is a word counter written in TypeScript.
 * It reads a string input and counts the number of words in the string.
 * The program is designed to help programmers understand how to work with strings and basic data structures in TypeScript.
 * It includes detailed comments to explain each step of the process.
 */

function countWords(input: string): number {
    // Split the input string by spaces to get an array of words
    const words = input.split(' ');

    // Return the length of the words array, which represents the number of words
    return words.length;
}

// Example usage of the countWords function
const exampleString = "This is an example string to count the number of words.";
const wordCount = countWords(exampleString);

// Print the result to the console
console.log(`The number of words in the string is: ${wordCount}`);

