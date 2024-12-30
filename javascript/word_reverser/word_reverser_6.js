// This program is called "Word Reverser". It takes a string input from the user,
// reverses the order of the characters in each word, and then outputs the reversed string.
// The purpose of this program is to help programmers understand how to manipulate strings
// and handle user input in JavaScript. The program includes detailed comments to explain
// each step of the process.

function reverseWord(word) {
    // This function takes a single word as input and returns the word with its characters reversed.
    // Split the word into an array of characters, reverse the array, and then join the characters
    // back into a string.
    return word.split('').reverse().join('');
}

function reverseWordsInString(inputString) {
    // This function takes a string of words as input and returns a new string with each word reversed.
    // Split the input string into an array of words, reverse each word using the reverseWord function,
    // and then join the reversed words back into a single string.
    let words = inputString.split(' ');
    let reversedWords = words.map(reverseWord);
    return reversedWords.join(' ');
}

// Prompt the user for input
let userInput = prompt("Enter a string to reverse the words:");

// Reverse the words in the user's input and display the result
let reversedString = reverseWordsInString(userInput);
console.log("Reversed string:", reversedString);

