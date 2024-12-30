/**
 * Lix Counter Program
 * 
 * This program is designed to calculate the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, the number of long words (more than 6 letters),
 * and the number of sentences in the text.
 * 
 * The program uses regular expressions extensively to identify words, long words, and sentences.
 * Detailed comments are provided to explain each step of the process.
 */

class LixCounter {
    private text: string;

    constructor(text: string) {
        this.text = text;
    }

    // Method to count the number of words in the text
    private countWords(): number {
        // Regular expression to match words
        const wordRegex = /\b\w+\b/g;
        const words = this.text.match(wordRegex);
        return words ? words.length : 0;
    }

    // Method to count the number of long words (more than 6 letters) in the text
    private countLongWords(): number {
        // Regular expression to match long words
        const longWordRegex = /\b\w{7,}\b/g;
        const longWords = this.text.match(longWordRegex);
        return longWords ? longWords.length : 0;
    }

    // Method to count the number of sentences in the text
    private countSentences(): number {
        // Regular expression to match sentences
        const sentenceRegex = /[.!?]/g;
        const sentences = this.text.match(sentenceRegex);
        return sentences ? sentences.length : 0;
    }

    // Method to calculate the Lix readability index
    public calculateLix(): number {
        const words = this.countWords();
        const longWords = this.countLongWords();
        const sentences = this.countSentences();

        // Lix formula: (number of words / number of sentences) + (number of long words * 100 / number of words)
        const lix = (words / sentences) + ((longWords * 100) / words);
        return lix;
    }
}

// Example usage
const text = "This is an example text. It contains several sentences, some of which are quite long.";
const lixCounter = new LixCounter(text);
console.log(`The Lix readability index of the text is: ${lixCounter.calculateLix()}`);

/***
 */