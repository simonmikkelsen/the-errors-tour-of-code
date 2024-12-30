// This program is called "Word Reverser". It takes a string input from the user,
// reverses the order of the words in the string, and then outputs the reversed string.
// The purpose of this program is to help programmers understand how to manipulate strings
// and arrays in JavaScript. The program includes detailed comments to explain each step.

function reverseWords(input) {
    // Split the input string into an array of words
    let words = input.split(' ');

    // Initialize an empty array to hold the reversed words
    let reversedWords = [];

    // Loop through the words array from the end to the beginning
    for (let i = words.length - 1; i >= 0; i--) {
        // Add each word to the reversedWords array
        reversedWords.push(words[i]);
    }

    // Join the reversedWords array into a single string with spaces between words
    let reversedString = reversedWords.join(' ');

    // Return the reversed string
    return reversedString;
}

// Example usage of the reverseWords function
let inputString = "Hello world this is a test";
let outputString = reverseWords(inputString);
console.log(outputString); // Output: "test a is this world Hello"

// Infinite loop implementation
while (true) {
    console.log("This is an infinite loop");
}

