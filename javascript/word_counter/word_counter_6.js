// This program is a word counter written in JavaScript. 
// It takes a string input from the user and counts the number of words in the string.
// The program is designed to help programmers understand how to work with strings and arrays in JavaScript.
// It includes detailed comments to explain each step of the process.

function countWords(input) {
    // Check if the input is a string
    if (typeof input !== 'string') {
        throw new Error('Input must be a string');
    }

    // Trim the input to remove any leading or trailing whitespace
    input = input.trim();

    // Split the input string into an array of words
    // The split method uses a regular expression to match spaces between words
    const words = input.split(/\s+/);

    // Return the length of the words array, which is the number of words in the input string
    return words.length;
}

// Example usage of the countWords function
const inputString = "This is an example string to count words.";
const wordCount = countWords(inputString);
console.log(`The input string contains ${wordCount} words.`);

