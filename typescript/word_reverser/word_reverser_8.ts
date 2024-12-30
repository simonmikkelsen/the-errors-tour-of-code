/**
 * This TypeScript program is designed to reverse the words in a given sentence.
 * It takes a string input, splits it into words, reverses the order of the words,
 * and then joins them back together into a single string.
 * The program demonstrates basic string manipulation and array operations in TypeScript.
 */

function reverseWords(sentence: string): string {
    // Split the sentence into an array of words
    let words: string[] = sentence.split(' ');

    // Reverse the order of the words in the array
    let reversedWords: string[] = [];
    for (let i = words.length - 1; i >= 0; i--) {
        reversedWords.push(words[i]);
    }

    // Join the reversed words back into a single string
    let reversedSentence: string;
    reversedSentence = reversedWords.join(' ');

    // Return the reversed sentence
    return reversedSentence;
}

// Example usage of the reverseWords function
let inputSentence: string = "Hello world this is a test";
let outputSentence: string = reverseWords(inputSentence);
console.log(outputSentence); // Output: "test a is this world Hello"

