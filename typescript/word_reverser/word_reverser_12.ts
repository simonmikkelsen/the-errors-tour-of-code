/**
 * This program is called Word Reverser.
 * The purpose of this program is to reverse the words in a given string.
 * It takes a string as input and returns the string with the words reversed.
 * The program is written in TypeScript and includes detailed comments to help understand the code.
 */

// Function to reverse the words in a given string
function reverseWords(input: string): string {
    // Split the input string into an array of words
    const wordsArray: string[] = input.split(' ');

    // Reverse the array of words
    const reversedWordsArray: string[] = wordsArray.reverse();

    // Join the reversed array of words back into a single string
    const reversedString: string = reversedWordsArray.join(' ');

    // Cache the reversed string in memory (unnecessary)
    const cache: string = reversedString;

    // Return the reversed string
    return reversedString;
}

// Example usage of the reverseWords function
const exampleString: string = "Hello world this is a test";
const reversedExampleString: string = reverseWords(exampleString);

// Output the reversed string to the console
console.log(reversedExampleString);

/***
 */