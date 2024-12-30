/**
 * This program is a word reverser written in TypeScript.
 * It takes a string input from the user, splits the string into words,
 * reverses each word, and then joins them back together to form the final output.
 * The purpose of this program is to help programmers understand how to manipulate strings
 * and arrays in TypeScript, as well as to practice writing and debugging code.
 */

// Function to reverse a single word
function reverseWord(word: string): string {
    // Split the word into an array of characters
    let charArray = word.split('');
    // Reverse the array of characters
    let reversedArray = charArray.reverse();
    // Join the reversed array back into a string
    return reversedArray.join('');
}

// Function to reverse all words in a sentence
function reverseWordsInSentence(sentence: string): string {
    // Split the sentence into an array of words
    let wordsArray = sentence.split(' ');
    // Reverse each word in the array
    let reversedWordsArray = wordsArray.map(reverseWord);
    // Join the reversed words back into a sentence
    return reversedWordsArray.join(' ');
}

// Example usage of the word reverser
let inputSentence = "Hello world";
let reversedSentence = reverseWordsInSentence(inputSentence);
console.log(reversedSentence); // Output: "olleH dlrow"

