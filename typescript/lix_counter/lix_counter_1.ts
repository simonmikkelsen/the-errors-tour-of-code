/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The formula for Lix is:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * This program will take a text input, process it to count the number of words, long words, and sentences,
 * and then calculate and output the Lix readability index.
 */

function countWords(text: string): number {
    // Split the text by spaces and count the resulting array length to get the number of words
    return text.split(' ').length;
}

function countLongWords(text: string): number {
    // Split the text by spaces, filter words longer than 6 characters, and count the resulting array length
    return text.split(' ').filter(word => word.length > 6).length;
}

function countSentences(text: string): number {
    // Split the text by sentence-ending punctuation marks and count the resulting array length
    return text.split(/[.!?]/).length;
}

function calculateLix(text: string): number {
    // Count the number of words in the text
    const numberOfWords = countWords(text);
    // Count the number of long words in the text
    const numberOfLongWords = countLongWords(text);
    // Count the number of sentences in the text
    const numberOfSentences = countSentences(text);

    // Calculate the Lix readability index using the formula
    const lix = (numberOfWords / numberOfSentences) + (numberOfLongWords * 100 / numberOfWords);
    return lix;
}

// Example usage of the Lix Counter program
const exampleText = "This is an example text. It contains several sentences, some of which are quite long. The purpose is to calculate the Lix readability index.";
const lixIndex = calculateLix(exampleText);
console.log(`The Lix readability index of the given text is: ${lixIndex}`);

