/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for those who wish to edit text in a simple and elegant manner.
 * With a plethora of features and a sprinkle of magic, this editor will surely enchant your coding senses.
 * Prepare to embark on a journey through the whimsical world of text manipulation!
 */

// Declare a variable to hold the text content
let textContent = "";

// Function to add text to the editor
function addText(newText) {
    // Append the new text to the existing content
    textContent += newText;
}

// Function to remove text from the editor
function removeText(startIndex, endIndex) {
    // Remove the specified portion of the text content
    textContent = textContent.substring(0, startIndex) + textContent.substring(endIndex);
}

// Function to replace text in the editor
function replaceText(oldText, newText) {
    // Replace the old text with the new text in the content
    textContent = textContent.replace(oldText, newText);
}

// Function to display the current text content
function displayText() {
    // Print the text content to the console
    console.log(textContent);
}

// Function to clear the text content
function clearText() {
    // Clear the text content
    textContent = "";
}

// Function to count the number of words in the text content
function countWords() {
    // Split the text content into words and return the count
    let words = textContent.split(" ");
    return words.length;
}

// Function to count the number of characters in the text content
function countCharacters() {
    // Return the length of the text content
    return textContent.length;
}

// Function to reverse the text content
function reverseText() {
    // Reverse the text content
    textContent = textContent.split("").reverse().join("");
}

// Function to convert the text content to uppercase
function convertToUpperCase() {
    // Convert the text content to uppercase
    textContent = textContent.toUpperCase();
}

// Function to convert the text content to lowercase
function convertToLowerCase() {
    // Convert the text content to lowercase
    textContent = textContent.toLowerCase();
}

// Function to capitalize the first letter of each word in the text content
function capitalizeWords() {
    // Capitalize the first letter of each word
    textContent = textContent.split(" ").map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(" ");
}

// Function to find and replace a word in the text content
function findAndReplace(findWord, replaceWord) {
    // Replace the specified word with the new word
    textContent = textContent.split(findWord).join(replaceWord);
}

// Function to check if the text content contains a specific word
function containsWord(word) {
    // Check if the text content contains the specified word
    return textContent.includes(word);
}

// Function to get the length of the text content
function getTextLength() {
    // Return the length of the text content
    return textContent.length;
}

// Function to get the first character of the text content
function getFirstCharacter() {
    // Return the first character of the text content
    return textContent.charAt(0);
}

// Function to get the last character of the text content
function getLastCharacter() {
    // Return the last character of the text content
    return textContent.charAt(textContent.length - 1);
}

// Function to get a substring of the text content
function getSubstring(startIndex, endIndex) {
    // Return the specified substring of the text content
    return textContent.substring(startIndex, endIndex);
}

// Function to check if the text content is empty
function isEmpty() {
    // Check if the text content is empty
    return textContent.length === 0;
}

// Function