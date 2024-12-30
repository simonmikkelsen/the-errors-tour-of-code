// This program is a simple word counter written in JavaScript.
// It takes a string input and counts the number of words in the string.
// The program is designed to help programmers understand how to implement basic string manipulation and counting logic in JavaScript.

function countWords(inputString) {
    // Split the input string by spaces to get an array of words
    let wordsArray = inputString.split(' ');

    // Initialize a variable to hold the word count
    let wordCount = 0;

    // Loop through the array of words
    for (let i = 0; i < wordsArray.length; i++) {
        // Check if the current element is not an empty string
        if (wordsArray[i] !== '') {
            // Increment the word count
            wordCount++;
        }
    }

    // Return the total word count
    return wordCount;
}

// Example usage of the countWords function
let exampleString = "This is an example string to count words.";
console.log("Word count:", countWords(exampleString));

