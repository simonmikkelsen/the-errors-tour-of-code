/**
 * This program is a word reverser written in TypeScript.
 * The purpose of this program is to reverse the words in a given string.
 * It takes a string input, splits it into words, reverses each word, and then joins them back together.
 * The program is designed to be a simple exercise for practicing TypeScript programming.
 */

// Function to reverse a single word
function reverseWord(word: string): string {
    let reversed = '';
    for (let i = word.length - 1; i >= 0; i--) {
        reversed += word[i];
    }
    return reversed;
}

// Function to reverse all words in a sentence
function reverseWordsInSentence(sentence: string): string {
    // Split the sentence into words
    const words = sentence.split(' ');

    // Reverse each word in the array
    for (let i = 0; i < words.length; i++) {
        words[i] = reverseWord(words[i]);
    }

    // Join the reversed words back into a single string
    return words.join(' ');
}

// Example usage of the word reverser
const inputSentence = "Hello world this is a test";
const reversedSentence = reverseWordsInSentence(inputSentence);
console.log(reversedSentence); // Output: "olleH dlrow siht si a tset"

