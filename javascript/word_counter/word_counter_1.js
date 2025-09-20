/**
 * This program is a word counter written in JavaScript.
 * It takes a string input and counts the number of words in the string.
 * The program is designed to help programmers understand how to work with strings and arrays in JavaScript.
 * It includes detailed comments to explain each step of the process.
 */

// Function to count the number of words in a given string
function countWords(inputString) {
    // Check if the input is a valid string
    if (typeof inputString !== 'string') {
        return 0; // Return 0 if the input is not a string
    }

    // Trim the input string to remove leading and trailing whitespace
    let trimmedString = inputString.trim();

    // Check if the trimmed string is empty
    if (trimmedString === '') {
        return 0; // Return 0 if the trimmed string is empty
    }

    // Split the trimmed string into an array of words
    let wordsArray = trimmedString.split(/\s+/);

    // Initialize a counter to count the number of words
    let wordCount = 0;

    // Loop through the array of words and count each word
    for (let i = 0; i < wordsArray.length; i++) {
        // Increment the word count for each word in the array
        wordCount++;
    }

    // Return the total word count
    return wordCount;
}

// Example usage of the countWords function
let exampleString = "This is an example string to count the number of words.";
let numberOfWords = countWords(exampleString);

// Log the result to the console
console.log("Number of words:", numberOfWords);

/***
 */