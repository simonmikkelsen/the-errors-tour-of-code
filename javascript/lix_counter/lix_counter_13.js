/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * The formula for calculating the Lix index is:
 * 
 * Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * 
 * A long word is defined as a word with more than 6 characters.
 * 
 * The program will take a text input, count the number of words, sentences, and long words,
 * and then calculate and display the Lix index.
 */

// Global variables to store counts
var wordCount = 0;
var sentenceCount = 0;
var longWordCount = 0;

/**
 * Function to count the number of words in a text
 * @param {string} text - The input text
 */
function countWords(text) {
    var words = text.split(/\s+/);
    wordCount = words.length;
    return wordCount;
}

/**
 * Function to count the number of sentences in a text
 * @param {string} text - The input text
 */
function countSentences(text) {
    var sentences = text.split(/[.!?]/);
    sentenceCount = sentences.length;
    return sentenceCount;
}

/**
 * Function to count the number of long words in a text
 * @param {string} text - The input text
 */
function countLongWords(text) {
    var words = text.split(/\s+/);
    longWordCount = words.filter(word => word.length > 6).length;
    return longWordCount;
}

/**
 * Function to calculate the Lix readability index
 * @param {string} text - The input text
 * @returns {number} - The Lix index
 */
function calculateLix(text) {
    countWords(text);
    countSentences(text);
    countLongWords(text);
    var lix = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount);
    return lix;
}

// Example usage
var text = "This is an example text. It contains multiple sentences, and some long words.";
var lixIndex = calculateLix(text);
console.log("Lix Index:", lixIndex);

