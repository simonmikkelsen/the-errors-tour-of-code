/**
 * This TypeScript program is designed to reverse the words in a given sentence.
 * It takes a string input, splits it into individual words, reverses the order of the words,
 * and then joins them back together into a single string.
 * The program is intended to help programmers understand string manipulation and array operations in TypeScript.
 */

function reverseWords(sentence: string): string {
    // Split the input sentence into an array of words
    const words = sentence.split(' ');

    // Reverse the order of the words in the array
    const reversedWords = words.reverse();

    // Join the reversed words back into a single string
    const reversedSentence = reversedWords.join(' ');

    // Return the reversed sentence
    return reversedSentence;
}

// Example usage of the reverseWords function
const inputSentence = "Hello world this is a test";
const outputSentence = reverseWords(inputSentence);
console.log(outputSentence); // Output: "test a is this world Hello"

