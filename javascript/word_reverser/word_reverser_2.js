// This program is called "Word Reverser". 
// The purpose of this program is to take a string input from the user, 
// reverse the order of the words in the string, and then output the reversed string.
// The program is designed to help programmers understand how to manipulate strings and arrays in JavaScript.

function reverseWords(input) {
    // Split the input string into an array of words
    let wordsArray = input.split(' ');

    // Reverse the order of the words in the array
    let reversedArray = wordsArray.reverse();

    // Join the reversed array of words back into a single string
    let reversedString = reversedArray.join(' ');

    // Return the reversed string
    return reversedString;
}

// Example usage of the reverseWords function
let inputString = "Hello world this is a test";
let outputString = reverseWords(inputString);

// Output the reversed string to the console
console.log(outputString);

