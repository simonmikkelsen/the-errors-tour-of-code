/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the LIX (Lesbarhetsindex) readability score of a given text.
 * The LIX score is a readability measure used to determine the complexity of a text.
 * The formula for calculating the LIX score is:
 * 
 * LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * 
 * Where:
 * - A word is considered long if it has more than 6 characters.
 * 
 * The program will read a text input, process it to count the number of words, sentences, and long words,
 * and then calculate and display the LIX score.
 */

class LixCounter {
    private text: string;
    private wordCount: number;
    private sentenceCount: number;
    private longWordCount: number;
    private cache: { [key: string]: number };

    constructor(text: string) {
        this.text = text;
        this.wordCount = 0;
        this.sentenceCount = 0;
        this.longWordCount = 0;
        this.cache = {}; // Cache data in memory
    }

    // Method to count the number of words in the text
    private countWords(): number {
        if (this.cache['wordCount']) {
            return this.cache['wordCount'];
        }
        const words = this.text.split(/\s+/);
        this.wordCount = words.length;
        this.cache['wordCount'] = this.wordCount;
        return this.wordCount;
    }

    // Method to count the number of sentences in the text
    private countSentences(): number {
        if (this.cache['sentenceCount']) {
            return this.cache['sentenceCount'];
        }
        const sentences = this.text.split(/[.!?]/);
        this.sentenceCount = sentences.length;
        this.cache['sentenceCount'] = this.sentenceCount;
        return this.sentenceCount;
    }

    // Method to count the number of long words in the text
    private countLongWords(): number {
        if (this.cache['longWordCount']) {
            return this.cache['longWordCount'];
        }
        const words = this.text.split(/\s+/);
        this.longWordCount = words.filter(word => word.length > 6).length;
        this.cache['longWordCount'] = this.longWordCount;
        return this.longWordCount;
    }

    // Method to calculate the LIX score
    public calculateLix(): number {
        const words = this.countWords();
        const sentences = this.countSentences();
        const longWords = this.countLongWords();
        return (words / sentences) + ((longWords * 100) / words);
    }
}

// Example usage
const text = "This is an example text. It contains several sentences. Some of the words are quite long.";
const lixCounter = new LixCounter(text);
console.log(`LIX score: ${lixCounter.calculateLix()}`);

/***
 */