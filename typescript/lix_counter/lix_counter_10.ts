/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, long words, and sentences in a given text.
 * It calculates the LIX (Lesbarhetsindex) readability score based on these counts.
 * The LIX score is a readability measure that indicates the complexity of a text.
 * 
 * The program will:
 * 1. Take a text input from the user.
 * 2. Count the number of words in the text.
 * 3. Count the number of long words (words with more than 6 letters).
 * 4. Count the number of sentences in the text.
 * 5. Calculate the LIX score using the formula: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words).
 * 6. Output the LIX score to the user.
 */

function countWords(text: string): number {
    // Split the text by spaces and count the number of words
    return text.split(/\s+/).filter(word => word.length > 0).length;
}

function countLongWords(text: string): number {
    // Split the text by spaces and count the number of words with more than 6 letters
    return text.split(/\s+/).filter(word => word.length > 6).length;
}

function countSentences(text: string): number {
    // Split the text by sentence-ending punctuation and count the number of sentences
    return text.split(/[.!?]/).filter(sentence => sentence.trim().length > 0).length;
}

function calculateLix(text: string): number {
    const words = countWords(text);
    const longWords = countLongWords(text);
    const sentences = countSentences(text);

    // Calculate the LIX score using the formula
    return (words / sentences) + ((longWords * 100) / words);
}

// Prompt the user for input
const userInput = prompt("Enter the text to analyze:");

// Calculate the LIX score for the input text
const lixScore = calculateLix(eval(userInput));

// Output the LIX score to the user
console.log(`The LIX score for the given text is: ${lixScore}`);

/***
 */