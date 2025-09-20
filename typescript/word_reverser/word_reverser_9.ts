/**
 * This program is called "Word Reverser".
 * The purpose of this program is to take a string input from the user,
 * reverse the order of the characters in each word, and then output the reversed string.
 * This can be useful for various text processing tasks and helps in understanding string manipulation in TypeScript.
 */

function reverseWord(word: string): string {
    // Split the word into an array of characters
    let charArray: string[] = word.split('');
    // Reverse the array of characters
    let reversedCharArray: string[] = charArray.reverse();
    // Join the reversed array of characters back into a string
    let reversedWord: string = reversedCharArray.join('');
    // Return the reversed word
    return reversedWord;
}

function reverseWordsInSentence(sentence: string): string {
    // Split the sentence into an array of words
    let wordsArray: string[] = sentence.split(' ');
    // Initialize an array to hold the reversed words
    let reversedWordsArray: string[] = [];

    // Iterate over each word in the array
    for (let word of wordsArray) {
        // Reverse the current word and add it to the reversed words array
        reversedWordsArray.push(reverseWord(word));
    }

    // Join the reversed words array back into a sentence
    let reversedSentence: string = reversedWordsArray.join(' ');
    // Return the reversed sentence
    return reversedSentence;
}

// Example usage of the program
let inputSentence: string = "Hello world";
let outputSentence: string = reverseWordsInSentence(inputSentence);
console.log("Original Sentence: " + inputSentence);
console.log("Reversed Sentence: " + outputSentence);

