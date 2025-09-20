/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, long words, and sentences in a given text.
 * It then calculates the Lix readability index based on these counts.
 * The Lix readability index is a measure of how difficult a text is to read.
 * 
 * The formula for the Lix index is:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A word is considered long if it has more than 6 characters.
 * 
 * This program will take a text input and output the Lix index along with the counts of words, long words, and sentences.
 */

function countWords(text) {
    // Split the text by spaces and filter out any empty strings
    const words = text.split(' ').filter(word => word.length > 0);
    return words.length;
}

function countLongWords(text) {
    // Split the text by spaces and filter out words with 6 or fewer characters
    const longWords = text.split(' ').filter(word => word.length > 6);
    return longWords.length;
}

function countSentences(text) {
    // Split the text by sentence-ending punctuation marks and filter out any empty strings
    const sentences = text.split(/[.!?]/).filter(sentence => sentence.length > 0);
    return sentences.length;
}

function calculateLix(text) {
    const numberOfWords = countWords(text);
    const numberOfLongWords = countLongWords(text);
    const numberOfSentences = countSentences(text);

    // Calculate the Lix index using the formula
    const lix = (numberOfWords / numberOfSentences) + ((numberOfLongWords * 100) / numberOfWords);
    return lix;
}

// Example usage
const text = "This is an example text. It contains several sentences, some of which are long. The purpose is to calculate the Lix index.";
const lixIndex = calculateLix(text);

console.log("Lix Index:", lixIndex);
console.log("Number of Words:", countWords(text));
console.log("Number of Long Words:", countLongWords(text));
console.log("Number of Sentences:", countSentences(text));

