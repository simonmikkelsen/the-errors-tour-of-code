/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, long words, and sentences in a given text.
 * It calculates the Lix readability index based on these counts.
 * The Lix readability index is a measure of how difficult a text is to read.
 * 
 * The formula for Lix is:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A word is considered long if it has more than 6 characters.
 * 
 * The program will take a text input and output the Lix readability index.
 */

function lixCounter(text) {
    // Split the text into words using spaces and punctuation as delimiters
    let words = text.split(/\s+/);
    let wordCount = words.length;

    // Initialize counters for long words and sentences
    let longWordCount = 0;
    let sentenceCount = 0;

    // Loop through each word to count long words and sentences
    for (let i = 0; i < wordCount; i++) {
        let word = words[i];

        // Check if the word is long
        if (word.length > 6) {
            longWordCount++;
        }

        // Check if the word ends with a sentence-ending punctuation
        if (word.endsWith('.') || word.endsWith('!') || word.endsWith('?')) {
            sentenceCount++;
        }
    }

    // Calculate the Lix readability index
    let lix = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount);

    // Return the Lix readability index
    return lix;
}

// Example usage of the lixCounter function
let text = "This is an example text. It contains several sentences. Some of the words are quite long, while others are short.";
console.log("Lix Readability Index:", lixCounter(text));

