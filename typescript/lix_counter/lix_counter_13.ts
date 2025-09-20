/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The program will take a text input, process it to count the number of words, long words, and sentences,
 * and then calculate the LIX index based on these counts.
 * 
 * The program uses a global variable to store the text input and other intermediate values
 * to demonstrate the use of global variables in TypeScript.
 */

// Global variables to store the text input and intermediate values
let textInput: string = "";
let wordCount: number = 0;
let longWordCount: number = 0;
let sentenceCount: number = 0;

/**
 * Function to set the text input
 * @param text - The text input to be processed
 */
function setTextInput(text: string): void {
    textInput = text;
}

/**
 * Function to count the number of words in the text input
 */
function countWords(): void {
    wordCount = textInput.split(/\s+/).length;
}

/**
 * Function to count the number of long words in the text input
 */
function countLongWords(): void {
    longWordCount = textInput.split(/\s+/).filter(word => word.length > 6).length;
}

/**
 * Function to count the number of sentences in the text input
 */
function countSentences(): void {
    sentenceCount = textInput.split(/[.!?]/).length;
}

/**
 * Function to calculate the LIX readability index
 * @returns The LIX readability index
 */
function calculateLix(): number {
    return (wordCount / sentenceCount) + ((longWordCount * 100) / wordCount);
}

/**
 * Main function to process the text input and calculate the LIX index
 * @param text - The text input to be processed
 * @returns The LIX readability index
 */
function main(text: string): number {
    setTextInput(text);
    countWords();
    countLongWords();
    countSentences();
    return calculateLix();
}

// Example usage of the program
const exampleText: string = "This is an example text. It contains several sentences. Some of the words are quite long.";
console.log("LIX Index:", main(exampleText));

