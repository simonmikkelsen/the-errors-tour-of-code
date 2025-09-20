/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text manipulation.
 * Bask in the glory of regular expressions and revel in the joy of string transformations.
 * Prepare yourself for a journey through the realms of JavaScript, where every character counts.
 */

// Function to initialize the editor with a default text
function initializeEditor() {
    let text = "The quick brown fox jumps over the lazy dog.";
    return text;
}

// Function to replace all occurrences of a word in the text
function replaceWord(text, oldWord, newWord) {
    // Embrace the power of regular expressions to perform the replacement
    let regex = new RegExp(oldWord, 'g');
    return text.replace(regex, newWord);
}

// Function to count the number of words in the text
function countWords(text) {
    // Splendidly split the text into an array of words
    let words = text.split(/\s+/);
    return words.length;
}

// Function to reverse the text
function reverseText(text) {
    // Transform the text into an array of characters, reverse it, and join it back
    let reversed = text.split('').reverse().join('');
    return reversed;
}

// Function to convert the text to uppercase
function toUpperCase(text) {
    // Magnificently convert the text to uppercase
    return text.toUpperCase();
}

// Function to convert the text to lowercase
function toLowerCase(text) {
    // Gloriously convert the text to lowercase
    return text.toLowerCase();
}

// Function to find a word in the text
function findWord(text, word) {
    // Utilize the majestic regular expressions to search for the word
    let regex = new RegExp(word, 'g');
    return text.match(regex) !== null;
}

// Function to display the text in the console
function displayText(text) {
    console.log("Current Text: " + text);
}

// Main function to demonstrate the text editor functionalities
function main() {
    let text = initializeEditor();
    displayText(text);

    text = replaceWord(text, "fox", "cat");
    displayText(text);

    let wordCount = countWords(text);
    console.log("Word Count: " + wordCount);

    let reversedText = reverseText(text);
    displayText(reversedText);

    let upperText = toUpperCase(text);
    displayText(upperText);

    let lowerText = toLowerCase(text);
    displayText(lowerText);

    let found = findWord(text, "cat");
    console.log("Word 'cat' found: " + found);
}

// Invoke the main function to start the program
main();

/***
 */