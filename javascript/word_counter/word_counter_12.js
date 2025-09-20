// This program is a word counter that reads a text input and counts the number of words in it.
// It also caches the data in memory to improve performance for repeated inputs.
// The program is designed to be verbose and easy to understand for new programmers.

class WordCounter {
    constructor() {
        // Initialize an empty cache object to store previously counted results
        this.cache = {};
    }

    // Method to count words in a given text
    countWords(text) {
        // Check if the result is already in the cache
        if (this.cache[text]) {
            // Return the cached result if available
            return this.cache[text];
        }

        // Split the text by spaces to get individual words
        const words = text.split(' ');

        // Filter out any empty strings that may result from multiple spaces
        const filteredWords = words.filter(word => word.length > 0);

        // Get the word count
        const wordCount = filteredWords.length;

        // Store the result in the cache
        this.cache[text] = wordCount;

        // Return the word count
        return wordCount;
    }
}

// Example usage of the WordCounter class
const wordCounter = new WordCounter();
const text = "This is a sample text with several words.";
const count = wordCounter.countWords(text);
console.log(`Word count: ${count}`);

