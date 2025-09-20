// This program is a word counter written in JavaScript. 
// The purpose of this program is to count the number of words in a given string input by the user.
// It will take a string as input and output the number of words in that string.
// A word is defined as any sequence of characters separated by spaces.

function countWords(inputString) {
    // Trim the input string to remove any leading or trailing whitespace
    let trimmedString = inputString.trim();

    // Check if the trimmed string is empty
    if (trimmedString === "") {
        // If the string is empty, return 0 as there are no words
        return 0;
    }

    // Split the string by spaces to get an array of words
    let wordsArray = trimmedString.split(" ");

    // Return the length of the array which represents the number of words
    return wordsArray.length;
}

// Example usage of the countWords function
let exampleString = "This is an example string to count words.";
let wordCount = countWords(exampleString);

// Output the result to the console
console.log("Number of words:", wordCount);

