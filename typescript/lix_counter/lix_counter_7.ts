/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the LIX (Lesbarhetsindex in Swedish) readability score of a given text.
 * The LIX score is a readability measure that is used to determine the complexity of a text.
 * The formula for calculating the LIX score is:
 * 
 * LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * 
 * A word is considered long if it has more than 6 characters.
 * 
 * The program will take a text input, process it to count the number of words, sentences, and long words,
 * and then calculate and display the LIX score.
 */

function countWords(text: string): number {
    // Split the text by spaces and filter out any empty strings
    const words = text.split(/\s+/).filter(word => word.length > 0);
    return words.length;
}

function countSentences(text: string): number {
    // Split the text by sentence-ending punctuation marks and filter out any empty strings
    const sentences = text.split(/[.!?]/).filter(sentence => sentence.length > 0);
    return sentences.length;
}

function countLongWords(text: string): number {
    // Split the text by spaces and count words with more than 6 characters
    const longWords = text.split(/\s+/).filter(word => word.length > 6);
    return longWords.length;
}

function calculateLix(text: string): number {
    const numberOfWords = countWords(text);
    const numberOfSentences = countSentences(text);
    const numberOfLongWords = countLongWords(text);

    // Calculate the LIX score using the formula
    const lix = (numberOfWords / numberOfSentences) + (numberOfLongWords * 100 / numberOfWords);
    return lix;
}

// Example usage of the Lix Counter Program
const sampleText = "This is a sample text. It contains multiple sentences, and some long words like readability and complexity.";
const lixScore = calculateLix(sampleText);
console.log(`The LIX score of the sample text is: ${lixScore}`);

