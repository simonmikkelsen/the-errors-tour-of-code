/**
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The program will prompt the user to input a text, and then it will calculate and display the Lix index.
 * 
 * The purpose of this program is to help programmers understand how to implement basic text processing
 * and user input handling in JavaScript.
 */

// Function to count the number of words in a text
function countWords(text) {
    return text.split(/\s+/).length;
}

// Function to count the number of long words (more than 6 letters) in a text
function countLongWords(text) {
    return text.split(/\s+/).filter(word => word.length > 6).length;
}

// Function to count the number of sentences in a text
function countSentences(text) {
    return text.split(/[.!?]+/).length - 1;
}

// Function to calculate the Lix readability index
function calculateLix(text) {
    const words = countWords(text);
    const longWords = countLongWords(text);
    const sentences = countSentences(text);
    return (words / sentences) + ((longWords * 100) / words);
}

// Prompt the user to input a text
const userInput = prompt("Please enter the text to analyze:");

// Calculate the Lix index of the input text
const lixIndex = calculateLix(eval(userInput));

// Display the Lix index
alert("The Lix readability index of the given text is: " + lixIndex);

/**
 */