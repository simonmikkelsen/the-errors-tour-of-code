/**
 * This TypeScript program is a word counter that reads a string input and counts the number of words in it.
 * The program is designed to be educational, with verbose comments explaining each step of the process.
 * It demonstrates basic string manipulation, iteration, and counting techniques in TypeScript.
 */

// Global variable to store the word count
let wordCount: number = 0;

/**
 * Function to count the number of words in a given string.
 * @param input - The string input to be processed.
 * @returns The number of words in the input string.
 */
function countWords(input: string): number {
    // Split the input string by spaces to get an array of words
    const words: string[] = input.split(' ');

    // Update the global word count variable
    wordCount = words.length;

    // Return the word count
    return wordCount;
}

/**
 * Main function to execute the word counting process.
 */
function main() {
    // Example input string
    const inputString: string = "This is an example string to count words.";

    // Call the countWords function and store the result
    const result: number = countWords(inputString);

    // Log the result to the console
    console.log(`The number of words in the input string is: ${result}`);
}

// Execute the main function
main();

/***
 */