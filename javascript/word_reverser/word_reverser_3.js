/**
 * This program is called Word Reverser.
 * The purpose of this program is to reverse the words in a given string.
 * It takes a string input from the user, splits the string into words,
 * reverses the order of the words, and then joins them back together
 * to form the reversed string.
 * The program demonstrates basic string manipulation and array operations
 * in JavaScript.
 */

// Function to reverse the words in a given string
function reverseWords(input) {
    // Split the input string into an array of words
    let words = input.split(' ');

    // Reverse the order of the words in the array
    let reversedWords = words.reverse();

    // Join the reversed words back into a single string
    let reversedString = reversedWords.join(' ');

    // Return the reversed string
    return reversedString;
}

// Main function to execute the word reverser program
function main() {
    // Prompt the user to enter a string
    let input = prompt("Enter a string to reverse its words:");

    // Call the reverseWords function with the user input
    let result = reverseWords(input);

    // Display the reversed string to the user
    alert("Reversed string: " + result);
}

// Call the main function to run the program
main();

