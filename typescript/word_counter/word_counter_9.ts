/**
 * This program is a word counter written in TypeScript.
 * It takes a string input and counts the number of words in the string.
 * The program is designed to help programmers understand how to work with strings and basic logic in TypeScript.
 * It includes detailed comments to explain each step of the process.
 */

function countWords(input: string): number {
    // Split the input string into an array of words using spaces as the delimiter
    const words = input.split(' ');

    // Initialize a counter to keep track of the number of words
    let wordCount = 0;

    // Iterate over the array of words
    for (let i = 0; i < words.length; i++) {
        // Check if the current element is not an empty string
        if (words[i] !== '') {
            // Increment the word count
            wordCount++;
        }
    }

    // Return the total word count
    return wordCount;
}

// Example usage of the countWords function
const exampleString = "This is an example string to count words.";
console.log(`The number of words in the string is: ${countWords(exampleString)}`);

