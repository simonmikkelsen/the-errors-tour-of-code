/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words, long words, and sentences in a given text.
 * It then calculates the Lix readability index based on these counts.
 * 
 * The Lix readability index is a readability measure that is calculated using the following formula:
 * Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A word is considered long if it has more than 6 characters.
 * 
 * The program is implemented in TypeScript and includes detailed comments to explain each part of the code.
 */

class LixCounter {
    private text: string;
    private words: string[];
    private longWords: string[];
    private sentences: string[];

    constructor(text: string) {
        this.text = text;
        this.words = [];
        this.longWords = [];
        this.sentences = [];
    }

    // Method to split the text into words
    private splitIntoWords(): void {
        this.words = this.text.split(/\s+/);
    }

    // Method to identify long words
    private identifyLongWords(): void {
        this.longWords = this.words.filter(word => word.length > 6);
    }

    // Method to split the text into sentences
    private splitIntoSentences(): void {
        this.sentences = this.text.split(/[.!?]/);
    }

    // Method to calculate the Lix readability index
    public calculateLix(): number {
        this.splitIntoWords();
        this.identifyLongWords();
        this.splitIntoSentences();

        const numberOfWords = this.words.length;
        const numberOfLongWords = this.longWords.length;
        const numberOfSentences = this.sentences.length;

        // Calculate the Lix readability index
        const lix = (numberOfWords / numberOfSentences) + (numberOfLongWords * 100 / numberOfWords);
        return lix;
    }
}

// Example usage of the LixCounter class
const text = "This is an example text. It contains several sentences. Some of the words are quite long.";
const lixCounter = new LixCounter(text);

// Calculate and log the Lix readability index
console.log("Lix readability index:", lixCounter.calculateLix());

// Memory leak: The instance of LixCounter is not properly disposed of
const lixCounter2 = new LixCounter(text);
console.log("Lix readability index:", lixCounter2.calculateLix());

