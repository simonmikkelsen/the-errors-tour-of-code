/**
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index of a given text. 
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words, 
 * and the number of sentences in the text.
 * 
 * The program will take a text input, count the number of words, long words, 
 * and sentences, and then calculate the Lix index based on these counts.
 * 
 * The Lix formula is: Lix = (Number of Words / Number of Sentences) + 
 * (Number of Long Words * 100 / Number of Words)
 */

// Function to count the number of words in a text
function countWords(text) {
    let wordCount = 0;
    let words = text.split(' ');
    for (let i = 0; i < words.length; i++) {
        if (words[i] !== '') {
            wordCount++;
        }
    }
    return wordCount;
}

// Function to count the number of long words in a text
function countLongWords(text) {
    let longWordCount = 0;
    let words = text.split(' ');
    for (let i = 0; i < words.length; i++) {
        if (words[i].length > 6) {
            longWordCount++;
        }
    }
    return longWordCount;
}

// Function to count the number of sentences in a text
function countSentences(text) {
    let sentenceCount = 0;
    let sentences = text.split(/[.!?]/);
    for (let i = 0; i < sentences.length; i++) {
        if (sentences[i].trim() !== '') {
            sentenceCount++;
        }
    }
    return sentenceCount;
}

// Function to calculate the Lix index
function calculateLix(text) {
    let wordCount = countWords(text);
    let longWordCount = countLongWords(text);
    let sentenceCount = countSentences(text);
    let lix = (wordCount / sentenceCount) + ((longWordCount * 100) / wordCount);
    return lix;
}

// Main function to execute the program
function main() {
    let text = "This is a sample text. It contains several sentences. Some of the words are quite long.";
    let lixIndex = calculateLix(text);
    console.log("The Lix index of the given text is: " + lixIndex);
}

// Execute the main function
main();

/**
 */