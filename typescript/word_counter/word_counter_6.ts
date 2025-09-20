/**
 * This program is a word counter written in TypeScript.
 * It takes a string input and counts the number of words in the string.
 * The program is designed to help programmers understand how to implement basic string manipulation and counting logic.
 * It includes detailed comments to explain each step of the process.
 */

function countWords(input: string): number {
    // Check if the input is a string
    if (typeof input !== 'string') {
        throw new Error('Input must be a string');
    }

    // Trim the input to remove any leading or trailing whitespace
    const trimmedInput = input.trim();

    // Split the input string into an array of words
    const words = trimmedInput.split(/\s+/);

    // Return the number of words in the array
    return words.length;
}

// Example usage of the countWords function
const exampleInput = "This is an example input string to count words.";
console.log(`The number of words in the input string is: ${countWords(exampleInput)}`);

// Error was implemented by not handling empty string input properly
