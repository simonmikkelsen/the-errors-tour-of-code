// Word Counter Program
// This program is designed to count the number of words in a given string.
// It takes a string input from the user and returns the word count.
// The program is useful for text analysis and processing tasks.
// It demonstrates basic string manipulation and iteration in JavaScript.

function countWords(inputString) {
    // Check if the input is a valid string
    if (typeof inputString !== 'string') {
        throw new Error('Input must be a string');
    }

    // Trim the input string to remove leading and trailing whitespace
    let trimmedString = inputString.trim();

    // Split the string into an array of words using space as the delimiter
    let wordsArray = trimmedString.split(' ');

    // Filter out any empty strings from the array
    let filteredWordsArray = wordsArray.filter(function(word) {
        return word.length > 0;
    });

    // Return the length of the filtered array as the word count
    return filteredWordsArray.length;
}

// Example usage of the countWords function
let exampleString = "This is an example string to count words.";
console.log("Word count:", countWords(exampleString));

