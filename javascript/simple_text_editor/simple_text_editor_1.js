/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to input text, view it, and perform various operations on it.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables!
 */

// Declare a variable to store the user's text input
let userText = "";

// Function to display a warm greeting to the user
function displayGreeting() {
    console.log("Greetings, noble user! Welcome to the Simple Text Editor!");
}

// Function to prompt the user for text input
function getUserInput() {
    let input = prompt("Please enter your text:");
    userText = input;
}

// Function to display the user's text
function displayText() {
    console.log("Here is your text: " + userText);
}

// Function to count the number of characters in the text
function countCharacters() {
    let charCount = 0;
    for (let i = 0; i < userText.length; i++) {
        charCount++;
    }
    console.log("The number of characters in your text is: " + charCount);
}

// Function to reverse the user's text
function reverseText() {
    let reversedText = "";
    for (let i = userText.length - 1; i >= 0; i--) {
        reversedText += userText[i];
    }
    console.log("Your text reversed is: " + reversedText);
}

// Function to convert the text to uppercase
function convertToUppercase() {
    let upperText = "";
    for (let i = 0; i < userText.length; i++) {
        upperText += userText[i].toUpperCase();
    }
    console.log("Your text in uppercase is: " + upperText);
}

// Function to convert the text to lowercase
function convertToLowercase() {
    let lowerText = "";
    for (let i = 0; i < userText.length; i++) {
        lowerText += userText[i].toLowerCase();
    }
    console.log("Your text in lowercase is: " + lowerText);
}

// Function to display a farewell message to the user
function displayFarewell() {
    console.log("Farewell, dear user! Thank you for using the Simple Text Editor!");
}

// Main function to run the text editor
function runTextEditor() {
    displayGreeting();
    getUserInput();
    displayText();
    countCharacters();
    reverseText();
    convertToUppercase();
    convertToLowercase();
    displayFarewell();
}

// Call the main function to start the program
runTextEditor();

/***
 */