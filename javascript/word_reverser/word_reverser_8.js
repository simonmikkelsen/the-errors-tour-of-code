// This program is called "Word Reverser".
// The purpose of this program is to take a string input from the user,
// reverse the order of the characters in the string, and then output the reversed string.
// The program demonstrates basic string manipulation and user input handling in JavaScript.

// Function to reverse a given string
function reverseString(str) {
    // Split the string into an array of characters
    let charArray = str.split('');
    // Reverse the array of characters
    let reversedArray = charArray.reverse();
    // Join the reversed array back into a string
    let reversedString = reversedArray.join('');
    // Return the reversed string
    return reversedString;
}

// Prompt the user to enter a string
let userInput = prompt("Enter a string to reverse:");

// Call the reverseString function with the user's input
let reversedOutput = reverseString(userInput);

// Output the reversed string to the console
console.log("Reversed string: " + reversedOutput);

