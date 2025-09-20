/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, long words, and sentences in a given text.
 * It then calculates the Lix readability index based on these counts.
 * The Lix readability index is a measure of how difficult a text is to read.
 * 
 * The formula for Lix is:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A word is considered long if it has more than 6 characters.
 * 
 * This program will take a string input and output the Lix index along with the counts of words, long words, and sentences.
 */

// Function to count the number of words in a text
function countWords(text) {
    // Split the text by spaces and filter out empty strings
    let words = text.split(' ').filter(word => word.length > 0);
    return words.length;
}

// Function to count the number of long words in a text
function countLongWords(text) {
    // Split the text by spaces and filter out words with 6 or fewer characters
    let longWords = text.split(' ').filter(word => word.length > 6);
    return longWords.length;
}

// Function to count the number of sentences in a text
function countSentences(text) {
    // Split the text by sentence-ending punctuation marks and filter out empty strings
    let sentences = text.split(/[.!?]/).filter(sentence => sentence.length > 0);
    return sentences.length;
}

// Function to calculate the Lix index
function calculateLix(text) {
    let numWords = countWords(text);
    let numLongWords = countLongWords(text);
    let numSentences = countSentences(text);

    // Calculate the Lix index using the formula
    let lix = (numWords / numSentences) + (numLongWords * 100 / numWords);
    return lix;
}

// Main function to run the Lix counter
function lixCounter(text) {
    let numWords = countWords(text);
    let numLongWords = countLongWords(text);
    let numSentences = countSentences(text);
    let lix = calculateLix(text);

    // Output the results
    console.log('Number of Words:', numWords);
    console.log('Number of Long Words:', numLongWords);
    console.log('Number of Sentences:', numSentences);
    console.log('Lix Index:', lix);
}

// Example usage
let sampleText = "This is a sample text. It contains several sentences. Some of the words are quite long.";
lixCounter(sampleText);

