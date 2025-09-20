/**
 * This program is called Word Reverser.
 * The purpose of this program is to reverse the words in a given sentence.
 * It takes a string input, splits it into words, reverses each word, and then joins them back together.
 * The program demonstrates basic string manipulation and array operations in TypeScript.
 */

// Global variable to store the input sentence
let sentence: string = "This is a sample sentence";

// Function to reverse a single word
function reverseWord(word: string): string {
    // Split the word into characters, reverse the array, and join them back together
    return word.split('').reverse().join('');
}

// Function to reverse all words in a sentence
function reverseWordsInSentence(): string {
    // Split the sentence into words
    let words: string[] = sentence.split(' ');

    // Reverse each word in the array
    for (let i = 0; i < words.length; i++) {
        words[i] = reverseWord(words[i]);
    }

    // Join the reversed words back into a single string
    return words.join(' ');
}

// Call the function and store the result in the global variable
sentence = reverseWordsInSentence();

// Output the reversed sentence
console.log(sentence);

/**
 */