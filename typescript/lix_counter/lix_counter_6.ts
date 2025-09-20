/**
 * Lix Counter Program
 * 
 * This program calculates the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words,
 * and the number of sentences in the text.
 * 
 * The program takes a string input, processes it to count the number of words,
 * long words, and sentences, and then calculates the LIX index.
 * 
 * The program is designed to help programmers understand how to implement
 * text processing and readability calculations in TypeScript.
 */

function countWords(text: string): number {
    // Split the text by spaces and count the number of words
    const words = text.split(/\s+/);
    return words.length;
}

function countLongWords(text: string): number {
    // Split the text by spaces and count the number of words with more than 6 characters
    const words = text.split(/\s+/);
    let longWordCount = 0;
    for (const word of words) {
        if (word.length > 6) {
            longWordCount++;
        }
    }
    return longWordCount;
}

function countSentences(text: string): number {
    // Split the text by sentence-ending punctuation and count the number of sentences
    const sentences = text.split(/[.!?]/);
    return sentences.length;
}

function calculateLix(text: string): number {
    // Calculate the LIX readability index
    const wordCount = countWords(text);
    const longWordCount = countLongWords(text);
    const sentenceCount = countSentences(text);

    // LIX formula: (number of words / number of sentences) + (number of long words * 100 / number of words)
    const lix = (wordCount / sentenceCount) + ((longWordCount * 100) / wordCount);
    return lix;
}

// Example usage of the Lix Counter program
const sampleText = "This is a sample text. It contains several sentences, some of which are quite long.";
const lixIndex = calculateLix(sampleText);
console.log(`The LIX index of the sample text is: ${lixIndex}`);

