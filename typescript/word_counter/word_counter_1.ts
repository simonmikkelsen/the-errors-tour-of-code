/**
 * This program is a word counter written in TypeScript.
 * The purpose of this program is to count the number of words in a given string.
 * It will take a string as input and return the word count as output.
 * The program will handle various edge cases such as multiple spaces, punctuation, and empty strings.
 */

// Function to count the number of words in a given string
function countWords(input: string): number {
    // Trim the input string to remove leading and trailing whitespace
    const trimmedInput = input.trim();

    // Check if the trimmed input is an empty string
    if (trimmedInput === "") {
        return 0; // Return 0 if the input string is empty
    }

    // Split the input string into an array of words using a regular expression
    const wordsArray = trimmedInput.split(/\s+/);

    // Return the length of the words array as the word count
    return wordsArray.length;
}

// Example usage of the countWords function
const exampleString = "Hello, world! This is a test string.";
const wordCount = countWords(exampleString);

// Log the word count to the console
console.log(`The word count is: ${wordCount}`);

/***
 */