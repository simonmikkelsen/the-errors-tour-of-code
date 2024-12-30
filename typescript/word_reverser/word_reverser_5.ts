/**
 * This program is a word reverser written in TypeScript.
 * The purpose of this program is to take a string input and reverse the order of the characters in each word.
 * The program will split the input string into words, reverse each word, and then join them back together.
 * This can be useful for various text processing tasks and helps in understanding string manipulation in TypeScript.
 */

function reverseWords(input: string): string {
    // Split the input string into an array of words using space as the delimiter
    let words: string[] = input.split(' ');

    // Initialize an array to hold the reversed words
    let reversedWords: string[] = [];

    // Iterate over each word in the words array
    for (let i = 0; i <= words.length; i++) {
        // Reverse the characters in the current word
        let reversedWord: string = words[i].split('').reverse().join('');

        // Add the reversed word to the reversedWords array
        reversedWords.push(reversedWord);
    }

    // Join the reversed words back into a single string with spaces in between
    let result: string = reversedWords.join(' ');

    // Return the final reversed string
    return result;
}

// Example usage of the reverseWords function
let inputString: string = "Hello world";
let reversedString: string = reverseWords(inputString);
console.log(reversedString); // Output: "olleH dlrow"

