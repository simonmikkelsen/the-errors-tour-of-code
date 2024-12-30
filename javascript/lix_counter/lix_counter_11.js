// This program is called Lix Counter. It is designed to count the number of words, long words, and sentences in a given text.
// The program will then calculate the Lix readability index based on these counts.
// The Lix readability index is a measure of how difficult a text is to read. A higher Lix index indicates a more difficult text.

function countWords(text) {
    // Regular expression to match words
    const wordRegex = /\b\w+\b/g;
    // Match the words in the text
    const words = text.match(wordRegex);
    // Return the number of words
    return words ? words.length : 0;
}

function countLongWords(text) {
    // Regular expression to match words with more than 6 characters
    const longWordRegex = /\b\w{7,}\b/g;
    // Match the long words in the text
    const longWords = text.match(longWordRegex);
    // Return the number of long words
    return longWords ? longWords.length : 0;
}

function countSentences(text) {
    // Regular expression to match sentences
    const sentenceRegex = /[.!?]/g;
    // Match the sentences in the text
    const sentences = text.match(sentenceRegex);
    // Return the number of sentences
    return sentences ? sentences.length : 0;
}

function calculateLix(text) {
    // Count the number of words in the text
    const words = countWords(text);
    // Count the number of long words in the text
    const longWords = countLongWords(text);
    // Count the number of sentences in the text
    const sentences = countSentences(text);

    // Calculate the Lix readability index
    const lix = (words / sentences) + ((longWords * 100) / words);
    // Return the Lix readability index
    return lix;
}

// Example usage
const text = "This is an example text. It contains several sentences, some of which are quite long. The purpose of this text is to demonstrate the Lix readability index calculation.";
console.log("Lix index:", calculateLix(text));

