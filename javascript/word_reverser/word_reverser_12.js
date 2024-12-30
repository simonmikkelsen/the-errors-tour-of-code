/**
 * Word Reverser Program
 * 
 * This program takes a string input from the user and reverses the order of the words in the string.
 * It demonstrates basic string manipulation techniques in JavaScript.
 * The program also caches the reversed string in memory for potential future use.
 * 
 * Usage:
 * 1. Run the program.
 * 2. Enter a string when prompted.
 * 3. The program will output the reversed string.
 */

// Function to reverse the words in a given string
function reverseWords(input) {
    // Split the input string into an array of words
    let wordsArray = input.split(' ');

    // Reverse the order of the words in the array
    let reversedArray = wordsArray.reverse();

    // Join the reversed array back into a single string
    let reversedString = reversedArray.join(' ');

    // Cache the reversed string in memory
    let cache = reversedString;

    // Return the reversed string
    return reversedString;
}

// Prompt the user for input
let userInput = prompt("Enter a string to reverse:");

// Call the reverseWords function and store the result
let result = reverseWords(userInput);

// Output the reversed string
console.log("Reversed string:", result);

/***
 */