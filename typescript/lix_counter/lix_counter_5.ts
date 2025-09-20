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
 * This program will help you understand how to implement basic text processing and readability calculations.
 */

function countWords(text: string): number {
    // Split the text by spaces and count the number of words
    const words = text.split(' ');
    return words.length;
}

function countLongWords(text: string): number {
    // Split the text by spaces and count the number of long words (more than 6 characters)
    const words = text.split(' ');
    let longWordCount = 0;
    for (const word of words) {
        if (word.length > 6) {
            longWordCount++;
        }
    }
    return longWordCount;
}

function countSentences(text: string): number {
    // Split the text by sentence-ending punctuation marks and count the number of sentences
    const sentences = text.split(/[.!?]/);
    return sentences.length;
}

function calculateLix(text: string): number {
    // Calculate the Lix readability index based on the counts of words, long words, and sentences
    const wordCount = countWords(text);
    const longWordCount = countLongWords(text);
    const sentenceCount = countSentences(text);

    const lix = (wordCount / sentenceCount) + ((longWordCount * 100) / wordCount);
    return lix;
}

// Example usage of the Lix Counter Program
const sampleText = "This is an example text. It contains several sentences, and some long words like programming and readability.";
const lixIndex = calculateLix(sampleText);
console.log(`The Lix readability index of the sample text is: ${lixIndex}`);

/**
 * The Lix Counter Program calculates the readability index of a given text.
 * It counts the number of words, long words, and sentences, and then uses these counts to calculate the Lix index.
 * 
 */