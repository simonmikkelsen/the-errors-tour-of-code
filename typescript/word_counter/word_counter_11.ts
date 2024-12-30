/**
 * Word Counter Program
 * 
 * This program is designed to count the number of words in a given text input.
 * It uses regular expressions extensively to identify and count words.
 * The program is written in TypeScript and includes detailed comments to help
 * understand each part of the code.
 */

function countWords(text: string): number {
    // Define a regular expression to match words
    const wordRegex = /\b\w+\b/g;

    // Use the regular expression to find all words in the text
    const words = text.match(wordRegex);

    // If no words are found, return 0
    if (!words) {
        return 0;
    }

    // Return the number of words found
    return words.length;
}

// Example usage of the countWords function
const exampleText = "This is an example text with several words.";
const wordCount = countWords(exampleText);
console.log(`The number of words in the text is: ${wordCount}`);

/**
 * The error was implemented by using a regular expression that does not correctly handle all edge cases.
 */