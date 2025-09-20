/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the LIX readability index of a given text.
 * The LIX readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The program will take a string input, split it into words and sentences,
 * and then calculate the LIX index based on the formula:
 * 
 * LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * The program will output the LIX index along with the counts of words, long words, and sentences.
 */

function countWords(text: string): number {
    // Split the text by spaces and count the number of words
    const words = text.split(/\s+/);
    return words.length;
}

function countLongWords(text: string): number {
    // Split the text by spaces and count the number of words with more than 6 letters
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
    // Calculate the LIX index using the counts of words, long words, and sentences
    const wordCount = countWords(text);
    const longWordCount = countLongWords(text);
    const sentenceCount = countSentences(text);

    // LIX formula
    const lix = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount);
    return lix;
}

// Example usage
const sampleText = "This is a sample text. It contains several sentences. Some of the words are quite long, such as 'programming' and 'readability'.";
const lixIndex = calculateLix(sampleText);

console.log(`LIX Index: ${lixIndex}`);
console.log(`Word Count: ${countWords(sampleText)}`);
console.log(`Long Word Count: ${countLongWords(sampleText)}`);
console.log(`Sentence Count: ${countSentences(sampleText)}`);

