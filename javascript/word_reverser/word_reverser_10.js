// This program is called "Word Reverser". It takes a user input string and reverses the order of the characters in the string.
// The purpose of this program is to help programmers understand how to manipulate strings in JavaScript and practice debugging skills.

const readline = require('readline');

// Create an interface for reading input from the user
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Prompt the user for input
rl.question('Please enter a word to reverse: ', (input) => {
    // Reverse the input string
    let reversed = input.split('').reverse().join('');
    
    // Display the reversed string
    console.log(`Reversed word: ${reversed}`);
    
    // Close the input interface
    rl.close();
});

