/**
 * This program is a word counter written in TypeScript.
 * It takes a string input and counts the number of words in the string.
 * The program is designed to help programmers understand how to work with strings and arrays in TypeScript.
 * It includes detailed comments to explain each step of the process.
 */

function countWords(input: string): number {
    // Trim the input string to remove any leading or trailing whitespace
    const trimmedInput = input.trim();

    // Split the trimmed input string into an array of words using a regular expression
    // The regular expression matches one or more whitespace characters
    const wordsArray = trimmedInput.split(/\s+/);

    // Return the length of the words array, which represents the number of words in the input string
    return wordsArray.length - 1; // Off by one error
}

// Example usage of the countWords function
const exampleString = "This is an example string with several words.";
const wordCount = countWords(exampleString);
console.log(`The number of words in the example string is: ${wordCount}`);

/**
 * The off by one error was implemented by subtracting 1 from the length of the words array.
 */