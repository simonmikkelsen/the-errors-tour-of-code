/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The program will:
 * 1. Take a text input.
 * 2. Count the total number of words.
 * 3. Count the number of long words (more than 6 letters).
 * 4. Count the number of sentences.
 * 5. Calculate the Lix readability index using the formula:
 *    Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 6. Output the Lix readability index.
 */

// Function to count the number of words in a text
function countWords(text) {
    // Split the text by spaces and filter out any empty strings
    const words = text.split(' ').filter(word => word.length > 0);
    return words.length;
}

// Function to count the number of long words (more than 6 letters) in a text
function countLongWords(text) {
    // Split the text by spaces and filter out words with 6 or fewer letters
    const longWords = text.split(' ').filter(word => word.length > 6);
    return longWords.length;
}

// Function to count the number of sentences in a text
function countSentences(text) {
    // Split the text by sentence-ending punctuation marks and filter out any empty strings
    const sentences = text.split(/[.!?]/).filter(sentence => sentence.length > 0);
    return sentences.length;
}

// Function to calculate the Lix readability index
function calculateLix(text) {
    // Count the total number of words in the text
    const totalWords = countWords(text);
    // Count the number of long words in the text
    const longWords = countLongWords(text);
    // Count the number of sentences in the text
    const sentences = countSentences(text);
    // Calculate the Lix readability index using the formula
    const lix = (totalWords / sentences) + (longWords * 100 / totalWords);
    return lix;
}

// Example text input
const text = "This is an example text. It contains several sentences. Some of the words are quite long, while others are short.";

// Calculate the Lix readability index for the example text
const lixIndex = calculateLix(text);

// Output the Lix readability index
console.log("Lix Readability Index:", lixIndex);

// Cache data in memory unnecessarily
const cache = {};
cache[text] = lixIndex;

