/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words and sentences in a given text,
 * and then calculate the Lix readability index based on these counts. The Lix index is
 * a readability measure that is commonly used to assess the complexity of a text.
 * 
 * The Lix formula is:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A long word is defined as a word with more than 6 characters.
 * 
 * The program will take a text input, count the words, sentences, and long words,
 * and then calculate and display the Lix index.
 */

// Function to count the number of words in a text
function countWords(text) {
    // Split the text by spaces and filter out any empty strings
    let words = text.split(' ').filter(word => word.length > 0);
    return words.length;
}

// Function to count the number of sentences in a text
function countSentences(text) {
    // Split the text by sentence-ending punctuation marks
    let sentences = text.split(/[.!?]/).filter(sentence => sentence.length > 0);
    return sentences.length;
}

// Function to count the number of long words in a text
function countLongWords(text) {
    // Split the text by spaces and filter out words with 6 or fewer characters
    let longWords = text.split(' ').filter(word => word.length > 6);
    return longWords.length;
}

// Function to calculate the Lix index
function calculateLix(text) {
    let wordCount = countWords(text);
    let sentenceCount = countSentences(text);
    let longWordCount = countLongWords(text);

    // Calculate the Lix index using the formula
    let lix = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount);
    return lix;
}

// Example usage of the Lix Counter program
let sampleText = "This is a sample text. It contains several sentences, and some long words as well.";
let lixIndex = calculateLix(sampleText);
console.log("Lix Index:", lixIndex);

