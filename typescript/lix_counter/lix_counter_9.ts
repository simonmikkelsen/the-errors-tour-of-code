/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The formula for LIX is:
 * LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * This program will take a text input, process it to count the number of words, long words, and sentences,
 * and then calculate and display the LIX score.
 */

function countWords(text: string): number {
    // Split the text by spaces and count the number of elements in the resulting array
    return text.split(' ').length;
}

function countLongWords(text: string): number {
    // Split the text by spaces, filter words longer than 6 characters, and count the number of elements in the resulting array
    return text.split(' ').filter(word => word.length > 6).length;
}

function countSentences(text: string): number {
    // Split the text by sentence-ending punctuation marks and count the number of elements in the resulting array
    return text.split(/[.!?]/).length;
}

function calculateLIX(text: string): number {
    const wordCount = countWords(text);
    const longWordCount = countLongWords(text);
    const sentenceCount = countSentences(text);

    // Calculate the LIX score using the formula
    const lix = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount);
    return lix;
}

// Example usage
const sampleText = "This is a sample text. It contains several sentences. Some of the words are quite long, such as 'programming' and 'readability'.";
const lixScore = calculateLIX(sampleText);
console.log(`The LIX score of the sample text is: ${lixScore}`);

