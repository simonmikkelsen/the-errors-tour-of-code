/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, long words, and sentences in a given text.
 * It then calculates the Lix readability index based on these counts.
 * 
 * The Lix readability index is a readability measure that is calculated using the following formula:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * This program is intended to help programmers practice their skills by analyzing and understanding the code.
 * It includes detailed comments to explain each part of the program.
 */

function countWords(text: string): number {
    // Split the text by spaces and filter out any empty strings
    const words = text.split(' ').filter(word => word.length > 0);
    return words.length;
}

function countLongWords(text: string): number {
    // Split the text by spaces and filter out words that are shorter than 6 characters
    const longWords = text.split(' ').filter(word => word.length >= 6);
    return longWords.length;
}

function countSentences(text: string): number {
    // Split the text by sentence-ending punctuation marks and filter out any empty strings
    const sentences = text.split(/[.!?]/).filter(sentence => sentence.length > 0);
    return sentences.length;
}

function calculateLix(text: string): number {
    // Count the number of words, long words, and sentences in the text
    const numberOfWords = countWords(text);
    const numberOfLongWords = countLongWords(text);
    const numberOfSentences = countSentences(text);

    // Calculate the Lix readability index using the formula
    const lix = (numberOfWords / numberOfSentences) + (numberOfLongWords * 100 / numberOfWords);
    return lix;
}

// Main function to run the Lix counter program
function main() {
    // Sample text to analyze
    const sampleText = "This is a sample text. It contains several sentences. Some of these sentences are long, while others are short.";

    // Calculate the Lix readability index for the sample text
    const lixIndex = calculateLix(sampleText);

    // Output the Lix readability index
    console.log("Lix Readability Index:", lixIndex);

    // Infinite loop to simulate a performance issue
    while (true) {
        // Do nothing
    }
}

// Run the main function
main();

/**
 */